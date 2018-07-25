library(shiny)
library(shinydashboard)
source("dashBox.R")
source("kpiTile.R")
source("kpiContainer.R")
library(formattable)
library(timevis)



ui <- dashboardPage(
  dashboardHeader(title = "Amazing Dashboard"),
  dashboardSidebar(sidebarMenu(
    menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
    menuItem("Timeline", tabName = "timeline", icon = icon("th")),
    menuItem("Detail", tabName = "detail", icon = icon("th"))
  )),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    tabItems(
      # DASHBOARD TAB
      tabItem(tabName = "overview",
    fluidRow(
      createKpiContainer(title = "Interactions",
                         icon = "interactions-icon@3x.png",
                         href = "#shiny-tab-timeline",
                         navtab = "timeline",
                         uiOutput("kpiTile1"),
                         uiOutput("kpiTile2")
                         ),
      createKpiContainer(title = "Activities",
                         icon = "interactions-icon@3x.png",
                         uiOutput("kpiTile3"),
                         uiOutput("kpiTile4")
      ),
      createKpiContainer(title = "Timeliness",
                         icon = "interactions-icon@3x.png",
                         uiOutput("kpiTile5"),
                         uiOutput("kpiTile6")
      ),
      createKpiContainer(title = "Outcomes",
                         icon = "interactions-icon@3x.png",
                         uiOutput("kpiTile7"),
                         uiOutput("kpiTile8")
      )
    )
      ),
    tabItem(tabName = "timeline", fluidRow(
      timevisOutput("timelineVis")
    )),
    tabItem(tabName = "detail", fluidRow()))
  )
)
