library(plotly)

## OVERVIEW TAB INFO

overview_tab <- tabPanel("Overview Tab Title",
   h1("INFO 201 Final Project"),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  selectInput(inputId = "use_selection",
              label = "Choose different states", 
              choices = obesity_combined_df$State, 
              selected = "Washington", 
              multiple = TRUE),
  textInput(inputId = "title_input",
            label = "Enter graph title here")
  #TODO: Put inputs for modifying graph here
)

viz_1_main_panel <- mainPanel(
  h2("The relationship between average household income and obsesity level"),
  plotlyOutput(outputId = "viz_1_output_id")
)

viz_1_tab <- tabPanel("Viz 1 tab title",
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

viz_2_tab <- tabPanel("Viz 2 tab title",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("Viz 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Key Takeaways",
 h1("Some title"),
 p("some conclusions")
)



ui <- navbarPage("INFO 201",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)