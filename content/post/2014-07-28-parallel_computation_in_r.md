---
author: andreacirilloac
comments: true
date: 2014-07-28 20:14:41+00:00


slug: parallel_computation_in_r
title: Saturation with Parallel Computation in R

tags:
- analytics
- data analysis
- R
- tutorials
---

I have just saturated all my PC:




full is the 4gb RAM


[![Full-in](https://andreacirilloblog.files.wordpress.com/2014/07/full-in-e1406577873178.jpg)](https://andreacirilloblog.files.wordpress.com/2014/07/full-in-e1406577873178.jpg)


and so is the CPU (I7 4770 @3.4 GHZ)


[![full-in](https://andreacirilloblog.files.wordpress.com/2014/07/full-in1-e1406577829980.jpg)](https://andreacirilloblog.files.wordpress.com/2014/07/full-in1-e1406577829980.jpg)


# **Parallel Computation in R**




which is my secret?




the [doParallel package](http://cran.r-project.org/web/packages/doParallel/vignettes/gettingstartedParallel.pdf) for R on mac




The package lets you make some very useful parallel computation, giving you the possibility to use all the potentiality of your CPU.




As a matter of fact, the standard R option is to use  just on of the cores you have got on your PC.




With parallel computation, just to say it easy, you can take your job, divide it in some smaller jobs, solve them and then put them together  in one new R object.





## **Tutorial ( More or Less)**




There are some useful tutorial on the web ([try to google it](https://www.google.it/#q=parallel+computation+in+r&safe=off)), but let me introduce the stuff in a really basic way so that you can immediately try it out:




` install.packages("doParallel")
library(doParallel)
cl = makeCluster(2) # if you want to use all your fire power, put the number of your cores
registerDoParallel(cl)
parallelization = function(x){
n = number #put here the number of repetitions you need
foreach ( i=1:n,.combine = rbind) { #this '.combine = rbind' let R understand that has to put the results together with an rbind function, you can use cbind as well
x*2
}
}`





### **Final Warnings**




just a tip: DON'T  MAKE THE RESULT BE AN OBJECT!




sorry about the capital letters but I have been stacked on this error for quite a long time...




Finally, are you using Windows? instead of doParallel you can obtain the same result with [doSNOW package](http://cran.r-project.org/web/packages/doSNOW/index.html).




comments are welcome.
