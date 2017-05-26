## Wikimarkup parsing in R
A package for parsing, chucking and modifying wikimarkup in R.

__Author:__ Oliver Keyes<br/>
__License:__ [MIT](http://opensource.org/licenses/MIT)<br/>
__Status:__ In development

### Description

Wikimarkup is the language used on Wikipedia and similar projects, and as such contains
a lot of valuable data both for scientists studying collaborative systems and people
studying things documented on or in Wikipedia. `mwparser` parses wikimarkup, allowing a
user to filter down to specific types of tags such as links or templates, and then extract components of those tags.

### Example

```
library(mwparser)
library(magrittr)
wikitext <- "this is wikitext with \n [[a|link]] [[or|two]]"

link_paths <- parse_wikitext(wikitext) %>%
  get_wikilinks %>%
  wikilink_paths(text = TRUE)

link_paths
[1] "a"  "or"
```

### Installation

`mwparser` depends on two things; the [reticulate](https://rstudio.github.io/reticulate/) R package and the Python library [mwparserfromhell](https://github.com/earwig/mwparserfromhell). To install the whole stack, assuming you have `pip`:

```
# In the terminal
pip install mwparserfromhell

# In R
install.packages("reticulate")
devtools::install_github("ropenscilabs/mwparser")
```

With that, you're good to go!

### Future work
The library currently has accessors to extract most common types of attribute and components from within them. The next step is exposing the rest of `mwparserfromhell`'s functionality, which includes:

1. More accessors
2. The ability to modify wikimarkup pages and their component elements;
3. The ability to write out the resulting, modified markup.

Some time after that the goal is to integrate MediaWiki's actual parser, as a replacement for the `mwparserfromhell` dependency, using [piton](https://github.com/Ironholds/piton).
