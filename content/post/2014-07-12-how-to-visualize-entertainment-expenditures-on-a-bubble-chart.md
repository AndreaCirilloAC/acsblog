---
author: andreacirilloac
comments: true
date: 2014-07-12 07:27:24+00:00


slug: how-to-visualize-entertainment-expenditures-on-a-bubble-chart
title: How to Visualize Entertainment Expenditures on a Bubble Chart

tags:
- analytics
- data analysis
- data analytics
- R
- shiny apps
---

[![Bubble Chart Categorical Variables Expenditures Analytics](https://andreacirilloblog.files.wordpress.com/2014/07/categorical-bubble-chart.png)](https://andreacirilloblog.files.wordpress.com/2014/07/categorical-bubble-chart.png)

I've been recently asked to analyze some Board entertainment expenditures in order to acquire sufficient assurance about their nature and responsible.

In response to that request I have developed a [little Shiny app](https://andreacirillo.shinyapps.io/Entertainment_Expenditures/) with an interesting reactive Bubble chart.



The plot, made using [ggplot2](http://ggplot2.org) package, is composed by:
a categorical x value, represented by the clusters identified in the expenditures population
A numerical y value, representing the total amount expended
Points defined by the total amount of expenditure in the given cluster for each company subject.
Morover, point size is given by the ratio between amount regularly passed through Account Receivable Process and total amount of expenditure for that subject in that cluster.

The advantage i found in developing such a plot is the possibility to get a lot of information at a glance.

Reactivity is given by two sliders that let you decide the period and the range you want to analyze.

[Full code](https://github.com/AndreaCirilloAC/Entertainment_Expenditures) (with italian comments, sorry about that) is given on GitHub, but let me underline some details:

Labels are made [pasting](http://stat.ethz.ch/R-manual/R-devel/library/base/html/paste.html) subjects names and the amount show, in order to give you both information at once.

Colours are automatically assigned by ggplot function simply by specifying

`col=factors(Soggetto)`

Point size is simply obtained by putting
` size=rapporto`

Hope you will find at least colorful the job.
Going on talking about colours: does anyone knows how to make point solid in this case?

Any feedback will be appreciated, but please be kind!
