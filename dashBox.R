#' Dashboard KPI Metric
#'
#' This function generates a KPI
#' measure for display in a dashboard
#'
#' @param title Title to be displayed
#' @param value The metric or measure
#' @param subtitle1 Subtitle 1.
#' @param subvalue1 Metric or measure.
#' @param subtitle2 Subtitle 2.
#' @param subvalue2 Second metric or measure
#' @param vartitle Variance title
#' @param varvalue Variance value or measure.
#' @param width Uses bootstrap width default is 4
#' @param href Optional URL
#'
#' @return Renders shiny html template
createDashBox <- function(title,
                          value     = NULL,
                          subtitle1 = NULL,
                          subvalue1 = NULL,
                          subtitle2 = NULL,
                          subvalue2 = NULL,
                          vartitle  = NULL,
                          varvalue  = NULL,
                          width     = 3,
                          href      = NULL) {
  boxContent <- tags$div(
    class   = "cw-container",
    checked = NA,
    tags$div(
      class   = "cw-widget",
      checked = NA,
      tags$div(
        class   = "cw-section cw-section-info",
        checked = NA,
        tags$h3(class = "cw-info-title", title),
        tags$h2(class = "cw-info-value", value),
        tags$div(
          class = "cw-info-block-perf",
          tags$div(
            class   = "cw-info-block",
            checked = NA,
            tags$dl(tags$dt(subvalue1),
                    tags$dd(subtitle1))
          ),
          tags$div(
            class = "cw-info-block last",
            checked = NA,
            tags$dl(tags$dt(subvalue2),
                    tags$dd(subtitle2))
          )
        ),
        tags$div(
          class = "cw-info-block-perf",
          tags$div(
            class = "cw-info-perf",
            checked = NA,
            tags$h4("Performance"),
            tags$ul(
              tags$li(tags$span(class = "orange", style = "height: 70%")),
              tags$li(tags$span(class = "orange", style = "height: 85%")),
              tags$li(tags$span(class = "orange", style = "height: 40%")),
              tags$li(tags$span(class = "green",  style = "height: 75%")),
              tags$li(tags$span(class = "green",  style = "height: 50%")),
              tags$li(tags$span(class = "green",  style = "height: 15%")),
              tags$li(tags$span(class = "green",  style = "height: 25%")),
              tags$li(tags$span(class = "orange", style = "height: 45%"))
            )
          ),
          tags$div(
            class   = "cw-yearly-change",
            checked = NA,
            tags$h4(vartitle),
            tags$span(tags$em("+"), varvalue)
          )
        )
      )
    )
  )

  if (!is.null(href))
    boxContent <- a(href = href, boxContent)

  div(class = if (!is.null(width))
    paste0("col-sm-", width),
    boxContent)
}
