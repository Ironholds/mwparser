#'@title Extract External Links
#'@aliases external_links
#'@rdname external_links
#'
#'@description Wikimarkup contains external links,
#'stored as a URL and a display title, separated
#'by a space, with the whole thing wrapped in a pair of
#'square brackets.
#'These functions allow you to extract external URLs and their
#'various attributes from wikimarkup.
#'
#'@param wt a wikitext object returned from
#'\code{\link{parse_wikitext}}
#'
#'@param external_links a list of external links retrieved with
#'\code{get_external_links}
#'
#'@param recursive whether to recursively extract
#'external links. TRUE by default.
#'
#'@param text whether to return the results
#'as a character vector. FALSE by default.
#'
#'@examples
#'
#'# Get wikitext
#'wt <- "this is [http://an.external link]"
#'parsed <- parse_wikitext(wt)
#'
#'# Extract external link
#'wls <- get_external_links(parsed)
#'
#'# Get the actual links
#'paths <- link_urls(wls)
#'
#'# Get the display titles
#'display_title <- link_title(wls)
#'
#'@export
get_external_links <- function(wt){
  return(wt$filter_external_links())
}

#'@rdname external_links
#'@export
link_titles <- function(external_links, text = FALSE){

  out <- lapply(external_links, function(x, text){
    result <- x$title
    if(text){
      return(result$strip_code())
    }
    return(result)
  }, text = text)

  if(text){
    return(unlist(out))
  }
  return(out)
}

#'@rdname external_links
#'@export
link_urls <- function(external_links, text = FALSE){

  out <- lapply(external_links, function(x, text){
    result <- x$url
    if(text){
      return(result$strip_code())
    }
    return(result)
  }, text = text)

  if(text){
    return(unlist(out))
  }
  return(out)
}
