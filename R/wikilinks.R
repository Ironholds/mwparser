#'@title Extract Wikilinks
#'@aliases wikilinks
#'@rdname wikilinks
#'
#'@description Wikimarkup contains internal (wiki) links,
#'stored as a page name and a display title, separated
#'by pipes, with the whole thing wrapped in a pair of
#'square brackets.
#'These functions allow you to extract wikilinks and their
#'various attributes from wikimarkup.
#'
#'@param wt a wikitext object returned from
#'\code{\link{parse_wikitext}}
#'
#'@param wikilinks a list of wikilinks retrieved with
#'\code{get_wikilinks}
#'
#'@param recursive whether to recursively extract
#'wikilinks TRUE by default.
#'
#'@param text whether to return the results
#'as a character vector. FALSE by default.
#'
#'@examples
#'
#'# Get wikitext
#'wt <- "this is [[a|link]]"
#'parsed <- parse_wikitext(wt)
#'
#'# Extract wikilink
#'wls <- get_wikilinks(parsed)
#'
#'# Get the link paths
#'paths <- wikilink_paths(wls)
#'
#'# Get the display text
#'display_text <- wikilink_text(wls)
#'
#'@export
get_wikilinks <- function(wt){
  return(wt$filter_wikilinks())
}

#'@rdname wikilinks
#'@export
wikilink_paths <- function(wikilinks, text = FALSE){

  out <- lapply(wikilinks, function(x, text){
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

#'@rdname wikilinks
#'@export
wikilink_text <- function(wikilinks, text = FALSE){

  out <- lapply(wikilinks, function(x, text){
    result <- x$text
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
