#'@importFrom reticulate py_str
as_text <- function(wt){

  result <- lapply(wt, function(x){
    if(is.list(x)){
      return(as_text(x))
    } else {
      return(reticulate::py_str(x))
    }
  })

  return(result)
}
