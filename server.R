library(ggplot2)

obesity_combined_df <- read.csv("/Users/yanghan/Downloads/obesity_combined.csv")
obesity_combined_df <- obesity_combined_df %>% 
  mutate(State = tolower(State))

install.packages("maps")
install.packages("mapproj")
state_shape <- map_data("state")
blank_theme <- theme_bw() + theme(
  plot.background = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
)

server <- function(input, output){
  output$viz_1_output_id <- renderPlotly({
    selected_df <- obesity_combined_df %>% 
      filter(State %in% input$use_selection)
    
    obesity_income_plot <- ggplot(selected_df) +
      geom_point(aes(x = Income_2020,
                   y = Obesity_2020,
                   color = State)) +
      scale_fill_brewer(palette = "Set3")+
      blank_theme +
      labs(
        title = "The relationship between Children's Obesity Level and average income differences",
        x = "Average Household Income",
        y = "Children's Obsesity Level in US", 
        color = "States" 
      )
    return(ggplotly(obesity_income_plot))})
  
  
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
    return(ggplotly(obesity_plot))})
  
  
  
    
  # TODO Make outputs based on the UI inputs here
  
}