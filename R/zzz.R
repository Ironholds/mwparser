mwp_inst <- NULL

#'@importFrom reticulate py_available import
.onLoad <- function(libname, pkgname) {
  mwp_inst <<- reticulate::import("mwparserfromhell", delay_load = TRUE)
}
