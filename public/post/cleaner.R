old_url = 'https://andreacirilloblog.wordpress.com/'
new_url = 'http://andreacirillo.org'

# rename *.markdown to *.md
files = list.files('content/post', '[.]markdown$', full.names = TRUE)
file.rename(files, sub('[.]markdown$', '.md', files))

files = list.files('content/post', '[.]md$', full.names = TRUE)

# all possible authors
collect_yaml('author', 'post')

# map author id's to author names

authors = c(
  andreacirilloac = 'Andrea Cirillo'
)


for (f in files) {
  message('Processing ', f)
  # possible Unicode characters that yaml::yaml.load cannot handle (e.g. emoji)
  :process_file(f, function(x) {
    gsub('(\\\\u[A-Z0-9]{4})+', '', x)
  })
  
  # clean up YAML
  :modify_yaml(f, author = function(old, yaml) {
    if (!is.character(old)) return(authors[1])
    if (old %in% authors) return(old)
    if (is.na(a <- authors[old])) stop('Cannot find the author ', old, ' in ', f)
    a
  }, slug = function(old, yaml) {
    if (length(old) == 1) return(old)
    # YYYY-mm-dd-name.md -> name
    gsub('^\\d{4}-\\d{2}-\\d{2}-|[.]md', '', f)
  }, date = function(old, yaml) {
    # extract actual date from permalink if exists
    r = '^.*/(\\d{4}/\\d{2}/\\d{2})/.*$'
    if (is.character(link <- yaml$link) && grepl(r, link)) {
      gsub('/', '-', gsub(r, '\\1', link))
    } else {
      gsub(' .*', '', old)  # remove time after the space, e.g. 2015-05-28 15:52:54+00:00
    }
  }, .keep_fields = c(
    'title', 'author', 'date', 'categories', 'tags', 'slug'
  ), .keep_empty = FALSE)
  
  :process_bare_urls(f)
  :normalize_chars(f)
  :remove_highlight_tags(f)
  :fix_img_tags(f)
  :remove_extra_empty_lines(f)
  
  :process_file(f, function(x) {
    # <a><img></a> to [![]()]()
    x = gsub(
      '^( {4,})<a href="([^"]+)"[^>]*><img src="\\2[^"]*" alt="([^"]*)"[^>]*></a>',
      '\n\n[![\\3](\\2)](\\2)\n\n\\1', x
    )
    # do not scale images to a certain width
    x = gsub('([.][a-z]+)[?]w=[0-9]+', '\\1', x)
    # [![](link)](link) to ![](link)
    x = gsub('\\[!\\[([^]]*)]\\(([^)]+)\\)]\\(\\2\\)', '![\\1](\\2)', x)
    x = gsub('\\[!\\[([^]]*)]\\(([^)]+)([.][a-z]+)\\)]\\([^)]+\\3\\)', '![\\1](\\2\\3)', x)
    # WP shortcode [caption] to <p class="caption">
    x = gsub('^\\[caption[^]]*](.*\\)) (.*)\\[/caption]$', '\\1\n\n<p class="caption">\\2</p>', x)
    # WP shortcode [sourcecode] to ````lang
    x = gsub('^\\[sourcecode language="([^"]+)"]', '````\\1', x)
    x = gsub('^\\[sourcecode[^]]*]', '````', x)
    x = gsub('^\\[code lang=([a-z]+)]', '````\\1', x)
    x = gsub('^\\[code[^]]+]', '````', x)
    x = gsub('^\\[/(source)?code]$', '````', x)
    x = gsub('^(\\s*)</code>(.*)', '\\1\\2', x)
    # possible images in section headings
    x = gsub('^#+ (!\\[[^]]*]\\([^)]+\\))\\s*$', '\\1', x)
    # unbalanced **
    z = grep('^[*]{2}[^*]+$', x); n = length(z)
    if (n > 1 && n %% 2 == 0) {
      for (i in seq(1, n, by = 2)) {
        z2 = z[i + 1]; z1 = z[i]
        if (z2 - z1 != 1) next
        x[z1] = paste0(x[z1], '**\n')
        x[z2] = gsub('^[*]{2}', '', x[z2])
      }
    }
    # **_foo_** -> _foo_
    x = gsub('[*]{2}(_[^_]+_)[*]{2}', '\\1', x)
    # extra space before the closing **
    x = gsub('(^| )([*]{2}[^*]+?)\\s+([*]{2})\\s*', '\\1\\2\\3 ', x)
    x
  })
  
  # move inline images ![]() to separate paragraphs
  :process_file(f, function(x) {
    i = grep('^\\s*[[!]', x, invert = TRUE)
    x[i] = gsub('(!\\[[^]]*]\\([^)]+\\))', '\n\n\\1\n\n', x[i])
    x
  })
  
  :remove_extra_empty_lines(f)
}



# old permalinks
links1 = local({
  x = readLines(xml_file)
  r = paste0('\\s*<link>', new_url, '/(.*)</link>\\s*')
  i = grep(r, x)
  gsub(r, '\\1', x[i])
})

# new permalinks
links2 = local({
  res = :collect_yaml(c('date', 'slug'), 'post', sort = FALSE, uniq = FALSE)
  mapply(function(d, s) {
    paste0(gsub('-', '/', d), '/', s, '/')
  }, res$date, res$slug, USE.NAMES = FALSE)
})

links3 = setdiff(links2, links1)
if (length(links3)) {
  message('These links on the new website cannot be mapped back to the old website:')
  cat(links3, sep = '\n')
}


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


file            <- readLines(f)
range_yaml      <- seq(from =1, to =match("---",file[2:length(file)]))
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

