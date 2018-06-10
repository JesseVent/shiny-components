library(shiny)
library(shinydashboard)
source("dashBox.R")

ui <- dashboardPage(
  dashboardHeader(title = "Amazing Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    fluidRow(
      uiOutput("dashKPI1"),
      uiOutput("dashKPI2"),
      uiOutput("dashKPI3"),
      uiOutput("dashKPI4")
    )
  )
)
