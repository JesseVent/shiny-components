#' Create a KPI tile for the KPI container of a dashboard
#'
#' KPI tiles are used to display metrics
#' inside of the KPI container component
#' in the main body of a dashboard.
#'
#' @param title KPI title to be displayed
#' @param measure The measure or metric for the KPI
#' @param target Optional target for the metric
#' @param variance Optional variance for the metric
#'
#' @export
createKpiTile <- function(title    = NULL,
                          measure  = NULL,
                          target   = NULL,
                          variance = NULL) {
  target   <- ifelse(is.null(target), target <- "TBD", target)
  variance <- ifelse(is.null(variance), variance <- "TBD", variance)
  kpiTile  <- tags$div(
    class            = "grid-container",
    checked          = NA,
    tags$div(class   = 'gd-title', title),
    tags$div(class   = 'gd-measure', measure),
    tags$div(class   = 'gd-trend', tags$img(src="TrendingDown.png", height="28px", width = "28px")),
    tags$div(class   = 'gd-target-icon',  icon("crosshairs", "fa-2x")),
    tags$div(class   = 'gd-target-kpi', target),
    tags$div(class   = 'gd-var-icon', icon("thermometer-full", "fa-2x")),
    tags$div(class   = 'gd-var-kpi', variance)
  )
}
