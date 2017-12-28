files = list.files('content/post', '[.]md$', full.names = TRUE)
for (f in files){

  file            <- readLines(f)
  if(is.na(match("---",file[2:length(file)]))){}else{ 
  range_yaml      <- seq(from = 1, to = match("---",file[2:length(file)]))
  matching_string <- c("layout","link","wordpress_id")
  indexes <- c()
  for(i in 1:length(matching_string)){
    index <- pmatch(matching_string[i],file[range_yaml])
    print(index)
    indexes <- rbind(indexes,index)
  }
  
  indexes <- as.vector(indexes)
  file[indexes] <- ""
  writeLines(file,f)
  }
}


