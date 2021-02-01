# Load libraries, data ------------------------------------------------
library(shinydashboard)
library(tidyverse)
library(rgdal)
library(sf)
library(mapproj)
library(broom)
library(raster)
library(ggthemes)
library(sjmisc)
library(tidygeocoder)

germany <- readOGR(dsn = "~/Desktop/Uni_DUE/SHINY/ShinyR/data/shape_files/Landkreise.shp", layer = "Landkreise")

names(germany)[names(germany) == 'GEN'] <- 'lk'

print(germany)
server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$map1 <- renderPlot({
    
    landkreise <- tidy(germany, lk ="lk")
    #print(landkreise)
    landkreise$id <- factor(as.numeric(landkreise$id)+1)
    landkreise$lk <- landkreise$id
    levels(landkreise$lk) <- germany$lk
    

    #dif = unique(setdiff(landkreise$lk, germany$lk))
    
    lk_covid_merge <- merge(landkreise,germany)
    #write.csv(lk_covid_merge,"lk_covid_merge.csv")
    #print(colnames(lk_covid_merge))
    ggplot(lk_covid_merge, aes(x = long, y = lat, group = group, fill = cases7_per)) +
      geom_polygon() + theme_map() +
    coord_map()
  })
}
