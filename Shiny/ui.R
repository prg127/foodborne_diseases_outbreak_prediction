
library(shiny)
# Define UI for application
shinyUI(fluidPage(
  tags$head(
    tags$style(HTML("hr {border-top: 1px solid #000000;}"))
  ),
  # Header or Title Panel 
  titlePanel(title = h4("Foodborne Diseases Outbreak Prediction", align="center")),
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
      
       tags$style("body{background-color:lightblue;color:black}"),
      
      h4("Enter the details"),
      hr(),
      
      
      
      selectInput("dataset","choose the dataset:",choices = c("outbreaks","cleanstatus","numericdata","Required")),
      
      numericInput("obs","Number of Observations :", 6),
      
      submitButton("update"),
      
      
      hr(),
      
      selectInput("plot","choose the plot:",choices = c("Number of cases per Year",
                                                        "Number of cases per Month",
                                                        "Number of cases per state",
                                                        "Number of illnesses per year",
                                                        "Number of illnesses per Month",
                                                        "Number of illnesses per State",
                                                        "Number of Hospitalizations per year",
                                                        "Number of Hospitalizations per Month",
                                                        "Number of Hospitalizations per State",
                                                        "Number of Fetalities per year",
                                                        "Number of Fetalities per Month",
                                                        "Number of Fetalities per State",
                                                        "Hospitalizations vs illnesses",
                                                        "illnesses vs Fatalities",
                                                        "Hospitlaizations vs Fetalities",
                                                        "Year vs Hospitalizations with corresponding State",
                                                        "Year vs Fetalities with Corresponding state",
                                                        "Year vs Status",
                                                        "Month vs Status",
                                                        "state vs status",
                                                        "Year vs status Monthwise",
                                                        "state vs staus Monthwise",
                                                        "state vs status yearwise",
                                                        "illnesses vs status",
                                                        "Hospitalizations vs status",
                                                        "Fetalitites vs Status"
                                                        )),
      submitButton("plot"),
      hr(),
      
      textInput("Food","Enter Food"," "),
      submitButton("submit")
    ),
    
    # Main Panel
    mainPanel(
      tabsetPanel(type="tab", 
                  # tabPanel("Summary",verbatimTextOutput("sum")),
                  # tabPanel("Structure", verbatimTextOutput("str")),
                  # tabPanel("Data", tableOutput("data")),
                  tabPanel("Plot", plotOutput("myplot")),
                  tabPanel("prediction",textOutput("predict")),
                  tabPanel("dataset",textOutput("observations"),tableOutput("view")),
                  tabPanel("structure",textOutput("dataname"),verbatimTextOutput("structure")),
                  tabPanel("summary",textOutput("view1"),tableOutput("summary"))
                  
      )
      
    )
    
  )
)  
)
