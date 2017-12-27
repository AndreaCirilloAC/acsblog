---
author: andreacirilloac
comments: true
date: 2015-09-10 09:19:43+00:00
excerpt: "ramazon lets you deploy your shiny app on amazon aws. \nThe new version\
  \ detects and installs all required packages automatically"
layout: post
link: https://andreacirilloblog.wordpress.com/2015/09/10/how-to-list-loaded-packages-in-r-ramazon-gets-cleaver/
slug: how-to-list-loaded-packages-in-r-ramazon-gets-cleaver
title: 'how to list loaded packages in R: ramazon gets cleaver'
wordpress_id: 602
tags:
- algorithm
- amazon
- analytics
- apps
- aws
- data analytics
- R
- Rstudio
- shiny
- shiny apps
---




It **was** around **midnight** here **in Italy**:
I shared the **[code on Github](https://github.com/AndreaCirilloAC/ramazon)**, published a post on G+, Linkedin and Twitter and then **went to bed**.




In the next hours things got growing by themselves, with pleasant results like the following:


https://twitter.com/DoodlingData/status/635057258888605696


The R community found **ramazon** a really **helpful package**.








And I actually think it is: **Amazon AWS** is nowadays one of the **most common** tools for online **web applications** and **websites hosting.**




The possibility to get **your Shiny App on it just running a function** make it even more desirable for the amusing R people.




Therefore, even if I developed ramazon for personal purposes , I now **feel some kind of responsibility** to further develop it and take it updated.




<!-- more -->




Well, to be honest: is **not such a bad feeling...**




[![giphy (1)](https://andreacirilloblog.files.wordpress.com/2015/09/giphy-1.gif)](https://andreacirilloblog.files.wordpress.com/2015/09/giphy-1.gif)





## A matter of packages




One of the **main issues** with the first release was the **lack of support for multiple packages**:




Shiny Apps often rely on different packages, but ramazon was only able to install the shiny package.




**So I developed and just released a new version (0.2.0)** able to **detect and install **on AWS** all required packages**.




You can try this new feature installing ramazon package on your R environment. Find more detailed instruction on **[the introductory post](https://andreacirilloblog.wordpress.com/2015/08/18/deploy-your-shiny-app-on-aws-with-a-function/)**.




In the following lines I would like to highlights **some code specs** that could be interesting for the R programmers.





## How ramazon lists loaded packages




This is how ramazon detects and installs al required packages.





### [![Broom-100](https://andreacirilloblog.files.wordpress.com/2015/09/broom-100.png)](https://andreacirilloblog.files.wordpress.com/2015/09/broom-100.png)clean the R environment




using the `detach()` function, with no arguments, we are able to **unload all loaded packages**,




Doing this, we can be sure that **no unneeded package will be installed** on the AWS server.





### [![Run Command-100](https://andreacirilloblog.files.wordpress.com/2015/09/run-command-100.png)](https://andreacirilloblog.files.wordpress.com/2015/09/run-command-100.png)source the app .R files




with this step, ramazon **run the app source files** in order to **load all required packages** within the current R environment.




Shiny apps can be written using:






	
  * two different files: ui.R and server.R

	
  * one unique file: app.R




ramazon can distinguish the two cases and **sourcing only the existing files** thank to the following conditional statement:




[code language="r"]
if (file.exists("ui.R")){
source("ui.R")
source("server.R")
}else {
source("app.R")}
[/code]

.

In the hypothesis of developer using a **global.R** file in order to make variables available both to UI side and Server side of the app (more on the **[Shiny help page](http://shiny.rstudio.com/articles/scoping.html)**), **one more conditional statement** is introduced with consequent sourcing:

[code language="R"]

if (file.exists("global.R")){
source("global.R")
}

[/code]



### [![Data Sheet-100](https://andreacirilloblog.files.wordpress.com/2015/09/data-sheet-100.png)](https://andreacirilloblog.files.wordpress.com/2015/09/data-sheet-100.png)store all loaded packages within a data.frame




Now is time to get a list of all loaded packages.




To get this done, We use the **`search()` function**, assigning the output to a **data.frame object**.




[code language="r"]
environ <- data.frame("envs" = search(),stringsAsFactors = FALSE)
[/code]



the result will be something like the one below:




[code language="r"]
               <span class="mceItemHidden" data-mce-bogus="1"><span class="hiddenSpellError" pre="" data-mce-bogus="1">envs</span></span>
1 &nbsp; &nbsp; &nbsp; &nbsp;.<span class="hiddenSpellError" pre="1 " data-mce-bogus="1">GlobalEnv</span>
2 &nbsp; &nbsp; package:stats
3 &nbsp;package:graphics
4 package:<span class="hiddenSpellError" pre="" data-mce-bogus="1">grDevices</span>
5 &nbsp; &nbsp; package:<span class="hiddenSpellError" pre="" data-mce-bogus="1">utils</span>
6 &nbsp;package:datasets
7 &nbsp; package:methods
8 &nbsp; &nbsp; &nbsp; &nbsp; <span class="hiddenSpellError" pre="8 " data-mce-bogus="1">Autoloads</span>
9 &nbsp; &nbsp; &nbsp;package:base
[/code]



As you can see, **there are** **some** **unneeded values** (.GlobalEnv and Autoloads), and all packages are preceded by the "package:" wording. We are going to handle this within the next paragraph.





### [![Grid-100](https://andreacirilloblog.files.wordpress.com/2015/09/grid-100.png)](https://andreacirilloblog.files.wordpress.com/2015/09/grid-100.png)clean the data.frame




Leveraging the `grepl()` function **ramazon removes all rows not containing "package"**, excluding that way all non-package records:




[code language="r"]
environ <- environ[grepl("package",environ[,1]),]
[/code]



Finally, **using `gsub()` the "package:" wording is removed**:




[code language="r"]
packages <- gsub("package:","",environ)
[/code]



### [![Source Code-100](https://andreacirilloblog.files.wordpress.com/2015/09/source-code-100.png)](https://andreacirilloblog.files.wordpress.com/2015/09/source-code-100.png)write the system command




The main output of the `ramazon()` function, as explained in **[the previous post](https://andreacirilloblog.wordpress.com/2015/08/18/deploy-your-shiny-app-on-aws-with-a-function/)**, is a bash script.




in order to install all the required packages **ramazon needs to create a system command** similar to the following one:




[code language="r"]
<span class="mceItemHidden" data-mce-bogus="1"><span class="hiddenSpellError" pre="" data-mce-bogus="1">sudo</span></span> su -\\-c \"R <span class="hiddenSpellError" pre="" data-mce-bogus="1">-e</span> \\"install.packages(c("shiny","<span class="hiddenSpellError" pre="" data-mce-bogus="1">ggplot2</span>"), <span class="hiddenSpellError" pre="" data-mce-bogus="1">repos</span> = 'http://cran.rstudio.com/', dep = TRUE)\\"\
[/code]



First of all we need to create the **vector containing the needed packages**.




This is obtained with a **sequence of `paste()` functions**:




[code language="r"]
packages <- paste("'",packages,"'",sep ="")
packages <- paste(packages,",",collapse = "")
packages <- paste("c(",packages,sep ="")
packages <- <span class="mceItemHidden" data-mce-bogus="1"><span class="hiddenSpellError" pre="" data-mce-bogus="1">substr</span></span>(packages,1,(<span class="hiddenSpellError" pre="" data-mce-bogus="1">nchar</span>(packages)-1))
packages <- paste(packages, ")",sep ="")
[/code]



finally, we have to **deal with escape characters** contained within the system command.




This is appropriately done using the **`cat()` function**, that makes the **lower number of manipulations** on the given input.




Unfortunately, this function **doesn't give any value as a result**, and therefore we need to **directly catch the console output** and store it within the bash_script file.




Here it is the complete code for this alchemical job:




[code language="r"]
sink("bash_script.txt", append = TRUE)
message <- cat("<span class="mceItemHidden" data-mce-bogus="1"><span class="hiddenSpellError" pre="" data-mce-bogus="1">sudo</span></span> su -\\-c \"R <span class="hiddenSpellError" pre="" data-mce-bogus="1">-e</span> \\\"install.packages(",packages,", <span class="hiddenSpellError" pre="" data-mce-bogus="1">repos</span> = 'http://cran.rstudio.com/', dep = TRUE)\\\"\"")
sink()
[/code]






And here we are: ramazon automatically detects and install all required packages for your Shiny App on the AWS server.








## getting further




Current version is somehow complete since it allows to deploy any kind of shiny app on an Amazon AWS server.




Even so there are some further possible developments:






	
  * I have been requested of a **Windows version**, and I will try to develop one. that said If anyone out there would like to help with that, just whistle!

	
  * ramazon is still missing some **serious testing**, and a log of all the console output would be really useful to help with debugging tasks.




As usual **let me know if anything is going wrong &/| you have got suggestion** for making ramazon a better word :)


[Icon pack by Icons8](https://icons8.com)
