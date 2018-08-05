library(shiny)
library(shinydashboard)
source("dashBox.R")
source("kpiTile.R")
source("husky.R")
source("kpiContainer.R")
library(formattable)
library(timevis)
library(rintrojs)
library(htmlwidgets)


ui <- dashboardPage(
  dashboardHeader(title = "Amazing Dashboard"),
  dashboardSidebar(
    introBox(sidebarMenu(
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Timeline", tabName = "timeline", icon = icon("th")),
      menuItem("Detail", tabName = "detail", icon = icon("th"))
    ),
    data.step = 1,
    data.intro = "These link to the different pages."
    ),
    actionButton("help", "Dashboard Guide"),
    tags$div(class="huskyspacer"),
    tags$div(class="huskydiv",
             createHusky())
  ),
  dashboardBody(
    introjsUI(),
    tags$script(HTML("var openTab = function(tabName){ $('a', $('.sidebar')).each(function() {if(this.getAttribute('data-value') == tabName) { this.click()};});}")),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "husky.css")
    ),
    tabItems(
      # DASHBOARD TAB
      tabItem(
        tabName = "overview",
        fluidRow(
          introBox(
            createKpiContainer(
              title = "Interactions",
              icon = "interactions-icon@3x.png",
              navtab = "timeline",
              uiOutput("kpiTile1"),
              uiOutput("kpiTile2")
            ),
            data.step = 2,
            data.intro = "This shows the interactions."
          ),
          introBox( uiOutput("dashKPI1"),
          data.step = 3,
          data.intro = "This shows the activities"
          ),
          introBox(createKpiContainer(
            title = "Timeliness",
            icon = "interactions-icon@3x.png",
            uiOutput("kpiTile5"),
            uiOutput("kpiTile6")
          ),
          data.step = 4,
          data.intro = "This shows the timeliness"
          ),
          introBox(createKpiContainer(
            title = "Outcomes",
            icon = "interactions-icon@3x.png",
            uiOutput("kpiTile7"),
            uiOutput("kpiTile8")
          ),
          data.step = 5,
          data.intro = "ggplot2 by Hadley Wickham is an excellent and flexible package for elegant data visualization in R. However the default generated plots requires some formatting before we can send them for publication. Furthermore, to customize a ggplot, the syntax is opaque and this raises the level of difficulty for researchers with no advanced R programming skills.

The 'ggpubr' package provides some easy-to-use functions for creating and customizing 'ggplot2'- based publication ready plots."
          )
        ),
        fluidRow(
          column(width = 12,
                 tags$div(
                   class   = "cw-container",
                   checked = NA,
                   formattableOutput("table"))
          )
      )),
      tabItem(tabName = "timeline", fluidRow(
        introBox(timevisOutput("timelineVis"),
          data.step = 6,
          data.intro = "This shows the activities"
        )
      )),
      tabItem(tabName = "detail", fluidRow())
    )
  )
)
