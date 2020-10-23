


test_that("select_countryInput", {

  testthat::expect_equal(select_countryInput(summary_df),
                         shiny:: selectizeInput("countryInput", "Country",
                                                choices = unique(summary_df$country),
                                                selected="US", multiple =FALSE))
}
)
