library(ggplot)
library(ggplotly)

obesity_combined_df <- read.csv("/Users/yanghan/Desktop/final-project-/Obesity_Dataset.csv")
obesity_combined_df <- 

install.packages("maps")
install.packages("mapproj")
state_shape <- map_data("state")

server <- function(input, output){
  output$viz_1_output_id <- renderPlotly({
    selected_df <- obesity_combined_df %>% 
      filter(States %in% input$use_selection)
    
    obesity_income_plot <- ggplot(selected_df) +
      geom_point(aes(x = Value,
                   y = reorder(Country.Name, -Value),
                   color = States)) +
      labs(
        title = "Percent College Educated versus Poverty Rates",
        x = "Percentage of College Educated Adults",
        y = "Percentage of Adults Living in Poverty", 
        color = "States" 
      )
    return(ggplotly(obesity_plot))})
    
  
    output$viz_2_output_id <- renderPlotly({
      state_shape <- map_data("state")
      obesity_shape_df <- left_join(obesity_combined_df, state_shape, by = c("State" = "region"))
      
      obesity_plot <- ggplot(obesity_shape_df) +
        geom_polygon(aes(x = long, y = lat,
                         group = group,
                         fill = Obesity_2020,
        )) +
        coord_map() +
        blank_theme +
        labs(
          title = "Children Obsesity Level Across the States",
          x = "Percentage of College Educated Adults",
          y = "Percentage of Adults Living in Poverty", 
          color = "States" 
        )
      ggplotly(obesity_plot)
      return(ggplotly(obesity_plot))})
    
  
    
  # TODO Make outputs based on the UI inputs here
  
}