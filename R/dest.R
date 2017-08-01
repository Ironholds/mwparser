#'@export
get_dest.mwparserfromhell.nodes.external_link.ExternalLink <- function(node, as_text){
  out <- node$url
  if(as_text){
    return(reticulate::py_str(out))
  }

  return(out)
}

#'@export
get_dest.mwparserfromhell.nodes.wikilink.Wikilink <- function(node, as_text){
  out <- node$title
  if(as_text){
    return(reticulate::py_str(out))
  }

  return(out)
}

#'@export
get_dest.default <- function(node, as_text){
  stop("Only wikilink and external links can have destinations retrieved")
}

#'@title Get the destination of a link
#'
#'@description For Wikilink and ExternalLink nodes,
#'\code{get_dest} will retrieve the destination they
#'are pointing to.
#'
#'@import methods
#'@export
get_dest <- function(nodes, as_text = FALSE){
  if(!is.list(nodes)){
    nodes <- list(nodes)
  }
  out <- lapply(nodes, function(node, as_text){
    UseMethod("get_dest", node)
  }, as_text = as_text)
  return(unlist(out))
}
