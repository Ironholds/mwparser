mwp_inst <- NULL

#'@importFrom reticulate py_available
.onLoad <- function() {
  mwp_inst <<- import("mwparserfromhell", delay_load = TRUE)
}
