library(shiny)
library(shinydashboard)
source("dashBox.R")
source("kpiTile.R")
source("kpiContainer.R")
library(formattable)

ui <- dashboardPage(
  dashboardHeader(title = "Amazing Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    fluidRow(
      createKpiContainer(title = "KPI Title",
                         uiOutput("kpiTile1"),
                         uiOutput("kpiTile2")
                         ),
      uiOutput("kpiContainer1"),
      uiOutput("dashKPI3"),
      uiOutput("dashKPI4")
    ),
    fluidRow(
      column(width = 12,
             tags$div(
               class   = "cw-container",
               style = "height: 600px;",
               checked = NA,
        formattableOutput("table"))
      )
    )
  )
)
