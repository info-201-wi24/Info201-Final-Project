library(plotly)
obesity_combined_df <- obesity_combined_df %>% 
  mutate(State = tolower(State))

## OVERVIEW TAB INFO
overview_tab <- tabPanel("Introduction",
   h1("INFO 201 Final Project"),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  selectInput(inputId = "use_selection",
              label = "Choose different states", 
              choices = obesity_combined_df$State, 
              selected = "washington", 
              multiple = TRUE),
  textInput(inputId = "title_input",
            label = "Enter graph title here")
  #TODO: Put inputs for modifying graph here
)

viz_1_main_panel <- mainPanel(
  h2("The relationship between average household income and children's obesity level"),
  plotlyOutput(outputId = "viz_1_output_id")
)

viz_1_tab <- tabPanel("The relationship between average household income and children's obesity level",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_2_main_panel <- mainPanel(
  h2("Map Data of Obsesity level"),
  plotlyOutput(outputId = "viz_2_output_id")
)

viz_2_tab <- tabPanel("Obesity Level Across US",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  selectInput(inputId = "use_selection",
              label = "Choose different states", 
              choices = obesity_combined_df$State, 
              selected = "washington", 
              multiple = TRUE),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  
  plotlyOutput(outputId = "viz_3_output_id")
)

viz_3_tab <- tabPanel("Viz 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Key Takeaways",
 h1("Conclusion"),
 p("After analyzing the data and considering various socioeconomic variables, our research has led us to an important conclusion: the correlation between childhood obesity and household income across US states is not straightforward. 
Despite our initial hypotheses, the numerous socioeconomic factors complicates the relationship between these two variables. 


While it's tempting to draw direct correlations between childhood obesity rates and household income levels, our findings suggest otherwise. 
The multifaceted nature of socioeconomic conditions, including access to healthy food options, educational opportunities, healthcare resources, and community environments, introduces significant complexity into our analysis. 


Therefore, as we conclude our study, it's crucial to acknowledge the limitations of oversimplified interpretations and recognize the need for multifaceted approaches to addressing childhood obesity. 
Public health policies and interventions must take into account the intricate web of determinants that influence health outcomes. By understanding and addressing these factors, we can better serve the diverse needs of communities and work towards achieving equitable health outcomes for all children.


In essence, while our research may not provide clear-cut answers regarding the correlation between childhood obesity and household income, it shows the importance of considering all of the socioeconomic variables at play. 
Our research process has highlighted the necessity of holistic, inclusive approaches when tackling the challenges of childhood obesity.
")
)



ui <- navbarPage("INFO 201",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)