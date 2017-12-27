---
author: andreacirilloac
comments: true
date: 2014-09-02 08:05:36+00:00
layout: post
link: https://andreacirilloblog.wordpress.com/2014/09/02/r-subset-data-frame/
slug: r-subset-data-frame
title: 'Code snippet: subsetting data frame in R by vector'
wordpress_id: 77
tags:
- analytics
- data analysis
- R
- tutorials
---

### Problem:


you have to subset a data frame using as criteria the exact match of a vector content.

for instance:


#### you have a dataset with some attributes, and you have a vector with some values of one of the attributes. You want to make a filter based on the values in the vector.


Example: sales records, each record is a deal.

The vector is a list of selected customers you are interested in.

Is it possible to make such a kind of filter?


### Solution


Of course it is!


#### you just have to use the %in% operator.


let’s see how to do it in the short tutorial here below.


### Tutorial


suppose you have a _sales_ data frame object like this:

[![#rstats](https://andreacirilloblog.files.wordpress.com/2014/09/rstats.jpeg?w=300)](https://andreacirilloblog.files.wordpress.com/2014/09/rstats.jpeg)



suppose you want to extract sales to Francesca, Tommaso and Gianna.

first, you have to assign those names to a vector.


##### `vector = c(“Francesca","Tommaso","Gianna")`


then, you can write the filtering statement, using the_ %in% _operator.


##### `query_result = sales[sales$customer %in% vector,]`


and that's it!

The meaning of _%in% _operator is exactly the one you guess:


_“ select only  values present IN the specified group”._


Full code is available as an R workbook for quick reference:

[filter_code.R](https://andreacirilloblog.files.wordpress.com/2014/09/filter_code-r.pdf)

Let me know if you use any other method to obtain the same result.

Finally, if you enjoyed the tutorial, you can find more tutorial on page _[Tutorial](http://andreacirilloblog.wordpress.com/tutorials/) _(quite obvious, isnt' it?).
