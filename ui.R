library(shiny)
library(shinyjs)
library(shinycustomloader)
library(shinydashboard)
library(leaflet)

# I usually like to use non-white colors for boxes' background color
background_box_color = "light-blue"

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Dashboard Template"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Tab1", tabName = "tab1"),
        menuItem("Tab2", tabName = "tab2"),
        menuItem("Tab3", tabName = "tab3")
        # uncomment this line if you wanna debug with shinyjs
        # useShinyjs(),
        # runcodeUI(type = "textarea")
      )
    ),
    dashboardBody(
      tabItems(
        # Add elements such as boxes, fluidRows and columns after the tabName parameters
        tabItem(tabName = "tab1"),
        tabItem(tabName = "tab2"),
        tabItem(tabName = "tab3")
      )
    )
  )
)
