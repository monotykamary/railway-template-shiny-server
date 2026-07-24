library(shiny)

ui <- fluidPage(
  title = "Shiny Server on Railway",
  tags$head(
    tags$style(HTML("
      body { background: #f7f9fc; }
      .container-fluid { max-width: 1080px; padding-top: 2rem; }
      .hero { background: white; border-radius: 16px; padding: 2rem; box-shadow: 0 10px 30px rgba(20, 40, 80, .08); }
      .status { display: inline-block; color: #116329; background: #dafbe1; border-radius: 999px; padding: .3rem .75rem; font-weight: 600; }
      .plot-wrap { margin-top: 1.5rem; background: white; border-radius: 16px; padding: 1.5rem; box-shadow: 0 10px 30px rgba(20, 40, 80, .08); }
    "))
  ),
  div(
    class = "hero",
    span(class = "status", "Shiny Server is running"),
    h1("Interactive R applications on Railway"),
    p("This sample verifies HTTP delivery, reactive sessions, and server-side R rendering."),
    sliderInput("bins", "Histogram bins", min = 5, max = 50, value = 20)
  ),
  div(class = "plot-wrap", plotOutput("histogram", height = "360px"))
)

server <- function(input, output, session) {
  output$histogram <- renderPlot({
    breaks <- seq(min(faithful$waiting), max(faithful$waiting), length.out = input$bins + 1)
    hist(
      faithful$waiting,
      breaks = breaks,
      col = "#4b8bbe",
      border = "white",
      main = "Old Faithful waiting times",
      xlab = "Minutes"
    )
  })
}

shinyApp(ui, server)
