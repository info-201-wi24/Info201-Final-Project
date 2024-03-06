library(ggplot2)
library(dplyr)
library(shiny)

obesity_combined_df <- read.csv("combined_obesity_income.csv")
obesity_combined_df <- obesity_combined_df %>% 
  mutate(State = tolower(State))
obesity_combined_df <- obesity_combined_df %>% 
  mutate(obesity_per_diff = Crude.Prevalence...5 - Crude.Prevalence...3, na.rm = TRUE)

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
      geom_point(aes(x = income_difference_20_10,
                   y = obesity_per_diff,
                   color = State)) +
      scale_fill_brewer(palette = "Set3")+
      blank_theme +
      labs(
        title = "The relationship between Children's Obesity Level and average income differences",
        x = "Difference in Household Income between 2010 and 2020",
        y = "Difference in Children's Obsesity Level Percentage in US between 2010 and 2020", 
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
      scale_fill_continuous(low = "light blue",
                            high = "dark blue") +
      labs(
        title = "Children Obsesity Level Across the States",
        x = "Children's Obesity Level across states in 2020",
        color = "States" 
      )
    return(ggplotly(obesity_plot))})
  
  
    output$viz_3_output_id <- renderPlotly({
      selected_df <- obesity_combined_df %>% 
        filter(State %in% input$user_selection)
      
      obesity_income_plot <- ggplot(selected_df) +
        geom_col(aes(x = Income_2020,
                       y = Obesity_2020,
                       fill = State)) +
        blank_theme +
        labs(
          title = "The relationship between Children's Obesity Level and 2020 Household Income",
          x = "Household Income in 2020",
          y = "Children's Obsesity Level in US in 2020", 
          color = "States" 
        )
      return(ggplotly(obesity_income_plot))})
  
  # TODO Make outputs based on the UI inputs here
  
}