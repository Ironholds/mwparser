get_templates <- function(wt, recursive = TRUE){
  wt$filter_templates(recursive = recursive)
}

template_names <- function(templates, as_character = FALSE){

  out <- lapply(templates, function(x, as_character){

    holding <- x$name
    if(as_character){
      return(holding$strip_code)
    }
    return(holding)
  }, as_character = as_character)

  if(as_character){
    return(unlist(out))
  }

  return(out)
}

template_params <- function(templates, as_character = FALSE){

  out <- lapply(templates, function(x, as_character){

    params <- x$params

    if(as_character){
      stripped_params <- lapply(params, function(x){
        return(x$value$strip_code())
      })
      return(unlist(stripped_params))
    }
    return(params)
  }, as_character = as_character)

  return(out)
}
