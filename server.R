library(shiny)
library(shinycustomloader)
library(tidyverse)
library(highcharter)
library(shinydashboard)

shinyServer(function(input, output){
  chosen_file <- reactive({
    input_csv <- input$csvInput
    
    if(!is.null(input_csv)){
      temp <- readr::read_csv(input$csvInput$name)
      updateSelectInput(inputId = "input_select_function",
                        label = "Choose Function for Stats:",
                        choices = colnames(temp),
                        selected = first(colnames(temp)))
      return(temp)
    }else{
      return(NULL)
    }
  })
  
  output$ui_input_select_function <- renderUI({
    column(width = 2,
           style = "float: right;margin-top: -73px;z-index: 2000;position: relative;scale: 0.75;margin-right: -45px;",
           selectInput(inputId = "input_select_function",
                       label = "Choose Function for Stats:",
                       choices = NULL,
                       selected = NULL
                       )
           )
  })
  
  output$ui_input_file_csv <- renderUI({
    column(width = 2,
           style = "float: right;margin-top: -75px;z-index: 2000;position: relative;scale: 0.75;height: 86px;margin-right: -65px;",
           fileInput("csvInput",
                     label = "Choose a CSV:",
                     buttonLabel = "Browse",
                     accept = ".csv",
                     placeholder = "No file"
                     )
           )
  })
  
  output$vbAVG <- renderValueBox({
    input_function <- input$input_select_function
    csv <- chosen_file()
    
    if(is.null(input_function) | input_function == "") {
      valueBox(value = "0s", subtitle = "Average Time")
    }else{
      specified_column <- csv[[input_function]]
      valueBox(value = paste0(round(mean(specified_column), 3), "s"), 
               subtitle = "Average Time")
    }
  })
  
  output$vbSTD <- renderValueBox({
    input_function <- input$input_select_function
    csv <- chosen_file()
    
    if(is.null(input_function) | input_function == "") {
      valueBox(value = "0s", subtitle = "Maximum Time")
    }else{
      specified_column <- csv[[input_function]]
      valueBox(value = paste0(round(max(specified_column), 3), "s"), 
               subtitle = "Maximum Time")
    }
  })
  
  output$vbMAX <- renderValueBox({
    input_function <- input$input_select_function
    csv <- chosen_file()
    
    if(is.null(input_function) | input_function == "") {
      valueBox(value = "0s", subtitle = "Minimum Time")
    }else{
      specified_column <- csv[[input_function]]
      valueBox(value = paste0(round(min(specified_column), 3), "s"), 
               subtitle = "Minimum Time")
    }
  })
  
  output$vbMIN <- renderValueBox({
    input_function <- input$input_select_function
    csv <- chosen_file()
    
    if(is.null(input_function) | input_function == "") {
      valueBox(value = "0s", subtitle = "Standard Time Deviation")
    }else{
      specified_column <- csv[[input_function]]
      valueBox(value = paste0(round(sd(specified_column), 3), "s"), 
               subtitle = "Standard Time Deviation")
    }
  })
  
  output$linePlotTimings <- renderHighchart({
    NULL
  })
  
  output$stackedColumnsPlotShares <- renderHighchart({
    NULL
  })
  
})