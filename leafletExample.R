library(shiny)
library(leaflet)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

ui <- fluidPage(  #ui.R 開始
  leafletOutput("mymap"),
  p(),
  actionButton("recalc", "New points")
)#ui.R結束

server <- function(input, output, session) { #server.R內容開始
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(30) * 2 + 13, rnorm(30) + 48)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points())
  })
}#server.R內容結尾

shinyApp(ui, server)#呼叫shiny App
