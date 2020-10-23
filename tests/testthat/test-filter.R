test_that("filter_data", {
  expect_equal(filter_data(tb, "US"),
               covid19_time %>%
                 dplyr::filter(country == "US"
                            ))

  expect_error(filter_data(tb, "US"))

})
