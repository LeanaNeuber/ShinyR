# Load libraries, data -----------------------------------------------
library(shinydashboard)
library(tidyverse)
library(rgdal)
library(mapproj)

box1 <- box(plotOutput("plot1", height = 250))
box2 <- box(
  title = "Controls",
  sliderInput("slider", "Number of observations:", 1, 100, 50)
)
box3 <- box(plotOutput("map1", width = 500, height = 500))


ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box1,
      box2,
      box3
    )
  )
)