---
author: andreacirilloac
comments: true
date: 2014-12-05 15:10:34+00:00
excerpt: a lean shiny app in R language to obtain network visualisation from hedge
  list.


slug: network-visualisation-in-r
title: Network Visualisation With R

tags:
- analytics
- communities
- data analysis
- data analytics
- internal audit
- Linker
- network analysis
- R
---




### The main reason why







After all,[ I am still an Internal Auditor](it.linkedin.com/in/cirilloandrea/). Therefore I often face one of the typical **internal auditors problems**: understand links between people and companies, in order to **discover** the existence of **hidden communities** that could expose the company to **unknown risks**.







### the solution: linker







In order to address this problem I am developing **[Linker](https://andreacirillo.shinyapps.io/linker/)**, a [**lean shiny app**](https://andreacirillo.shinyapps.io/linker/) that take 1 to 1 links as an input and gives as output a **network map**:









[caption id="attachment_324" align="aligncenter" width="300"][![the Linker](https://andreacirilloblog.files.wordpress.com/2014/12/the-linker.png?w=300)](https://andreacirillo.shinyapps.io/linker/) click the picture to reach the app[/caption]










<!-- more -->








**[Linker](https://andreacirillo.shinyapps.io/linker/) **is packed with a demo network, but you can easily load your dataset following the tutorial below.







![network](https://andreacirilloblog.files.wordpress.com/2014/12/network.png?w=300)




### how to use linker ( and some code specs)




the one that follow is a tutorial with some focus on code, if you are interested in giving a look to the full reprocudibile Rstudio project, I make it available at the end of the post.







### ![decribing data](https://andreacirilloblog.files.wordpress.com/2014/12/view12-e1417793436708.png) describing data







[**Linker**](https://andreacirillo.shinyapps.io/linker/) is only able to read **.csv datasets**, structured as **"hedge-to-hedge" tables.**




This mean you will have to create a two-column table, having on each row a link.




For instance, suppose A is linked with B, C is linked with A and B is linked with D; this will be your dataset:


<table >

<tr >
from
to
</tr>

<tbody >
<tr >

<td align="left" >A
</td>

<td align="left" >B
</td>
</tr>
<tr >

<td align="left" >C
</td>

<td align="left" >A
</td>
</tr>
<tr >

<td align="left" >B
</td>

<td align="left" >D
</td>
</tr>
</tbody>
</table>





be sure to **set ";" as a separator** in your .csv file.







### ![upload119](https://andreacirilloblog.files.wordpress.com/2014/12/upload119-e1417793516892.png) loading data







using the 'load file' control you can choose the dataset to load.







![ScreenClip](https://andreacirilloblog.files.wordpress.com/2014/12/screenclip.png)







### ![circles23](https://andreacirilloblog.files.wordpress.com/2014/12/circles23-e1417793559403.png) connecting dots







Linker leverages the great features builted in the **[linkComm package ](http://cran.r-project.org/web/packages/linkcomm)**by Alex T. Kalinka and Alain Guenoche .




Therefore, the first step required is to create a **linkComm object**, containing the network map and informations about founded communities.







This object is obtained through the **getLinksCommunities()** function. This function takes your dataset as an input and, applying a clustering method, gives as an output the network map aggregated by community.











<!-- more -->

<!-- more -->

<!-- more -->

[code language="r"]
links_graph <- getLinkCommunities(links_file(),hcmethod="mcquitty",
                                      use.all.edges = TRUE)
[/code]






just note that:








	
  * Linker use as hierarchical **clustering method** the **mcquitty** method. There are other clustering methods available. just type ?getLinkCommunities() in your console to discover them;

	
  * the parameter **use.all.edges** is set to **TRUE** in order to show in the network all member of your networks.




### ![round51](https://andreacirilloblog.files.wordpress.com/2014/12/round51-e1417793538897.png) Plotting the map







as soon as Linker creates the getLinkCommunities object, it will return, in the"network map" area, a visual representation of your network.







the default graph is the **spencer circle,** a graph developed by Rob Spencer starting from a 2010 [paper by Yong-Yeol Ahn , James P. Bagrow and Sune Lehmann .](http://arxiv.org/abs/0903.3178)




If you prefer, you can change the graphing layout  to circle.







![graph type choice](https://andreacirilloblog.files.wordpress.com/2014/12/screenclip-2.png)







I think this second way is a bit more clearer, even if is not as impacting as the Spencer Circle.







### ![search100](https://andreacirilloblog.files.wordpress.com/2014/12/graduate32-e1417793548346.png) Advanced topics







#### highligthing most relevant subjects







not all the subjects in your network have got the same relevance. If you want to **focus** just on the **most influent subjects,** you can use the "number of communities" option.




This option lets you focus on subjects being part of** at least n communities**, starting from one to infinite.







![number of communities](https://andreacirilloblog.files.wordpress.com/2014/12/screenclip-4.png?w=300)




##### code spec







the option uses the shownodesin argument






[code language="r"]
shownodesin = input$"n_input"
[/code]






#### focusing on a single community







If you want to focus on a single community, you can just type the community id into the 'community to focus on'.




Community's id are printed around the circle in the spencer circle layout.







![focus on single community](https://andreacirilloblog.files.wordpress.com/2014/12/screenclip-3.png?w=300)




##### code spec







these option is builted using the clusterids argumenti within the plot function:






[code language="r"]
clusterids = c(as.numeric(input$selected_communities))
[/code]






#### export your map







this is not actually a feature created within the application, but could be better described as a trick:







if you want to export your map, just right-click on the map and select "save image".







### the Rstudio Project.







to download the full project, just click the button below.







#### [download the Linker R studio project App](https://www.evernote.com/l/AFztyUdNreVBRaKECS6QA60eddL7OvgKVc4)










If you found Linker useful, you may be interested in **other Shiny Apps I developed** for **analytics and productivity purposes**. Find them out at **[software page](https://andreacirilloblog.wordpress.com/software/)**










Icons made by [Google](http://www.google.com) from [www.flaticon.com](http://www.flaticon.com) is licensed under [CC BY 3.0](http://creativecommons.org/licenses/by/3.0/)



