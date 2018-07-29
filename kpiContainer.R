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
#' @param navtab Tab to navigate to
#' @param ... Contents of the box.
#'
#' @export
createKpiContainer <-
  function(...,
           title = NULL,
           icon = NULL,
           width = 3,
           navtab = NULL) {
    kpiContainer <-
      tags$div(
        class = "kpi-container",
        tags$div(class = "kpi-comp-header"),
        tags$div(
          class = "kpi-comp-icon",
          tags$div(
            class = "kpi-comp-circle",
            style = paste0(
              "background-image: url('",
              icon,
              "'); background-size: contain"
            )
          )
        ),
        tags$div(class = "kpi-comp-title", title),
        if (!is.null(navtab)) {
          div(class = "kpi-comp-chevron", icon("chevron-right", "fa-2x"))
        } ,
        tags$div(class = "kpi-comp-container", ...)
      )

    if (!is.null(navtab)) {
      kpiContainer <-
        a(onclick = paste0("openTab('", navtab, "')"),
          href = "#",
          kpiContainer
        )
    }
    div(class = if (!is.null(width)) {
      paste0("col-sm-", width)
    }, kpiContainer)
  }

#' Create a KPI spacer to be used within a KPI container.
#' KPi spacers can be used to break up the KPI tiles within a container.
#'
#' @param title Optional title.
#' @export
createKpiSpacer <- function(title = NULL) {
  kpiSpacer <- tags$div(class = "kpi-comp-spacer", title)
}
