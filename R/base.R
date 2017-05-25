get_wikitext <- function(url){

}

read_wikitext <- function(wikitext, skip_styles = FALSE){
  return(mwp_inst$parse(wikitext, skip_style_tags = skip_styles))
}
