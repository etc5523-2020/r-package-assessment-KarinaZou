#' Filter data by countries and cases types
#'
#' @description A function to filter the countries .
#'
#' @param data A data frame containing a `country`  variable.
#' @param country_name The country let users to select.
#' @importFrom dplyr %>%
#'
#'
#' @export
#'
filter_data <- function(data, country_name){
  data %>%
    dplyr::filter(country == country_name
                  )
}
