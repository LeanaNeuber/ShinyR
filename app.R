# Load data and libraries -------------------------------------------
library(shiny)
library(shinydashboard)
library(tidyverse)
library(rgdal)

source("ui.R")
source("server.R")

# Create shiny application ------------------------------------------
shinyApp(ui = ui, server = server)
