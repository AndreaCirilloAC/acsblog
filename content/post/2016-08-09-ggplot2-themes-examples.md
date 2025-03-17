---
author: andreacirilloac
comments: true
date: 2016-08-09 20:30:16+00:00
excerpt: ggplot2 themes showcase and code for plot automated production


slug: ggplot2-themes-examples
title: ggplot2 themes examples

tags:
- analytics
- data analysis
- dataviz
- ggplot
- ggplot2
- ggthemes
- hacking
- plot
- png
- R
- themes
---

this short post is exactly what it seems: **a showcase of all ggplot2 themes** available within the ggplot2 package. I was doing such a list for myself ( you know that feeling ..."how would it look like with this theme? let's try this one...") and at the end I thought **it could have be useful for my readers**. At least this post will **save you the time of trying all** differents themes just to have a sense of how they look like.




Enjoy!





<!-- more -->





## theme_bw()













![theme_bw](https://andreacirilloblog.files.wordpress.com/2016/08/theme_bw.png)







## theme_classic()







![theme_classic](https://andreacirilloblog.files.wordpress.com/2016/08/theme_classic.png)




## theme_dark()




![theme_dark](https://andreacirilloblog.files.wordpress.com/2016/08/theme_dark.png)







## theme_gray()







![theme_gray](https://andreacirilloblog.files.wordpress.com/2016/08/theme_gray.png)







## theme_grey()







![theme_grey](https://andreacirilloblog.files.wordpress.com/2016/08/theme_grey.png)







## theme_light()







![theme_light](https://andreacirilloblog.files.wordpress.com/2016/08/theme_light.png)







## theme_linedraw()







![theme_linedraw](https://andreacirilloblog.files.wordpress.com/2016/08/theme_linedraw.png)







## theme_minimal()







![theme_minimal](https://andreacirilloblog.files.wordpress.com/2016/08/theme_minimal.png)




## Bonus Track: The Code




Since copy and pasting and right-clicking 9 times to produce all the plots was definitely not acceptable, [starting from a good post by Tony Cookson](http://novicemetrics.blogspot.it/2011/04/automatically-save-your-plots-to-folder.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+CoffeeAndEconometricsInTheMorning+(Coffee+and+Econometrics+in+the+Morning)) **I wrote a** small **function to dinamically create and save a png file** with different name and content:










[gist https://gist.github.com/8a0efe2b120ac01f2526a79f2ab33678 /]




### Final notes




Inner ggplot2 structure allows for a nearly infinite number of customizations and extensions.You can have a sense of what I am talking about looking at [_ggplot2 extensions_ ](http://www.ggplot2-exts.org)website or to the [ggthemes package vignette](https://cran.r-project.org/web/packages/ggthemes/vignettes/ggthemes.html) by the package author  _Jeffrey B. Arnold._
