#'@export
get_body.mwparserfromhell.nodes.tag.Tag <- function(node, as_text){
  out <- node$contents
  if(as_text){
    return(reticulate::py_str(out))
  }
  return(out)
}


#'@import methods
#'@export
get_body <- function(nodes, as_text = FALSE){
  out <- lapply(nodes, function(node, as_text){
    UseMethod("get_body", node)
  }, as_text = as_text)
  return(unlist(out))
}
