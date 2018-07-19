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
  kpiTile <- tags$div(
    class            = "grid-container",
    checked          = NA,
    tags$div(class   = 'gd-title', title),
    tags$div(class   = 'gd-measure', measure),
    tags$div(class   = 'gd-trend', "text"),
    tags$div(class   = 'gd-target-icon', "text"),
    tags$div(class   = 'gd-target-kpi', target),
    tags$div(class   = 'gd-var-icon', "text"),
    tags$div(class   = 'gd-var-kpi', variance)
  )
}
