
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

source("mgsub.R")
source("transliterate.R")

library(shiny)
library(markdown)
library(dplyr)


shinyServer(function(input, output) {
        
        # You can access the value of the widget with input$text, e.g.
        output$text <- renderPrint({ new_text <- transliterate(tolower(
                                     input$text), model = input$outputModel)
                                     new_text
                })
        
        
        new_text <- reactive({
                new_text <- transliterate(tolower(input$text), model = input$outputModel)
                new_text <- gsub("<br/>", "\n", new_text)
                new_text
                })
        
        output$downloadData <- downloadHandler(
          filename = function() {
            paste(gsub("patterns/(.+).csv", "\\1", input$outputModel), "_", Sys.Date(), ".txt", sep='')
          },
          content = function(file) {
            write.table(new_text(), file, quote = FALSE, row.names = FALSE, col.names = FALSE)
          })
})

