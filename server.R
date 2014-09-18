# server.R
  
age <- function(bdate) {
      round(as.numeric(difftime(Sys.Date(), as.Date(bdate), unit="weeks"))/52.25, digits = 2)
}

shinyServer(
        function(input, output) {
        output$odate <- renderPrint({input$bdate})
        output$sex <- renderPrint({input$sex})
        output$age <- renderPrint({age(input$bdate)})
        
        output$image2 <- renderImage({
          if (is.null(input$sex))
            return(NULL)
          
          if (input$sex == "Male" && as.Date(input$bdate) <= as.Date('1955-01-01')) {
            return(list(
              src = "www/grandpa.jpg",
              contentType = "image/jpeg",
              alt = "Grandpa"
            ))
          } else if (input$sex == "Male" && (as.Date(input$bdate) > as.Date('1955-01-01') && as.Date(input$bdate) < as.Date('2000-01-01'))) {
            return(list(
              src = "www/philcollins.jpg",
              filetype = "image/jpeg",
              alt = "middle aged man"
            ))
          } else if (!is.null(input$sex) && as.Date(input$bdate) >= as.Date('2000-01-01')) {
            return(list(
              src = "www/baby.jpg",
              filetype = "image/jpeg",
              alt = "baby"
            ))
          } else if (input$sex == "Female" && (as.Date(input$bdate) > as.Date('1955-01-01') && as.Date(input$bdate) < as.Date('2000-01-01'))) {
            return(list(
              src = "www/cougar.jpg",
              filetype = "image/jpeg",
              alt = "middle aged woman"
            ))
          } else if (input$sex == "Female" && (as.Date(input$bdate) < as.Date('1955-01-01'))) {
            return(list(
              src = "www/grandma.jpg",
              filetype = "image/jpeg",
              alt = "grandma"
            ))

          }
          
        }, deleteFile = FALSE)
}
)