---
author: andreacirilloac
comments: true
date: 2015-08-18 21:47:00+00:00
excerpt: 'ramazon is an R package that lets  you deploy a shiny app on Amazon AWS
  just running a function. '


slug: deploy-your-shiny-app-on-aws-with-a-function
title: 'ramazon: Deploy your Shiny App on AWS with a Function'

tags:
- amazon
- analytics
- aws
- data analysis
- hacking
- R
- shiny
- shiny apps
---

Because [**Afraus** ](https://andreacirilloblog.wordpress.com/2015/07/02/introducing-afraus-an-unsupervised-fraud-detection-algorithm/)received a good interest, last month I override shinyapps.io **[free plan limits](http://www.shinyapps.io/#pricing)**.

That got me move my Shiny App on an **Amazon AWS instance**.

Well, it was not so straight forward: even if there is **plenty of tutorials** around the web, **every one** seems to **miss a part**: upgrading R version, removing shiny-server examples... And even having all info it is still quite a long, **error-prone process**.

All this pain is removed by **ramazon**, an **R package** that I developed to take care of everything is needed **to deploy a shiny app on an AWS instance**. An early disclaimer for Windows users: **only Apple OS X is supported** at the moment.

<!-- more -->

[![How to use ramazon (2)](https://andreacirilloblog.files.wordpress.com/2015/08/how-to-use-ramazon-2.png?w=660)](https://andreacirilloblog.files.wordpress.com/2015/08/how-to-use-ramazon-2.png)


## Using ramazon


As one would expect, **using ramazon is a very pleasant** experience, given that you **just have to run a function**, ramazon(), passing to it the EC2 instance public_DNS and the name of the key pair file downloaded from amazon AWS. Just follow the following steps to deploy your app with ramazon.


### launch an amazon EC2 instance


I am not going to go into details, I can see you are in a hurry to see your app on the Web, I will just show you **screenshoots from the process**.

Be sure to **change all parameters** in accordance with the screenshots.

[slideshare id=51349866&doc=jbqv4twris66dewsqjtv-signature-843c31b3a0f027c947d558b8e4ad422a871c4447d2f87e299cca6a927ccfa4c9-poli-150806144702-lva1-app6892]


#### retrieve the public dns


As shown within the above introduced deck, you can f**ind your Public_dns among the instance details**:[
](https://andreacirilloblog.files.wordpress.com/2015/08/2015-08-06-16_53_12-how-to-launch-an-aws-ec2-instance-pdf-adobe-reader.png) [![public dns](https://andreacirilloblog.files.wordpress.com/2015/08/2015-08-06-16_53_27-how-to-launch-an-aws-ec2-instance-pdf-adobe-reader.png)](https://andreacirilloblog.files.wordpress.com/2015/08/2015-08-06-16_53_27-how-to-launch-an-aws-ec2-instance-pdf-adobe-reader.png)


#### Retrieve your keypair name


your key pair name is associated with the security group you choose for the ec2 instance. take note of it directly when creating the instance.

![key pair name](https://andreacirilloblog.files.wordpress.com/2015/08/2015-08-06-16_53_12-how-to-launch-an-aws-ec2-instance-pdf-adobe-reader.png)


### install ramazon package


a working version of ramazon package is **[available through Github](https://github.com/AndreaCirilloAC/ramazon)**. In order to use it you have to **execute the following code**, installing devtools an downloading ramazon from the github repo:

`
install.packages("devtools")
library(devtools)
install_github("andreacirilloac/ramazon")
library(ramazon)
`


### run ramazon()


after loading ramazon library you just need to** run the following line of code**, **using the public DNS and key pair name** ( without ".pem" extension into the name) you retrieved into the previous paragraphs:
`
ramazon(Public_DNS ="your_Public_DNS", key_pair_name = "your_key_pair_name")
`
after running this line you will see your console being populated by a lot of messages showing you what's going on behind the scene (see next paragraph for more specific info about that).


### enjoy your app!


At the end of the process, **ramazon **will communicate that everything went smoothly and **will print out the web URL** where you can find **your deployed app**.


## Some tech specs


the full ramazon code is released under **[MIT license on a github repo](https://github.com/AndreaCirilloAC/ramazon)**. Nevertheless, for those interested in code details I will describe in the next lines **some details about ramazon design**.

Basically, what ramazon does is to **write a bash script **with all commands needed to:



	
  * **install the latest version of R** (non trivial issues, since Ubuntu comes with R 3.0.2 version, causing heavy packages incompatibility)

	
  * install the** latest version of Shiny-Server**

	
  * **copy the shiny app files** on the server


All commands are run **with verbose on**, in order to give the clearest possible vision of what is going on and what could possibly go wrong.

The resulting **bash script is** then **run with [system() function](https://stat.ethz.ch/R-manual/R-devel/library/base/html/system.html)**.


### Possible issues


Since the package is in its **very first stages**, I am aware of just a little part of possible issues that could arise during its use.

I really hope you will help me to find out some more of them using it and **opening issues on the Github repo** :)

In the meanwhile, find below **three tricky problems** that could arise during ramazon use.


#### place your key correctly


ramazon is trained to look for the **key pair file within the shiny app folder**. Therefore you have to save that file within this folder. If you are using the same key for different instances **you can also copy and paste it into the shiny app**. If you are using an online repository for your project, be sure to **add** your key pair **to the [.gitignore file](http://git-scm.com/docs/gitignore)**.

this was also kindly pointed out from Simon in comments: your .pem file should be in your working directory and your working directory should be the one hosting the app.


#### a matter of extensions


It sometimes happens that the key pair file is saved as a txt file. This results in ramazon not being able to connect with AWS instance and failing its job.

All you have to do in this case is to **[change the extension of the key pair file](https://www.youtube.com/watch?v=pbEaKTcQcv4)**.


#### Refresh that IP


as you can see within the deck showed above, the security group associated with your instance as an **SSH connection rule** (see slide 10)
Even if this type is set with "**My IP**",** if** this **IP changes** (i.e. you connect from another network) it will **not update automatically**.

This again will result in ramazon failing its job, given that it will not be able to establish an SSH connection with the instance.

All you will have to do in this case is to **[edit inbound rules](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)** for the security group and specify again "My IP" for the SSH Type. This will change the IP into your current IP.


#### No Public DNS showing


After trying ramazon (yeah, it worked 😌), [@ukituki](https://twitter.com/ukituki) pointed me out a possible issue: the **absence of a public DNS** for a given instance.
this issue comes from not checking the "Automatically assign a public IP address to your instances" during the launching process.

To **solve this problem** you just have to follow the following steps (from question _[EC2 instance has no public DNS on Stackoverflow](http://stackoverflow.com/questions/20941704/ec2-instance-has-no-public-dns)_):



	
  * Go to console.aws.amazon.com

	
  * Go To Networking -> VPC

	
  * Open Your VPCs

	
  * select your VPC connected to your EC2

	
  * Edit Summary -> Change DNS hostnames: to YES


thank you ukituki!


## Let me know


I am already working on some further improving of the ramazon functionalities, like the update function to be run after the first deploy and some other facilities.
Nevertheless I would **really appreciate you coming back after using ramazon** to tell me what you went wrong, preferably **[opening Github issues](https://github.com/AndreaCirilloAC/ramazon)**, what could be done better and what you would like to see.
