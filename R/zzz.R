mwp_inst <- NULL

#'@importFrom reticulate import
.onLoad <- function(libname, pkgname) {
  mwp_inst <<- reticulate::import("mwparserfromhell", delay_load = TRUE)
}
