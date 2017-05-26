#'@title Extract Templates
#'@aliases templates
#'@rdname templates
#'
#'@description Wikimarkup contains templates, stored as
#'a name and a variable number of parameters, separated
#'by pipes, with the whole thing wrapped in curly braces.
#'These functions allow you to extract templates and their
#'various attributes from wikimarkup.
#'
#'@param wt a wikitext object returned from
#'\code{\link{parse_wikitext}}
#'
#'@param templates a list of templates retrieved with
#'\code{get_templates}
#'
#'@param recursive whether to recursively extract
#'templates. TRUE by default.
#'
#'@param text whether to return the template parameters
#'as character vectors. FALSE by default.
#'
#'@examples
#'
#'# Get wikitext
#'wt <- "this is {{a|template|okay?}}"
#'parsed <- parse_wikitext(wt)
#'
#'# Extract template
#'templates <- get_templates(parsed)
#'
#'# Get the templates' names
#'temp_names <- template_names(templates)
#'
#'# Get the actual parameter values
#'parameter_vals <- template_params(templates)
#'
#'@export
get_headings <- function(wt, recursive = TRUE){
  return(wt$filter_headings(recursive = recursive))
}

#'@rdname headings
#'@export
heading_level <- function(headings){
  return(unlist(lapply(headings, function(x){
    return(x$level)
  })))

}

#'@rdname headings
#'@export
get_templates <- function(wt, recursive = TRUE){
  wt$filter_templates(recursive = recursive)
}

#'@rdname templates
#'@export
template_names <- function(templates, text = FALSE){

  out <- lapply(templates, function(x, text){

    holding <- x$name
    if(text){
      return(holding$strip_code())
    }
    return(holding)
  }, text = text)

  if(as_character){
    return(unlist(out))
  }

  return(out)
}

#'@rdname templates
#'@export
template_params <- function(templates, text = FALSE){

  out <- lapply(templates, function(x, text){

    params <- x$params

    if(text){
      stripped_params <- lapply(params, function(x){
        return(x$value$strip_code())
      })
      return(unlist(stripped_params))
    }
    return(params)
  }, text = text)

  return(out)
}
