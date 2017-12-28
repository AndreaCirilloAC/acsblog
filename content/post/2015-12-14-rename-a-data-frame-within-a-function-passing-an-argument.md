---
author: andreacirilloac
comments: true
date: 2015-12-14 21:04:33+00:00
excerpt: custom function which lets you pass an argument to rename a data frame created
  within the function itself


slug: rename-a-data-frame-within-a-function-passing-an-argument
title: Rename a Data Frame Within a Function Passing an Argument

tags:
- analytics
- R
- Rstudio
---

This is not actually a real post but rather a code snippet surrounded by text.

Nevertheless I think it is a quite useful one: have you ever found yourself writing a function where **a data frame is created**, wanting to name that data frame based on a custom argument passed to the function?

For instance, the output of your function is a really nice data frame name in a really trivial way, like "result".

But your dream is to **let the user** (or some piece of code behind the function) **specify the data frame name, passing it as an argument** of your function.

To achieve that you need to look at **_assign _function**, which let's you access the hash table of a given environment (_pos _argument) and change the value of a given variable.

Find below a working function which applies this idea:

[code language="r"]
rename_df  =  function(choosen_name){
data_set  =  data.frame(column_A = c(1,4,6,7,8),column_B = c(seq(1:5)))
title  =  choosen_name
assign(title,data_set,pos = ".GlobalEnv")
}
[/code]

Have you found any other way to get here? I would love to here it!

p.s.: wondering why I chose that image? well, is Adam naming animals.. :)
