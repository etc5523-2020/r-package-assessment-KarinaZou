#' Selection of provinces for users in app
#'
#' @description Let users to choose which country they want to select in shiny app
#'
#' @param data A dataset containing `Country` in columns.
#'
#'
#' @export
#'
select_countryInput <- function(data) {
  selectizeInput("countryInput", "Country",
                 choices = unique(data$country),
                 selected="US", multiple =FALSE)


}
