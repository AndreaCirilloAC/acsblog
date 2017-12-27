---
author: andreacirilloac
comments: true
date: 2015-04-01 20:29:04+00:00
excerpt: A basic free windows application to list all files and directories within
  a choosen folder.
layout: post
link: https://andreacirilloblog.wordpress.com/2015/04/01/how-to-list-file/
slug: how-to-list-file
title: How to list file and folders within a folder ( basic file  app)
wordpress_id: 461
categories:
- productivity
tags:
- hacking
- tutorials
- visual basic
- windows
---

I know, we are not talking about analytics and no, this is not going to set me as a great data scientist... By the way: **have you ever wondered** **how to list all files and folders** within a root folder just hitting a button**?**




I have been looking for something like that quite a lot of times, for instance when asked to write down an index of all the working papers pertaining to a specific audit ( yes, **[I am an audito](https://it.linkedin.com/in/cirilloandrea/it)r, **sorry about that): really time-consuming and not really value-adding activity.<!-- more -->





## The problem: how to list file and folders within a folder




This is not an easy problem to solve, mainly because **you don't know how many levels of nesting** there will be in the choosen root folder and therefore you need to write down something enough robust to handle all possible situations.




To address the problem,** I have developed** a really basic **application** that is able to list in a log file ( .txt format) all file and folders within a root folder:




** Basic File.**




![basic file print screen](https://andreacirilloblog.files.wordpress.com/2015/04/basic-file.png)




I have done it for myself, but maybe you will find it useful as well.





## How does it works




**Basic file** doesn't require a lot of setting up:





### 1. select the root folder using 'select folder' button




### [![select](https://andreacirilloblog.files.wordpress.com/2015/04/select.png)](https://andreacirilloblog.files.wordpress.com/2015/04/select.png)




### 2. hit the ‘scan' button .




[![scan](https://andreacirilloblog.files.wordpress.com/2015/04/scan.png)](https://andreacirilloblog.files.wordpress.com/2015/04/scan.png)




**Basic File** will let you instantly see the full list within the application.




Moreover it will **create a ‘log.txt' file** within the root folder with all the files and folder orderly listed. The log is accesible using the '**open log' button.**




[![log](https://andreacirilloblog.files.wordpress.com/2015/04/log.png)](https://andreacirilloblog.files.wordpress.com/2015/04/log.png)




You can easily copy the list from the application or from the log and do whatever you want with it.





## Download the application




You can download the runnable application ( for Windows only) at the end of the post for free.




If you are interested in giving a look to the code, I have uploaded it on the [**Basic File** **repository**](https://github.com/AndreaCirilloAC/BasicFile/) on GitHub.





## Up to you




Do you know a faster/better way to list files and folders in a folder? I will be pleased to hear it from you.





## Thank you JTT! (if you are a command line user).




As suggested by JTT (unfortunately I was not able to retrieve your name), Command Line users can easily obtain the same result just using the command line.





### 1. set the folder you want to look for as the current directory


`cd c:\Some_folder`


### 2. give the following input to the command line


`dir /s /b > name_of_the_file_where _you_want_to_store_the_files_list.txt`


### 3. look for a file with the given name into the given directory.


![file](https://andreacirilloblog.files.wordpress.com/2015/04/2015-07-22-13_37_26-c__users_2000333_desktop.png)


thank you JTT! As said, all (kind) comments are welcome.





#### [download the application (then click 'setup.exe')](https://drive.google.com/file/d/0B0l997rly7XSTjhPZXEtb3lsOEE/view?usp=sharing)


If you found Basic file useful, you may be interested in **other App I developed** for **analytics and productivity purposes**. Find them out at **[software page](https://andreacirilloblog.wordpress.com/software/)**
