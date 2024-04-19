library(shiny)
library(shinyjs)
library(shinycustomloader)
library(shinydashboard)
library(highcharter)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Dashboard Template"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Tab1", tabName = "tab1")
        # uncomment this line if you wanna debug with shinyjs
        # useShinyjs(),
        # runcodeUI(type = "textarea")
      )
    ),
    dashboardBody(
      tabItems(
        # Add elements such as boxes, fluidRows and columns after the tabName parameters
        tabItem(tabName = "tab1")
      )
    )
  )
)
