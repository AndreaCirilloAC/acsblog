---
author: andreacirilloac
comments: true
date: 2014-12-28 00:10:00+00:00
excerpt: step by step tutorial on using git version control on Rstudio through Github


slug: using-github-with-rstudio-step-by-step-tutorial
title: 'How to use Github with Rstudio : step-by-step tutorial'

categories:
- analytics
tags:
- Github
- repository
- Rstudio
- tutorials
---

Pushing to my Github repository directly from the Rstudio project, avoiding that annoying "copy & paste" job. Since it is one of **[Best Practices for Scientific Computing](https://andreacirilloblog.wordpress.com/2014/11/05/best-pratice-for-scientific-computing/)**, I have been struggling for a while with this problem.  Now that I managed to solve the problem, I think you may find useful the detailed tutorial that follows. I am not going to explain you the reason why you should use Github with your  Rstudio project, but if you are asking this to yourself, you may find useful a **[Stack Overflow discussion ](http://stackoverflow.com/questions/1408450/why-should-i-use-version-control)**on the topic.


## 0. download last git version


you can download the last git version from **[Git website](http://git-scm.com)** ![git logo](https://andreacirilloblog.files.wordpress.com/2014/12/logo2x.png)

<!-- more -->


## 1. link git to Rstudio


to make the link, first open the "global options" [![global options](https://andreacirilloblog.files.wordpress.com/2014/12/global-options.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/global-options.png) after selecting the "GIT/SVN" tab, you will have to find the "git.exe" file within your Mac (if you are using Windows, give a look to the comment by Rajesh here below). [![fin git](https://andreacirilloblog.files.wordpress.com/2014/12/fin-git.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/fin-git.png)


## 2. launch a terminal/shell


the quickest way to launch a terminal/shell, from whatever operative system you are working in, is within Rstudio itself, in the _tools_ menu, as observed by[ **Hadley Wickham**](http://had.co.nz) in his comment below. [![launch shell](https://andreacirilloblog.files.wordpress.com/2014/12/launch-shell.png)](https://andreacirilloblog.files.wordpress.com/2014/12/launch-shell.png)


## 3.type those words


once you have your terminal session open, you just have to type-in those words:



	
  * `git config --global user.name "AndreaCirilloAC"`

	
  * `git config --global user.email "andreacirilloac@gmail.com" `


you have to do this once in your life, or at least once for each user on your Mac... Just to be sure... you should put **your username** and and **your e-mail address**...


## 4. create a repository on Github


[![repository](https://andreacirilloblog.files.wordpress.com/2014/12/repository1.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/repository1.png)


## 5. copy the repository ssh address


the link between GithHub and Rstudio will be the Github repository address. Be sure to copy it  from the repo main page, **using the SSH "version"**, as shown in the picture. [![copy address](https://andreacirilloblog.files.wordpress.com/2014/12/copy-address.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/copy-address.png) I am suggesting the SSH address, due to [**a bug** ](https://github.com/OHI-Science/ohicore/issues/104)on latest Rstudio Version.


## 6. create a new Rstudio project


after selecting the _new project _control, select the _version control_ option [![new project](https://andreacirilloblog.files.wordpress.com/2014/12/new-project.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/new-project.png) and then select the _git _option [![choose git](https://andreacirilloblog.files.wordpress.com/2014/12/choose-git.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/choose-git.png)


## 7. paste the copied address


here it comes the moment to use the address copied at point 5. [![paste ssh](https://andreacirilloblog.files.wordpress.com/2014/12/paste-ssh.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/paste-ssh.png)


## 8. give it a try


just to be sure everything is ok, you can commit whatever you like back to your Github repo. [![commit 1](https://andreacirilloblog.files.wordpress.com/2014/12/commit-1.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/commit-1.png) [![commit 2](https://andreacirilloblog.files.wordpress.com/2014/12/commit-2.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/commit-2.png) the one that follows will be the output that will assures you your changes have been pushed to the Repository online. [![result](https://andreacirilloblog.files.wordpress.com/2014/12/screen-shot-2014-12-26-at-22-41-45.png?w=300)](https://andreacirilloblog.files.wordpress.com/2014/12/screen-shot-2014-12-26-at-22-41-45.png) I hope it was clear enough, but if you need any further clarification do not hesitate to ask for it here below or on twitter **[@andreacirilloac](https://twitter.com)** .
