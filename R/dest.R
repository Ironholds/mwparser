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
  return(NA)
}

#'@title Get the destination of a link
#'
#'@description For Wikilink and ExternalLink nodes,
#'\code{get_dest} will retrieve the destination they
#'are pointing to.
#'
#'@param nodes a set of Wikitext nodes retrieved with
#'\code{\link{get_nodes}}
#'
#'@param as_text whether to return the results as
#'nodes or strings.
#'
#'@return Either a list of nodes or a vector
#'of strings, depending on \code{as_text}'s value.
#'
#'@examples
#'\dontrun{
#'library(magrittr)
#'library(mwparser)
#'raw_wikitext <- "[http://this.is.a external link]"
#'
#'text <- read_wikitext(raw_wikitext) %>%
#'    get_nodes(types = "external_links") %>%
#'    get_dest
#'}
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
