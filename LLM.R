
library(shiny)
library(shinychat)

ui <- bslib::page_fluid(
  chat_ui("chat")
)

server <- function(input, output, session) {
  chat <- ellmer::chat_google_gemini(system_prompt = "You are a friendly expert programmer in R and markdown as well as an expert in infectious diseases. You provide advice and troubleshoot error messages in R and provide information on anti-infective treatments and infectious diseases")
  
  observeEvent(input$chat_user_input, {
    stream <- chat$stream_async(input$chat_user_input)
    chat_append("chat", stream)
  })
}

shinyApp(ui, server)


