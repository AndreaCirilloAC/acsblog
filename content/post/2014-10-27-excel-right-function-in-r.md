---
author: andreacirilloac
comments: true
date: 2014-10-27 05:29:15+00:00


slug: excel-right-function-in-r
title: excel right() function in R

tags:
- analytics
- data
- data analysis
- data analytics
- excel
- excel spreadsheet
- functions
- R
---

as part of the** [excel functions in R](http://andreacirilloblog.wordpress.com/2014/10/25/excel-functions-in-r/),** I have developed this custom function, reproducing the excel _right()_ function in th R language. Feel free to copy and use it.

[code language="r"]
right = function (string, char){
substr(string,nchar(string)-(char-1),nchar(string))}
[/code]

you can find other function in the **[Excel functions in R post](http://andreacirilloblog.wordpress.com/2014/10/25/excel-functions-in-r/)**.
