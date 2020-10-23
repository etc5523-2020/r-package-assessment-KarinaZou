#' Launch a shiny app
#'
#' @description To launches a shiny app when executed by the user
#'
#' @return My shiny app
#'
#' @examples
#' \dontrun{
#' launch_app()
#' }
#'
#' @export
launch_app <- function() {
  appDir <- system.file("app", package = "Coviddata")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `Coviddata`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}

