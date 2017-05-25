#'@title Extract Headings
#'@aliases headings
#'@rdname headings
#'
#'@description Wikimarkup contains headers, stored as
#'text surrounded by a varying number of equals signs
#'that denote the 'level' of that heading. These
#'functions allow you to extract headings and their
#'various attributes from wikimarkup.
#'
#'@param wt a wikitext object returned from
#'\code{\link{parse_wikitext}}
#'
#'@param headings a list of headings retrieved with
#'\code{get_headings}
#'
#'@param recursive whether to recursively extract
#'headings. TRUE by default.
#'
#'@param as_text whether to return the heading titles
#'as text. TRUE by default.
#'
#'@examples
#'
#'# Get wikitext
#'wt <- "==this is a header==\n with {{a|template}}"
#'parsed <- read_wikitext(wt)
#'
#'# Extract headings
#'headings <- get_headings(parsed)
#'
#'# Get their levels
#'levels <- heading_level(headings)
#'
#'# Get the actual title text
#'title_text <- heading_title(headings)
#'
#'@export
get_headings <- function(wt, recursive = TRUE){
  return(wt$filter_headings(recursive = recursive))
}

#'@rdname headings
#'@export
heading_level <- function(headings){
  return(lapply(headings, function(x){
    return(x$level)
  }))
}

#'@rdname headings
#'@export
heading_title <- function(headings, as_text = FALSE){
  return(lapply(headings, function(x, as_text){
    result <- x$title
    if(as_text){
      return(as_text(result))
    }
    return(result)
  }))
}
