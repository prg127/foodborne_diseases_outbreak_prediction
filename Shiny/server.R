#install.packages("shiny")
library(shiny)
data <- read.csv("outbreaks.csv")#main data
data1 <- read.csv("Required.csv")#data used for prediction
data2 <- read.csv("Output1.csv")#numeric data
data3 <- read.csv("Data1.csv")#removing noise from status
shinyServer(
  function(input, output) {
    
    install.packages('ggplot2')
    library('ggplot2')
    
    output$myplot <- renderPlot({
      if(input$plot == "Number of cases per Year")
      {
        qplot(data=data, x=Year , xlab = 'Month' ,ylab = 'cases' , main = "Number of cases per Year")
      }
      
      else if(input$plot == "Number of cases per Month")
      {
        qplot(data=data, x=Month , xlab = 'Month' ,ylab = 'cases' , main = "Number of cases per Month" , color = Month) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Number of cases per state")
      {
        qplot(data=data, x=State , xlab = 'state' ,ylab = 'cases', fill = State) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Number of illnesses per year")
      {
        qplot(data=data, x=Year, y=Illnesses , main = "Number of illnesses per year" , color = Year)
      }
      
      else if(input$plot == "Number of illnesses per Month")
      {
        qplot(data=data, x=Month, y=Illnesses , main = "Number of illnesses per Month" , color = Month) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Number of illnesses per State")
      {
        qplot(data=data, x=State, y=Illnesses, color = State) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Number of Hospitalizations per year")
      {
        qplot(data=data, x=Year, y=Hospitalizations , main = "Number of Hospitalizations per year" , color = Year)
      }
      
      else if(input$plot == "Number of Hospitalizations per Month")
      {
        qplot(data=data, x=Month, y=Hospitalizations,color = Month) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Number of Hospitalizations per State")
      {
        qplot(data=data, x=State, y=Hospitalizations , main = "Number of Hospitalizations per state" , color = State) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))  
      }
      
      else if(input$plot == "Number of Fetalities per year")
      {
        qplot(data=data, x=Year, y=Fatalities , main = "Number of Fatalities per year" , color = Year)
      }
      
      else if(input$plot == "Number of Fetalities per Month")
      {
        qplot(data=data, x=Month, y=Fatalities, main = "Number of Fatalities per Month" , color = Month) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Number of Fetalities per State")
      {
        qplot(data=data, x=State, y=Fatalities , main = "Number of Fatalities per state" , color = State ) +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Hospitalizations vs illnesses")
      {
        qplot(data=data , x = Hospitalizations , y = Illnesses , colour = I("Blue") , alpha=I(0.5),main='Hospitalization vs illnesses')
      }
      
      else if(input$plot == "illnesses vs Fatalities")
      {
        qplot(data=data , x = Illnesses , y = Fatalities , colour = I("blue") , alpha = I(0.5) , main = 'Illnesses vs Fatalities')
      }
      
      else if(input$plot == "Hospitlaizations vs Fetalities")
      {
        qplot(data=data , x = Hospitalizations , y = Fatalities , colour = I("blue") , alpha = I(0.5) , main = 'Hospitalizations vs Fatalities')
      }
      
      else if(input$plot == "Year vs Hospitalizations with corresponding State")
      {
        qplot(data=data , x=Year,y=Hospitalizations,colour=State,size=I(2),main ='Year vs Hospitalizations with corresponding state')
      }
      
      else if(input$plot == "Year vs Fetalities with Corresponding state")
      {
        qplot(data=data , x=Year,y=Fatalities,colour=State,size=I(2),main = 'Year vs Fatalities with corresponding state')
      }
      
      else if(input$plot == "Year vs Status")
      {
        qplot(data=data , x=Year,y=Illnesses,colour=State,size=I(2),main = 'year vs Illnesses with corresponding state')
      }
      
      else if(input$plot == "Month vs Status")
      {
        ggplot(data=data,aes(x=Month,y=Status))+
          geom_point() +
          ggtitle("Month vs Status")+
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "state vs status")
      {
        ggplot(data=data,aes(x=State,y=Status))+
          geom_point() +
          ggtitle("State vs Status")+
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
      
      else if(input$plot == "Year vs status Monthwise")
      {
        ggplot(data=data,aes(x=Year,y=Status,color=Month))+
          geom_point() +
          ggtitle("Year vs Status Monthwise")
      }
      
      else if(input$plot == "state vs staus Monthwise")
      {
        ggplot(data=data,aes(x=State,y=Status,color=Month))+
          geom_point() +
          ggtitle("State vs Status Monthwise")+
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
        
      }
      
      else if(input$plot == "state vs status yearwise")
      {
        ggplot(data=data,aes(x=State,y=Status,color=Year))+
          geom_point() +
          ggtitle("State vs Status Yearwise")+
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
         
      }
      
      else if(input$plot == "illnesses vs status")
      {
        ggplot(data=data,aes(x=Illnesses,y=Status))+
          geom_point() +
          ggtitle("Illnesess vs Status")
      }
      
      else if(input$plot == "Hospitalizations vs status")
      {
        ggplot(data=data,aes(x=Hospitalizations,y=Status))+
          geom_point() +
          ggtitle("Hospitalizations vs Status")
        
      }
      
      else if(input$plot == "Fetalitites vs Status")
      {
        ggplot(data=data,aes(x=Fatalities,y=Status))+
          geom_point() +
          ggtitle("Fatalities vs Status")
        
      }
      
    })
    
    
    
    output$predict <- renderPrint({

      F_in <- input$Food
      food <- unlist(strsplit(F_in, "/"))
      m <- length(food)
      

      for(i in 1:19119)
      {
        Act_Food <- unlist(strsplit(toString(data1$Food[i]), "/"))
        n <- length(Act_Food)
        #print(n)
        if(n != 0){
          for(j in 1:n){
            for(k in 1:m){
              if(Act_Food[j] == food[k]){
                if(data1$Status[i] == "1") {
                  Result <- cat("Your Illness will be Confirmed if you eat",food[k],"along with ")
                  for(j in 1:n){
                    if(Act_Food[j] != food[k]){
                      Result <- cat(Act_Food[j])
                    }
                  }
                  o <- length(Result)
                  for(l in 1:o-4){
                    Output = cat(Result[l])
                  }
                  Output <- cat("\n")
                  paste(Output)
                } else {
                  Result <- cat("Your Illness will be Suspected if you eat",food[k],"along with ")
                  for(j in 1:n){
                    if(Act_Food[j] != food[k]){
                      Result <- cat(Act_Food[j])
                    }
                  }
                  o <- length(Result)
                  for(l in 1:o-4){
                    Output = cat(Result[l])
                  }
                  Output <- cat("\n")
                  paste(Output)
                }
              }
              break
            }
          }
        }
      }
    })
    
    
    
    output$dataname <- renderText({
      paste("Structure of the dataset", input$dataset)
      
    })
    
    output$observation <- renderText({
      paste("First", input$obs, "observations of the dataset", input$dataset)
      
    })
    
    output$view1 <- renderText({
      paste("summary of dataset", input$dataset)
      
    })
    
    
    output$structure <- renderPrint({
      if(input$obs <= 19119)
      {
      if(input$dataset == "outbreaks")
      {
      str(data)
      }
      else if(input$dataset == "Required")
      {
        str(data1)
      }
      else if(input$dataset == "numericdata")
      {
        str(data2)
      }
      else
      {
        str(data3)
      }
      }
      else
      {
        paste("Maximum number of observations are 19119")
      }
    })
    
    output$view <- renderTable({
      if(input$obs <= 19119)
         {
      if(input$dataset == "outbreaks")
      {
      head(data, n = input$obs)
      }
      else if(input$dataset == "Required")
      {
        head(data1, n = input$obs)
      }
      else if(input$dataset == "numericdata")
      {
        head(data2, n = input$obs)
      }
      else
      {
        head(data3, n= input$obs)
      }
      }
      else
      {
        paste("Maximum number of observations are 19119")
      }
    })
    
    
    output$summary <- renderTable({
      if(input$obs <= 19119)
      {
      if(input$dataset == "outbreaks")
      {
        summary(data)
      }
      else if(input$dataset == "Required")
      {
        summary(data1)
      }
      else if(input$dataset == "numericdata")
      {
        summary(data2)
      }
      else
      {
       summary(data3)
      }
      }
      else{
        paste("Maximum number of Observations are 19119")
      }
    })
  }
)

