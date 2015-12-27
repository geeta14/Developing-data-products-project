library(rworldmap)
library(data.table)


data(countryExData)
#' Aggregate dataset by country
#' 
#' @param countryExData data.table

#' @param regions character vector
#' @return data.table
#'
aggregate_by_country <- function(countryExData, regions) {
  replace_na <- function(x) ifelse(is.na(x), 0, x)

  country <- data.table(Country=sort(unique(countryExData$Country)))
  
  aggregated <- countryExData %>% filter(EPI_regions %in% regions) %>%
    group_by(Country) %>%
    summarise_each(funs(sum), Population2005:CLIMATE
)
  aggregated<-as.data.table(aggregated)
  
  # join all country under selected region with their respective aggregates
  left_join(country,  aggregated, by = "Country")   %>% 
mutate_each(funs(replace_na), Population2005:CLIMATE)
}

  
  compute_affected <- function(dt, category) {
    dt %>% mutate(Affected = {
      if(category == 'Population2005') {
        Population2005
      
      } else {
        GDP_capita.MRYA
      }
    })
  }
  
  
  #' Add Damages column based on category
  #' 
  #' @param dt data.table
  #' @param category character
  #' @return data.table
  #'
  compute_factor <- function(dt, category) {
    dt %>% mutate(Factor = {
      if(category == 'AIR_E') {
        AIR_E
      } else if(category == 'WATER_E') {
        WATER_E
      } else {
        BIODIVERSITY
      }
    })
  }
  
   
  barplotCountryData()
  data("countryExData",envir=environment(),package="rworldmap")
  
  barfun<-function(dt, column){ barplotCountryData()
    data("countryExData",envir=environment(),package="rworldmap")
    barplotCountryData(dt
                       , nameColumnToPlot=column
                       , nameCountryColumn = "Country"
    )}
  
  
  barfun1<-function(dt, column){ barplotCountryData()
    data("countryExData",envir=environment(),package="rworldmap")
    barplotCountryData(dt
                       , nameColumnToPlot=column, 
                         nameCountryColumn = "Country"
    )}
  