#' Dashboard KPI Tile Metric
#'
#' This function generates a KPI tile
#' measure for display in a dashboard
#'
#' @param width Uses bootstrap width default is 4
#' @param href Optional URL
#'
#' @return Renders shiny html template
createKpiTile <- function(width     = 3,
                          href      = NULL) {
  kpiTile <- tags$div(
    class             = "kpi-container",
    checked           = NA,
    tags$div(
      class           = "grid-container",
      checked         = NA,
      tags$div(
        class         = 'gd-title',
        checked       = NA,
        tags$h3(class = 'gd-title-text', "title")
      ),
      tags$div(
        class         = 'gd-measure',
        checked       = NA,
        tags$h3(class = 'gd-measure-text', "64")
      ),
      tags$div(
        class         = 'gd-trend',
        checked       = NA,
        tags$h3(class = 'gd-trend-text', "T")
      ),
      tags$div(
        class         = 'gd-target-icon',
        checked       = NA,
        tags$h3(class = 'gd-target-icon-text', "I")
      ),
      tags$div(
        class         = 'gd-target-kpi',
        checked       = NA,
        tags$h3(class = 'gd-target-kpi-text', "24")
      ),
      tags$div(
        class         = 'gd-var-icon',
        checked       = NA,
        tags$h3(class = 'gd-var-icon-text', "I")
      ),
      tags$div(
        class         = 'gd-var-kpi',
        checked       = NA,
        tags$h3(class = 'gd-var-kpi-text', "35")
      )
    )
  )


  div(class = if (!is.null(width))
    paste0("col-sm-", width),
    kpiTile)
}
