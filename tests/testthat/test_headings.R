testthat::context("Test header extraction")

skip_if <- function() {
  has_mwp <- reticulate::py_module_available("mwparserfromhell")
  if (!has_mwp){
    skip("foo not available for testing")
  }
}

wt <- "==this is a header==\n with {{a|template}}\n===andanother==="


testthat::test_that("Headers can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_headings(parsed)
  testthat::expect_length(extracted, 2)
})

testthat::test_that("Header levels can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_headings(parsed)
  levels <- heading_level(extracted)
  testthat::expect_length(extracted, 2)
  testthat::expect_equal(levels, c(2, 3))
})

testthat::test_that("Header title can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_headings(parsed)
  titles <- heading_title(extracted)
  testthat::expect_length(extracted, 2)
})

testthat::test_that("Header title can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_headings(parsed)
  titles <- heading_title(extracted, text = TRUE)
  testthat::expect_length(titles, 2)
  testthat::expect_equal(titles,
                         c("this is a header", "andanother"))
})
