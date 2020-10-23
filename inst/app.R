



library(ggplot2)
library(tidyverse)
library(tibble)
library(dplyr)
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(plotly)
library(countrycode)

summary_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>% 
  filter(country%in% c("US","Brazil","India"))


df <-coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>% 
  mutate(case=sum(cases))%>% mutate(code = countrycode(country,origin = 'country.name', destination = 'iso3c'))


tb <- coronavirus %>%
  filter(country =="US") %>%
  pivot_wider(id_cols = date, names_from = type, values_from = cases) %>%
  arrange(desc(date))




ui <- fluidPage(
  
  titlePanel("World epidemic situation "),
  sidebarLayout(
    sidebarPanel(
      selectizeInput("countryInput", "Country",
                     choices = unique(summary_df$country),  
                     selected="US", multiple =FALSE),
      
      dateInput("dateinput","Enter the date",value = "2020-10-07", format = "yyyy-mm-dd")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("diseaseplot")), 
        tabPanel("Map", plotlyOutput("map")), 
        tabPanel("Table", dataTableOutput("table")),
        tabPanel("About",includeMarkdown("about.md"))))
        
        
      )
      
    ) 
  

server <- function(input, output) {
  p <- reactive({
    filtered <-
      summary_df %>%
      filter(country == input$countryInput)    
    
  })
  
  output$diseaseplot <- renderPlot({
    
    ggplot(p(),aes(x=date, y=cases,color=date)) +
      geom_line() + 
      theme_bw() +
      xlab("Date") +
      ylab("Number of cases") +
      ggtitle("Cases over time")
  })

  output$map <- renderPlotly({
    fig <- plot_ly(df, type='choropleth', locations=df$code, z=df$case, text=df$country, colorscale="Blues")  
    
  })
  
  output$table <- renderDataTable({
    tb %>% 
      filter(date == input$dateinput)
  
  })
}

shinyApp(ui,server) 
