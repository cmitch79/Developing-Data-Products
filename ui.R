# ui.R

shinyUI(
  fluidPage(
    titlePanel("How Old Are You?"),
    sidebarLayout(
      sidebarPanel(imageOutput("image2")),
      mainPanel(
        selectInput("sex","Sex:",c("Male" = "Male","Female" = "Female")),
        dateInput("bdate","Birthday (YYYY-MM-DD):"),
        h5('You Are A'),
        verbatimTextOutput("sex"),
        h5('You Were Born On'),
        verbatimTextOutput("odate"),
        h5('Here\'s Your Age in Years'),
        verbatimTextOutput("age")
      )
    )
  )
)
