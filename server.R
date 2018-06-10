#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$dashKPI1  <- renderUI({createDashBox(
    title = "Title Text",
    value     = "Value",
    subtitle1  = "Subtitle 1",
    subvalue1  = "Valie",
    subtitle2  = "Subtitle 2",
    subvalue2  = "Value",
    vartitle  = "Variance",
    varvalue  = "Value",
    width = 3
  )
})

  output$dashKPI2  <- renderUI({createDashBox(
    title = "Title Text",
    value     = "Value",
    subtitle1  = "Subtitle 1",
    subvalue1  = "Valie",
    subtitle2  = "Subtitle 2",
    subvalue2  = "Value",
    vartitle  = "Variance",
    varvalue  = "Value",
    width = 3
  )
  })

  output$dashKPI3  <- renderUI({createDashBox(
    title = "Title Text",
    value     = "Value",
    subtitle1  = "Subtitle 1",
    subvalue1  = "Valie",
    subtitle2  = "Subtitle 2",
    subvalue2  = "Value",
    vartitle  = "Variance",
    varvalue  = "Value",
    width = 3
  )
  })

  output$dashKPI4  <- renderUI({createDashBox(
    title = "Title Text",
    value     = "Value",
    subtitle1  = "Subtitle 1",
    subvalue1  = "Valie",
    subtitle2  = "Subtitle 2",
    subvalue2  = "Value",
    vartitle  = "Variance",
    varvalue  = "Value",
    width = 3
  )
  })


})
