get_wikitext <- function(url){

}

#'@title Read Wikitext
#'
#'@description Initially reads and parses a pile of wikitext,
#'turning it into an object that can have elements extracted from it.
#'
#'@param wikitext a pile of wikitext, as a string, grabbed via
#'\code{\link{get_wikitext}} or through any other way
#'
#'@param skip_styles whether to skip style tags, which (very
#'occasionally) cause parsing problems. \code{FALSE} by default.
#'
#'@examples
#'# Simple example
#'wt <- "==this is a header==\n with {{a|template}}"
#'parsed <- read_wikitext("wt")
#'
#'@export
read_wikitext <- function(wikitext, skip_styles = FALSE){
  out <- mwp_inst$parse(wikitext, skip_style_tags = skip_styles)
}
