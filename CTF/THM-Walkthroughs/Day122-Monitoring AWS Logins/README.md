## Day 122
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Monitoring AWS Logins**](https://tryhackme.com/room/monitoringawslogins)

---

> Today, I am learning AWS Cloud Security.

Monitoring the control plane is the first step in securing our cloud environment. And within the control plane, authentication is the first area to focus on.

### IAM and User Credentials

AWS Identity and Access Management (IAM) is a service that allows us to create cloud users, define policies and permissions, manage access to AWS resources, and much more.

**Key Components:**
- **IAM User** : a person or application that needs AWS access, just like an Active Directory user
- **IAM Group** : a collection of IAM Users, such as "EU DevOps Team" or "IT Support Contractors"
- **IAM Role** : an AWS identity that can be assumed by users or AWS services
- **IAM Policy** : a JSON document that defines permissions attached to users, groups, or roles

### Three Ways to Log In

**1) Web console (for humans)**

We make an IAM user (not root), give them a policy, and they log in on the AWS website with account ID, username, password, and MFA.

![Console](image-2.png)

**2) Access keys (for code and CLI)**

For scripts or the aws command, we use an access key.
- Key ID (AKIA...) : okay to share, like a username
- Secret : private, like a password

Access keys never expire, so if one leaks, an attacker has full access until someone deletes it.

![Keys](image-1.png)

**3) Roles (the safe way)**

Say we have an EC2 server that edits images in S3. Instead of putting a key in the code, we attach a role to the server. AWS then gives it temporary STS credentials automatically.

Why roles are better:
- Credentials expire after a few hours
- Nothing is saved in files, so nothing leaks to GitHub
- We can limit them to certain IPs or resources

![Roles](image.png)

**Other logins**

SSO options like Google Workspace, Active Directory, or IAM Identity Center all end up doing the same thing: assuming a role and getting temporary STS credentials.

**Why it matters for a SOC analyst:**

Keys starting with AKIA are long term and riskier. Temporary ones start with ASIA. When we see access key activity in CloudTrail, ask whether that user or app should really be using it from there.

### Monitoring Console Logins

**Why watch logins?**

Brute force is rare, MFA blocks most of it. The real danger is phishing: an attacker sends a fake email like "Your AWS account is suspended, pay now," the victim types their password into a fake AWS page, and the attacker logs in for real. After that they steal data, mine crypto, or delete things for ransom.

**Where to look**

Every console login is saved in CloudTrail as the event `ConsoleLogin`. For each one, check:
- Is the source IP normal or suspicious?
- Is the time, location, and browser normal for this user?
- What did they do right after logging in?

Example log:

```bash
// Most important fields of the ConsoleLogin event
{
  "eventTime": "2025-12-18T16:48:27Z",
  "eventName": "ConsoleLogin",
  "errorMessage": "Failed authentication",
  "userIdentity": {
    "type": "IAMUser",
    "principalId": "AIDAVZZK4G6EYIICHBXXX",
    "arn": "arn:aws:iam::398985017225:user/john.doe",
    "accountId": "398985017225",
    "userName": "john.doe"
  },
  "sourceIPAddress": "12.42.87.160",
  "userAgent": "Mozilla/5.0 [...]",
  "requestParameters": null,
  "additionalEventData": {
    "LoginTo": "https://console.aws.amazon.com/console/[...]",
    "MobileVersion": "No",
    "MFAUsed": "Yes"
  },
 "recipientAccountId": "398985017225"
}
```

**Key fields:**
- `errorMessage` : if present, the login failed. If missing, it worked
- `userIdentity.userName` / `arn` : who logged in (here, john.doe)
- `sourceIPAddress` : where they came from
- `MFAUsed` : should always be "Yes." "No" is a red flag
- `MobileVersion` : "Yes" means the AWS phone app

**What to alert on:**
- Root user logins. Root is for emergencies only
- Service accounts logging into the console. Apps should use roles or keys, not the website
- Logins from VPN, Tor, or cloud server IPs
- Lots of failed logins on one user. That may mean someone is targeting our company

### Monitoring Access Keys

**Why access keys are risky**

Scripts and tools (Terraform, SIEM connectors) need the key in every request, so developers often save it in plain text in code, .env files, or config files. If anyone finds that file, they have the key, and it doesn't expire.

**How key activity looks different in logs**
- No login event. Keys skip login, so there's no `ConsoleLogin`, we only see the actions
- Less noise. In the console, AWS loads pages, so we see lots of `Get*`, `List*`, `Describe*` events before the real action. With a key, we only see the exact command, like a single `DeleteDBInstance`

**How to tell console vs. key:**
- `accessKeyId` : a key starting with AKIA means a long term access key. The console uses temporary ASIA tokens
- `sessionContext` : console events have it, key events don't
- `userAgent` : the console shows a browser (Mozilla). A key shows a tool like aws-cli, Boto3 (Python), or aws-sdk-java

### Detecting IAM Role Abuse

This part is about IAM roles in the logs, and how to find the real person or machine behind a role.

**What role activity looks like**

When an EC2 server uses a role (like UserAvatarsProcessor), CloudTrail shows:

```bash
// Simplified GetObject request made by the UserAvatarsProcessor role
{
  "eventTime": "2025-12-29T20:28:48Z",
  "eventSource": "s3.amazonaws.com",
  "eventName": "GetObject",
  "sourceIPAddress": "98.93.221.113",                       // Public IP of the EC2 instance
  "userAgent": "Boto3/1.34.46 md/Botocore#1.34.46[...] ",   // Boto3 is AWS client for Python
  "userIdentity": {
    "type": "AssumedRole",                                  // Is always set to "AssumedRole"
    "principalId": "AROAVZZK4G6ERIIVB7K4M:i-123456789",
    "arn": "arn:aws:sts::398985017225:assumed-role/UserAvatarsProcessor/i-123456789",
    "accountId": "398985017225",
    "accessKeyId": "ASIAVZZK4G6E7I2DBMBB",                  // Always starts with "ASIA"
    "sessionContext": { [...] }
  },
}
```

- `type` : always AssumedRole
- `accessKeyId` : starts with ASIA (temporary)
- `arn` : assumed-role/RoleName/SessionName

**The session name (last part of the ARN)**

This usually tells us who used the role:

```text
arn:aws:sts::[account-id]:assumed-role/[role-name]/[session-name]
arn:aws:sts::398985017225:assumed-role/UserAvatarsProcessor/i-123456789  // Likely an EC2 instance ID
arn:aws:sts::398985017225:assumed-role/US-ITSupportRole/john.doe         // Likely an IAM user name
arn:aws:sts::398985017225:assumed-role/SuperAdmin/MyCustomSession        // Need to investigate
```

| ARN ends with | Probably means |
|---|---|
| `/i-123456789` | An EC2 instance |
| `/john.doe` | An IAM user |
| `/MyCustomSession` | Unknown, needs investigating |

The catch: the session name can be anything the user wants. If someone names it MyCustomSession, the logs no longer show their real name.

**Finding the real user: the AssumeRole event**

A role can't act by itself. Someone or something always "puts it on" first. That moment is logged as `AssumeRole`.

```bash
// SuperAdmin role assumed by john.doe
{
  "eventTime": "2025-12-29T22:08:01Z",
  "eventSource": "sts.amazonaws.com",
  "eventName": "AssumeRole",
  "sourceIPAddress": "77.23.56.75",
  "userAgent": "aws-cli/2.31.39 [...]",
  "requestParameters": {
    "roleArn": "arn:aws:iam::398985017225:role/SuperAdmin",
    "roleSessionName": "MyCustomSession"
  },
  "userIdentity": {
    "type": "IAMUser",
    "principalId": "AIDAVZZK4G6E5AAVXXXXX",
    "arn": "arn:aws:iam::398985017225:user/john.doe",
    "accountId": "398985017225",
    "accessKeyId": "AKIAVZZK4G6EXJOXXXXX",
    "userName": "john.doe"
  }
}
```

- `userIdentity.userName` : john.doe (the real person)
- `requestParameters.roleArn` : SuperAdmin (the role he took)
- `roleSessionName` : MyCustomSession (the fake name he chose)

So whenever we see a role doing something suspicious, go back and find its `AssumeRole` event to see who started it.

**Splunk example:**
```bash
index=task eventName=AssumeRole requestParameters.roleSessionName=MyCustomSession
| table eventTime userIdentity.userName requestParameters.roleArn sourceIPAddress
```

**How attackers abuse roles**

If an attacker hacks an EC2 server (say, by SSH brute force), they get the server's role permissions too. If that role can read S3, so can they. This is how the Capital One breach happened (100 million records).

What to watch:
- Sudden user agent changes (like with keys)
- First time API calls, especially ones that download or copy data
- Protect the servers that have roles, because the server is the way in

**Cross account access and role chaining**

In big companies, people jump between roles across accounts:

```text
Sarah → it-support (US) → eu-helpdesk (EU) → rds-read
```

The final action only shows `rds-read`. To find Sarah, we follow the `AssumeRole` events backward, one step at a time, until we reach a real user or service.

![Role Chaining](image-3.png)

### IAM Events to Watch

| What happened | Event names | What to watch for |
|---|---|---|
| Policy changed | `PutUserPolicy`, `PutRolePolicy`, `PutGroupPolicy` | Names that don't match the permissions. Example: a policy called "ReadOnlyAccess" that now allows launching and deleting EC2 servers |
| New permission given | `AttachUserPolicy`, `AttachGroupPolicy`, `AttachRolePolicy`, `AddUserToGroup` | Who gets what. Example: a new intern given `AdministratorAccess` |
| MFA turned off | `DeleteVirtualMFADevice`, `DeactivateMFADevice` | Only okay if a new MFA is set up right after (like when someone loses their phone). If not, it's suspicious |
| Access key created or turned on | `CreateAccessKey`, `UpdateAccessKey` | Always check with IT if it was expected, especially for admin accounts. Leaked keys are the #1 way into AWS |

---

<!-- ![Badge](badge.png) -->