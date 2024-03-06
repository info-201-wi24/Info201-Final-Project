library(plotly)
library(ggplot2)
library(shiny)
library(bslib)
library(dplyr)

my_theme <- bs_theme(bg = "black", # background
                     fg = "white", # foreground color
                     primary = "gray") # primary color

my_theme <- bs_theme_update(my_theme, bootswatch = "cerulean")

obesity_combined_df <- read.csv("combined_obesity_income.csv")
obesity_combined_df <- obesity_combined_df %>% 
  mutate(State = tolower(State))

## OVERVIEW TAB INFO
overview_tab <- tabPanel("Introduction",
   h1("Obesity Level vs US Household Income"),
   img(src = "healthwealth.png",
       height = "50%",
       width = "50%",
       alt = "Health & Money"),
   
   h2("Brief Overview:"),
   p("Welcome to our research project examining the correlation between childhood obesity and household income.
     In this study, we aim to explore how socioeconomic factors, specifically household income, may influence childhood obesity rates over time.
     Our primary focus is on comparing data from 2010 and 2020 to identify any significant patterns or changes. Join us on this journey as we delve
     into the complex relationship between childhood obesity and household income."),
   
   h2("Major Questions:"),
   p("Is there a correlation between childhood obesity rates and household income across the US states?"),
   p("How has this correlation within different US states evolved from 2010 to 2020?"),
   p("What socioeconomic factors beyond income might contribute to childhood obesity?"),
   
   h2("Data Sources (copy and paste links into your browser): "),
   p("https://www.cdc.gov/obesity/data/obesity-among-WIC-enrolled-young-children.html"),
   p("https://fred.stlouisfed.org/release/tables?eid=259515&rid=249"),
   p("We used these datasets from the CDC about obesity in young children and we also used a dataset from St. Louis FRED (Federal Reserrve Bank) 
     about the median household income. These are the 2 datasets that we combined to see if there was a correlation between the 2 variables."),
   
   h2("Ethical Considerations:"),
   p("Privacy: Ensuring the anonymity and confidentiality of survey respondents."),
   p("Bias: Recognizing potential biases in survey responses and data collection methods."),
   p("Interpretation: Acknowledging that correlation does not imply causation and that socioeconomic factors are multifaceted. 
     With too many variables it can be hard to determine any correlation between them."),
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Select States"),
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
)

viz_2_main_panel <- mainPanel(
  h2("Map Data of Obsesity level"),
  plotlyOutput(outputId = "viz_2_output_id")
)

viz_2_tab <- tabPanel("Obesity Level Across US",
    viz_2_main_panel
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Select States"),
  selectInput(inputId = "user_selection",
              label = "Choose different states", 
              choices = obesity_combined_df$State, 
              selected = "washington", 
              multiple = TRUE),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("The relationship between Children's Obesity Level and 2020 Household Income"),
  
  plotlyOutput(outputId = "viz_3_output_id")
)

viz_3_tab <- tabPanel("2020 Children's Obesity Level and Household Income",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Key Takeaways",
 h1("Conclusion"),
 p("After analyzing the data and considering various socioeconomic variables, our research has led us to three important conclusions:"),
 h6("1. Correlation doesn’t imply causation"),
 h6("2. Research involves several different factors"),
 h6("3. In order to fully understand the relationship between different variables, we need to have a holistic and inclusive research approach."),
 p("This is why despite our initial hypotheses, the numerous socioeconomic factors complicates the relationship between these two variables."),
 
 p("While it's tempting to draw direct correlations between childhood obesity rates and household income levels,
   our findings suggest otherwise. Just because there was some correlation between the two variables, it was not
   enough to determine a causation. The multifaceted nature of socioeconomic conditions, including access to healthy
   food options, educational opportunities, healthcare resources, and even genetics, introduces significant complexity into our analysis."),
 
 p("The research required to draw a causation between childhood obesity rates and household income levels requires
   the research of several factors. With so many different factors at play, it is hard to determine the exact cause
   of childhood obesity and even if we could, we cannot say with 100 percent certainty that it is due to only one variable."),
 
 p("Therefore, as we conclude our study, it's crucial to acknowledge the limitations of oversimplified interpretations and recognize
   the need for multifaceted approaches to addressing childhood obesity. Public health policies and interventions must take into account the
   intricate web of determinants that influence health outcomes. By understanding and addressing these factors, we can better serve the diverse
   needs of communities and work towards achieving equitable health outcomes for all children."),
 
 p("In essence, while our research may not provide clear-cut answers regarding the correlation between childhood obesity and household income,
   it shows the importance of considering all of the socioeconomic variables at play. Our research process has highlighted the necessity of holistic,
   inclusive approaches when tackling the challenges of childhood obesity.")
)

ui <- navbarPage("The relationship between US Children Obesity Level and National Household Income",
  theme = my_theme,
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab,
)