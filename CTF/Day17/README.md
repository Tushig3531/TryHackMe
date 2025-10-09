## **Room:** [Neighbour](https://tryhackme.com/room/neighbour)
### [**Streak**](https://tryhackme.com/Tushig3531/streak) 
---
> **Prompt**
>
> > Check out our new cloud service, Authentication Anywhere -- log in from anywhere you would like! Users can enter their username and password, for a totally secure login process! You definitely wouldn't be able to find any secrets that other people have in their profile, right?

> > Access this challenge by deploying both the vulnerable machine by pressing the green "Start Machine" button located within this task, and the TryHackMe AttackBox by pressing the  "Start AttackBox" button located at the top-right of the page.

> > Navigate to the following URL using the AttackBox: http://MACHINE_IP

Host: 10.201.85.126
---
Message: Today, I was personally so tired while having a lot of school work. I completed 5-min room to remain my consistancy into the challenge. I hope tomorrow will be better and show more progress. Therefore, today I reached level 5, aka VISIONARY and so far, I have completed 27 rooms including information rooms. So far I am happy for my progress. "Trying to be 1 cm better than yesterday me"
---
## Walkthrough
So, I started simply going into the website: http://10.201.85.126, and it told me to Ctrl+U to see login. So I followed the insturction, there it said:
```text
use guest:guest credentials until registration is fixed
```
Thus, I used guest as an username and password. And logged in the system.
Then I simple changed the guest url into admin, and found the flag of the day:
flag{66be95c478473d91a5358f2440c7af1f}







