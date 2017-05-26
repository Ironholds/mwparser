testthat::context("Test template extraction")

skip_if <- function() {
  has_mwp <- reticulate::py_module_available("mwparserfromhell")
  if (!has_mwp){
    skip("foo not available for testing")
  }
}

wt <- "==this is a header==\n with {{a|template}}\n{{or|two}}"

testthat::test_that("Templates can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_templates(parsed)
  testthat::expect_length(extracted, 2)
})

testthat::test_that("Template names can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_templates(parsed)
  t_names <- template_names(extracted, text = TRUE)
  testthat::expect_length(extracted, 2)
  testthat::expect_equal(t_names, c("a", "or"))
})

testthat::test_that("Template parameters can be extracted", {
  skip_if()
  parsed <- parse_wikitext(wt)
  extracted <- get_templates(parsed)
  titles <- unlist(template_params(extracted, text = TRUE))
  testthat::expect_length(extracted, 2)
  testthat::expect_equal(titles, c("template", "two"))
})
