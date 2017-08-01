#'@importFrom reticulate tuple
node_type_builder <- function(types){

  types <- unique(types)

  typle <- lapply(types, function(x){
    if(x == "comments"){
      return(mwp_inst$nodes$Comment)
    }

    if(x == "external_links"){
      return(mwp_inst$nodes$ExternalLink)
    }

    if(x == "headings"){
      return(mwp_inst$nodes$Heading)
    }

    if(x == "html"){
      return(mwp_inst$nodes$HTMLEntity)
    }

    if(x == "tags"){
      return(mwp_inst$nodes$Tag)
    }
    if(x == "templates"){
      return(mwp_inst$nodes$Template)
    }
    if(x == "text"){
      return(mwp_inst$nodes$Text)
    }
    if(x == "wikilinks"){
      return(mwp_inst$nodes$Wikilink)
    }
  })

  return(
    reticulate::tuple(typle)
  )
}

#'@title Extract Nodes from Wikitext
#'
#'@description \code{get_nodes} retrieves nodes
#'of various (user-specified) types from a blob of
#'read-in wikitext. These are returned as a list
#'of node objects, which can be passed on to
#'other functions to retrieve components thereof.
#'
#'@param wikitext a chunk of wikitext read in with
#'\code{\link{read_wikitext}}.
#'
#'@param types which type(s) of node to read in. You
#'can pass in whichever number of supported types you
#'want.
#'
#'@examples
#'\dontrun{
#'text <- "this [[is|some]] {{wikitext}}"
#'
#'parsed_text <- read_wikitext(text)
#'
#'some_nodes <- get_nodes(parsed_text, types = c("wikilinks", "templates"))
#'}
#'@export
get_nodes <- function(wikitext, types = c("comments", "external_links",
                                          "headings", "html", "tags",
                                          "templates", "text",
                                          "wikilinks"),
                      recursive = TRUE){

  if(!all(types %in% c("template", "comments", "external_links",
                  "headings", "html", "tags", "templates",
                  "text", "wikilinks"))){
    stop("'types' must only contain supported types.
         See ?wikitext_nodes for more information")
  }

  return(wikitext$filter(forcetype = node_type_builder(types),
                         recursive = recursive))
}
