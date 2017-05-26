

get_external_links <- function(wt, recursive = TRUE){
  wt$filter_external_links(recursive = recursive)
}

get_comments <- function(wt, recursive = TRUE){
  wt$filter_comments(recursive = recursive)
}



get_wikilinks <- function(wt, recursive = TRUE){
  wt$filter_wikilinks(recursive = recursive)
}

get_text <- function(wt, recursive = TRUE){
  wt$filter_text(recursive = recursive)
}
