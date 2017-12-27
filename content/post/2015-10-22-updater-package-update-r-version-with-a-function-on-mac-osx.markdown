---
author: andreacirilloac
comments: true
date: 2015-10-22 19:34:11+00:00
excerpt: updateR is an R package that directly downloads and installs last R version
  on your OSX device.
layout: post
link: https://andreacirilloblog.wordpress.com/2015/10/22/updater-package-update-r-version-with-a-function-on-mac-osx/
slug: updater-package-update-r-version-with-a-function-on-mac-osx
title: 'UpdateR package: update R version with a function (on MAC OSX)'
wordpress_id: 692
tags:
- algorithm
- analytics
- R
---

I personally really **appreciate the [InstallR package](https://cran.r-project.org/web/packages/installr/installr.pdf) from [Tal galilli](https://twitter.com/talgalili)**, since it lets you **install** a great number of **tools** needed for working with R just **running a function**.

Among these functions **one of my favourite **is the **_updateR()*_** **function** which checks for **new versions of R language** and in case of positive response **installs it** on your machine.

The only issue with this function is that **it works only on Windows Operating systems**.

<!-- more -->


## Mac version of updateR function: the UpdateR package


**That is why I developed updateR**, a package that let's you update your R version from R itself just running the following line of code:

[code language="r" gutter="FALSE"]
updateR(admin_password = "os_admin_user_password")
[/code]

that is to say you will **only have to provide admin user password**.
This password is required because some of the command executed by _updateR()_ are run as super user (for advanced readers we are talking of our old "sudo" friend).

short paragraphs which follow shows **you how to install and use the package**.


## how to install the updateR package


UpdateR package is **hosted on Github**.
You will therefore have to install it leveraging the _install_github()_ function from devtools package:

[code language="r" gutter="FALSE"]
require(devtools)
install_github('andreacirilloac/updateR')
[/code]


## how to update R version using the updateR package


As seen, **updating R version from R is actually a breeze**: you just need to run a function.

all you will need to do is **retrieve your MAC admin user password** and then run the two following lines of code:

[code language="r" gutter="FALSE"]
updateR(admin_password = "os_admin_user_password")
[/code]

Since every command launched in background (see below for more infos) is passed with verbose option on, you will suddenly see your console being populated of **output messages** informing you on **how things are going on**.

A the end of the installation process those **two lines should appear**:

`everything went smoothly
open a Terminal session and run 'R' to assert that latest version was installed`

that is all you need to know to use _updateR_.
By the way If you want to know more on **how the function works**, have a look at the following paragraphs.


## behind the scenes: how updateR works


as experimented with **[Ramazon package](https://andreacirilloblog.wordpress.com/2015/08/18/deploy-your-shiny-app-on-aws-with-a-function/)**, which allows you to **publish your shiny app on amazon AWS with a function**, I developed **updateR** mainly **leveraging the _system()_ function**, which lets you pass commands to the command line directly from the R environment.

That said, the **updateR function workflow** can be summarized into the following steps:


### verify that user is running a unix machine


as said, _updateR_ is a package thought as **a OSX twin of Tall galili installr package** and can therefore be run only on Mac OSX machines.

Following this _updateR_ takes care of verifying that you are launching it from a unix OS, running the **_stopifnot()_** **function** in order to **alt the execution on non-unix systems**:

[code language="r" gutter="FALSE"]
stopifnot(.Platform$OS.type == "unix")
[/code]


### get last R version from CRAN


How would you programmatically **check for the latest R version?**

updateR does it **importing in R the html code of the rstudio CRAN mirror page** ([https://cran.rstudio.com/bin/macosx/](https://cran.rstudio.com/bin/macosx/)) and **extracting** from it the **version number**.

[code language="r" gutter="FALSE"]
page              <- xml2::read_html(page_source)
version_block     <- rvest::html_nodes(page,"h1+ p a+ a , table:nth-child(8) tr:nth-child(1) td > a")
filename          <- rvest::html_text(version_block) %>% strsplit("\n", fixed = TRUE) # the resulting value is a list
filename          <- filename[[2]] # we take the second element, containing the name of the file
filename_quoted          <- paste("'",filename,"'",sep = "")
[/code]

Be aware that **resulting filename object** will be a string **similar to** the following :**"R-xx.xx.xx.pkg"**, since we are looking to **compose a download URL** for the version package on our machine.

This URL is composed pasting the CRAN mirror url togheter with the filename object:

[code language="r" gutter="FALSE"] url               <- paste(page_source,filename, sep = "")[/code]

one thing still missing here is the comparison between version installed on the maching calling the function and the retrieved version on CRAN.

I will probably (hopefully) develop this within next releases, and collaboration on this would be really welcome.

After defining the download URL we can actually **proceed with downloading the package and install it**. the first of those two steps will be performed leveraging built-in function _download.file() _:

[code language="r" gutter="FALSE"]
download.file(url,filename)
[/code]


### run command line commands within R


the **last step** is the actual **installation** of the R version package. this activity will be performed using the **command line command** **_installer_** .

we are first going to put toghethet our line of command with _paste()_ function and then submit** to the terminal calling** **_system()_** **function on our command string**:

[code language="r"]
command           <- paste("echo " , admin_password, "| sudo -S installer -pkg ", filename_quoted , " -target / -verbose")
system(command)
[/code]


### feel free to complain with me


I shared _updateR_ as a package since **I think it could be a really useful tool for the R commuynity**.

As R itself, _updateR_ package comes with absolute no warranty ( ;)) , nevertheless I will be really **pleased to read your comments and suggestions** on it, as well as I will be pleased if you would like to further **improve it through the [Github repo](https://github.com/AndreaCirilloAC/updateR)**
