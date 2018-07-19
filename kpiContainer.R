#' Create a KPI container for the main body of a dashboard
#'
#' KPI containers can be used to hold KPI tiles in the main body of a dashboard.
#'
#' @param title Optional title.
#' @param icon Optional icon.
#' @param width The width of the box, using the Bootstrap grid system. This is
#'   used for row-based layouts. The overall width of a region is 12, so the
#'   default valueBox width of 4 occupies 1/3 of that width. For column-based
#'   layouts, use \code{NULL} for the width; the width is set by the column that
#'   contains the box.
#' @param href Optional URL
#' @param ... Contents of the box.
#'
#' @export
createKpiContainer <-
  function(...,
           title = NULL,
           icon  = NULL,
           width = 3,
           href  = NULL) {
    kpiContainer <-
      tags$div(
        class                   = "kpi-container",
        tags$div(class          = 'kpi-comp-header'),
        tags$div(class          = 'kpi-comp-icon',
                 tags$div(class = 'kpi-comp-circle')),
        tags$div(class          = 'kpi-comp-title',
                 tags$h3(class  = 'kpi-comp-title-text', title)),
        if (!is.null(href))
          div(class             = "kpi-comp-chevron",
              tags$img(src      = "Shape@1x.png")),
        tags$div(class          = 'kpi-comp-container', ...)
      )

    if (!is.null(href))
      kpiContainer <- a(href = href, kpiContainer)
    div(class = if (!is.null(width))
      paste0("col-sm-", width), kpiContainer)
  }
