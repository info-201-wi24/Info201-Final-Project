library(shiny)

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)
ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
)