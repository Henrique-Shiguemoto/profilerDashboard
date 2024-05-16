library(shiny)
library(shinycustomloader)
library(shinydashboard)
library(highcharter)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Profiler Dashboard"),
    dashboardSidebar(disable = TRUE),
    dashboardBody(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "elem_style.css")
      ),
      uiOutput("ui_input_select_function"),
      uiOutput("ui_input_file_csv"),
      fluidRow(style = "margin-top: 10px;",
               column(width = 3, style = "text-align: center;", valueBoxOutput("vbAVG", width = NULL)),
               column(width = 3, style = "text-align: center;", valueBoxOutput("vbSTD", width = NULL)),
               column(width = 3, style = "text-align: center;", valueBoxOutput("vbMAX", width = NULL)),
               column(width = 3, style = "text-align: center;", valueBoxOutput("vbMIN", width = NULL))),
      fluidRow(column(width = 12,
                      tabBox(title = "Timing Comparisons", 
                             width = NULL,
                             side = "right",
                             tabPanel(title = "Timings", highchartOutput("linePlotTimings")),
                             tabPanel(title = "Shares", highchartOutput("stackedColumnsPlotShares"))
                             )
                      )
               )
    )
  )
)