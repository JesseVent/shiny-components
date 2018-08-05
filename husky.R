#' Create a husky to guard your dashboard
#'
#' @export
createHusky <- function() {
  husky <- tags$div(
    class = "husky",
    tags$div(class = "mane",
             tags$div(class = "coat")),
    tags$div(
      class = "body",
      tags$div(
        class = "head",
        tags$div(class = "ear"),
        tags$div(class = "ear"),
        tags$div(
          class = "face",
          tags$div(class = "eye"),
          tags$div(class = "eye"),
          tags$div(class = "nose"),
          tags$div(class = "mouth",
                   tags$div(class = "lips"),
                   tags$div(class = "tongue"))
        )
      ),
      tags$div(class = "torso")
    ),
    tags$div(
      class = "legs",
      tags$div(class = "front-legs",
               tags$div(class = "leg"),
               tags$div(class = "leg")),
      tags$div(class = "hind-leg")
    ),
    tags$div(class = "tail",
   tags$div(
     class = "tail",
     tags$div(class = "tail",
              tags$div(
        class = "tail",
        tags$div(class = "tail",
     tags$div(class = "tail",
    tags$div(class = "tail")))
    ))
   ))
)

}
