#'@export
get_displaytext.mwparserfromhell.nodes.text.Text <- function(node, as_text){
  if(as_text){
    return(node$value)
  }

  return(node)
}

#'@export
get_displaytext.mwparserfromhell.nodes.wikilink.Wikilink <- function(node, as_text){
  out <- node$text
  if(as_text){
    return(reticulate::py_str(out))
  }

  return(out)
}


#'@export
get_displaytext.mwparserfromhell.nodes.template.Template <- function(node, as_text){
  return(NA)
}

#'@export
get_displaytext.mwparserfromhell.nodes.heading.Heading <- function(node, as_text){
  out <- node$title
  return(get_displaytext(get_nodes(out, "text"), as_text)[1])
}

#'@export
get_displaytext.mwparserfromhell.nodes.external_link.ExternalLink <- function(node, as_text){
  out <- node$title
  if(as_text){
    return(reticulate::py_str(out))
  }

  return(out)
}

#'@export
get_displaytext.default <- function(node, as_text){
  return(NA)
}


#'@title Retrieve Displayed Text From Nodes
#'@description Some wikimarkup elements (wikilinks or text,
#'say) have chunks visible when parsed into HTML by MediaWiki.
#'\code{get_displaytext} retrieves the visible element
#'for each node in a list of nodes.
#'
#'@param nodes a list of nodes, retrieved with \code{\link{get_nodes}}.
#'
#'@param as_text whether to return the visible element of each node as
#'text rather than a Wikimarkup object. FALSE by default.
#'
#'@return a list of either wikimarkup objects or strings, depending
#'on the value of \code{as_text}. For nodes without a certain
#'display element (for example, templates), \code{NA}
#'will be returned.
#'
#'@seealso \code{\link{get_dest}} to retrieve the link destination
#'in the case of internal or external links.
#'
#'@examples
#'\dontrun{
#'library(magrittr)
#'library(mwparser)
#'raw_wikitext <- "==this is a header=="
#'
#'text <- read_wikitext(raw_wikitext) %>%
#'    get_nodes(types = "headings") %>%
#'    get_displaytext
#'
#'text
#'}
#'@import methods
#'@export
get_displaytext <- function(nodes, as_text = FALSE){
  out <- lapply(nodes, function(node, as_text){
    UseMethod("get_displaytext", node)
  }, as_text = as_text)
  return(unlist(out))
}
