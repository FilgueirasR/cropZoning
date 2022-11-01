#' Load the data for the region of interest (ROI)
#'
#' @description This function will load the air temperature data (Rasterstack) for the region of interest (ROI). The images loaded by this function are intended to be used, as example, for calculating the climatic zoning of crops. To calculate the climatic zoning of the crops, you first have to calculate the mean air temperature (function tmean) and the monthly air temperature (function tmean_monthly). 
#' @param variable Stack of minimum (tmin) or maximum (tmax) air temperature (Rasterstack).
#' @param region Use the "brazil" shapefile to extract the Rasterstack (variable) for one state (Brazilian state), or use the "biomes_brazil" to extract the Rasterstack (variable) for one biome of Brazil.
#' @param sub_region You have two options in this section, if you choice the brazil (in region parameter) you need to choice the Brazilian states, but if you choice the biomes_brazil (in region parameter) you must choice one of Brazilian biomes.
#' @import raster
#' @import rgdal
#' @examples
#' \dontrun{
#' 
#' ### Loading minimum air temperature and maximum air temperature based on Brazil states.
#' see_brazil_states()
#' 
#' image_tmin <-loadROI(variable = "tmin", 
#'                    region = "brazil", 
#'                    sub_region = 13) # sub_regions 1:27
#'                     
#' image_tmax <-loadROI(variable = "tmax",
#'                    region = "brazil", 
#'                    sub_region = 13)
#'
#' ### Loading minimum air temperature and maximum air temperature based on Brazil biomes.
#' see_brazil_biomes()
#' 
#' image_tmin <- loadROI(variable = tmin, 
#'                     region = "biomes_brazil",
#'                     sub_region = 5)# sub regions: 1:6 (biomes)
#'                     
#' image_tmax <-loadROI(variable = "tmax",
#'                    region = "biomes_brazil", 
#'                    sub_region = 5)
#' 
#' }
#' @return Load the tmin image example (minimum air temperature) or tmax image example (maximum air temperature) rasterstack
#' @references
#' The images used in this package can be found in the paper: Abatzoglou, J.T., S.Z. Dobrowski, S.A. Parks, K.C. Hegewisch, 2018, Terraclimate, a high-resolution global dataset of monthly climate and climatic water balance from 1958-2015, Scientific Data.
#' @export


loadROI<-function(variable, region, sub_region){
  shp<-readOGR(system.file('extdata', paste0(region, ".shp"), package= 'cropZoning'))
  area<-shp[sub_region,]
  img<-stack(system.file('extdata', paste0(variable, ".tif"), package= 'cropZoning'))
  img_area<-crop(img, area)
  img_area<-mask(img_area, area)
}


