library(shiny)
shinyServer(function(input, output, session) {
  datatime <- data.frame(
    id = 1:4,
    content = c("Item one", "Item two", "Ranged item", "Item four"),
    start = c(
      "2016-01-10",
      "2016-01-11",
      "2016-01-20",
      "2016-02-14 15:00:00"
    ),
    end = c(NA, NA, "2016-02-04", NA)
  )

  df <- data.frame(
    id = 1:10,
    name = c(
      "Bob",
      "Ashley",
      "James",
      "David",
      "Jenny",
      "Hans",
      "Leo",
      "John",
      "Emily",
      "Lee"
    ),
    age = c(28, 27, 30, 28, 29, 29, 27, 27, 31, 30),
    grade = c("C", "A", "A", "C", "B", "B", "B", "A", "C", "C"),
    test1_score = c(8.9, 9.5, 9.6, 8.9, 9.1, 9.3, 9.3, 9.9, 8.5, 8.6),
    test2_score = c(9.1, 9.1, 9.2, 9.1, 8.9, 8.5, 9.2, 9.3, 9.1, 8.8),
    final_score = c(9, 9.3, 9.4, 9, 9, 8.9, 9.25, 9.6, 8.8, 8.7),
    registered = c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE),
    stringsAsFactors = FALSE
  )

  output$table <- renderFormattable({
    formattable(
      df,
      list(
        age = color_tile("white", "orange"),
        grade = formatter("span", style = x ~ ifelse(
          x == "A",
          style(color = "green", font.weight = "bold"), NA
        )),
        area(col = c(test1_score, test2_score)) ~ normalize_bar("pink", 0.2),
        final_score = formatter(
          "span",
          style = x ~ style(color = ifelse(rank(-x) <= 3, "green", "gray")),
          x ~ sprintf("%.2f (rank: %02d)", x, rank(-x))
        ),
        registered = formatter(
          "span",
          style = x ~ style(color = ifelse(x, "green", "red")),
          x ~ icontext(ifelse(x, "ok", "remove"), ifelse(x, "Yes", "No"))
        )
      )
    )
  })

  output$dashKPI1 <- renderUI({
    createDashBox(
      title = "Title Text",
      value = "Value",
      subtitle1 = "Subtitle 1",
      subvalue1 = "Valie",
      subtitle2 = "Subtitle 2",
      subvalue2 = "Value",
      vartitle = "Variance",
      varvalue = "Value",
      graph = sample(1:100, 8),
      width = 3,
      href = "www.google.com"
    )
  })

  output$dashKPI2 <- renderUI({
    createDashBox(
      title = "Title Text",
      value = "Value",
      subtitle1 = "Subtitle 1",
      subvalue1 = "Valie",
      subtitle2 = "Subtitle 2",
      subvalue2 = "Value",
      vartitle = "Variance",
      varvalue = "Value",
      graph = sample(1:100, 8),
      width = 3
    )
  })

  output$dashKPI3 <- renderUI({
    createDashBox(
      title = "Title Text",
      value = "Value",
      subtitle1 = "Subtitle 1",
      subvalue1 = "Valie",
      subtitle2 = "Subtitle 2",
      subvalue2 = "Value",
      vartitle = "Variance",
      varvalue = "Value",
      graph = sample(1:100, 8),
      width = 3
    )
  })

  output$dashKPI4 <- renderUI({
    createDashBox(
      title = "Title Text",
      value = "Value",
      subtitle1 = "Subtitle 1",
      subvalue1 = "Valie",
      subtitle2 = "Subtitle 2",
      subvalue2 = "Value",
      vartitle = "Variance",
      varvalue = "Value",
      graph = sample(1:100, 8),
      width = 3
    )
  })

  output$kpiTile1 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 2834000,
      target = 124894,
      variance = 45993
    )
  })
  output$kpiTile2 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 283400,
      target = 124004,
      variance = 45399
    )
  })
  output$kpiTile3 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 2834000,
      target = 124894,
      variance = 45993
    )
  })
  output$kpiTile4 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 283400,
      target = 124004,
      variance = 45399
    )
  })

  output$kpiTile5 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 2834000,
      target = 124894,
      variance = 45993
    )
  })
  output$kpiTile6 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 283400,
      target = 124004,
      variance = 45399
    )
  })
  output$kpiTile7 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 2834000,
      target = 124894,
      variance = 45993
    )
  })
  output$kpiTile8 <- renderUI({
    createKpiTile(
      title = "Interactions",
      measure = 283400,
      target = 124004,
      variance = 45399
    )
  })
  output$timelineVis <- renderTimevis({
    timevis(datatime)
  })


  # start introjs when button is pressed with custom options and events
  observeEvent(input$help,
               introjs(
                 session,
                 options = list(
                   "nextLabel" = "Next",
                   "prevLabel" = "Previous",
                   "skipLabel" = "Skip"
                 )
               ))
})
