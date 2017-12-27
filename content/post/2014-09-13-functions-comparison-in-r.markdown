---
author: andreacirilloac
comments: true
date: 2014-09-13 15:05:34+00:00
layout: post
link: https://andreacirilloblog.wordpress.com/2014/09/13/functions-comparison-in-r/
slug: functions-comparison-in-r
title: Answering to Ben ( functions comparison in R)
wordpress_id: 118
tags:
- analytics
- data analysis
- data analytics
- R
---

Following [the post about %in% operator,](http://andreacirilloblog.wordpress.com/2014/09/02/r-subset-data-frame/) I received this tweet:
https://twitter.com/benwhite21/status/510520550553165824

I gave a look to [the code kindly provided by Ben](https://gist.github.com/benmwhite/87c50d98c886dfb846e0) and then I asked myself:
I know [dplyr](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html) is a really nice package,  but which snippet is faster?

to answer the question I've put the two snippets in two functions:

`#Ben snippet
dplyr_snippet =function(object,column,vector){
filter(object,object[,column] %in% vector)
}
#AC snippet
Rbase_snippet =function(object,column,vector){
object[object[,column] %in% vector,]
}`

Then, thanks to the great [package microbenchmark](http://cran.r-project.org/web/packages/microbenchmark/microbenchmark.pdf), I made a comparison between those two functions, testing the time of execution of both, for 100.000 times.

`comparison = microbenchmark(Rbase_snippet(iris,5,vec),dplyr_snippet(iris,5,vec),times = 100000)`

`#plot the output
autoplot(comparison)+
labs(title = "comparison between dplyr_snippet and Rbase_snippet", y="snippet")
`

And that was the result:

[![snippet_comparison](http://andreacirilloblog.files.wordpress.com/2014/09/snippet_comparison.jpeg)](https://andreacirilloblog.files.wordpress.com/2014/09/snippet_comparison.jpeg)



R Base package seems to be the winner, even if just for an handful of microseconds...

Nevertheless, I am really grateful to Ben, it was a great fun!
