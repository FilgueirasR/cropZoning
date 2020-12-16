#' Load the data for the region of interest (ROI)
#'
#' @description This fuction will load the air temperature data for the region of interest (ROI).
#' @param variable Stack of minimum (tmin) or maximum (tmax) air temperature (Rasterstack).
#' @param region Use the "brazil" shp file to extract the rasterstack (variable) for one state (Brazilian state), or use the "biomes_brazil" to extract the Rasterstack (variable) for one biome of Brazil.
#' @param sub_region You have two options in this section, if you choice the brazil (in region parameter) you need to choice the Brazilian states, but if you choice the biomes-brasil (in region parameter) you must choice one of Brazilian biomes.
#' @import raster
#' @import rgdal
#' @examples
#' \dontrun{
#' #For Brazilian states
#'
#' see_brazil_states()
#' image_tmin<-loadROI(variable = "tmin", region = "brazil", sub_region = 13) # sub_regions 1:27
#' image_tmax<-loadROI(variable = "tmax", region = "brazil", sub_region = 13)
#'
#' #For Brazilian Biomes:
#'
#' see_brazil_biomes()
#' tmin_state<- loadROI(variable = tmin, region = "biomes_brazil", sub_region = 2)# sub regions: 1:6 (biomes)
#'
#' }
#' @return Load the tmin (minimum air temperature) or tmax (maximum air temperature) rasterstack
#' @export


loadROI<-function(variable, region, sub_region){
  shp<-readOGR(system.file('extdata', paste0(region, ".shp"), package= 'cropZoning'))
  area<-shp[sub_region,]
  img<-stack(system.file('extdata', paste0(variable, ".tif"), package= 'cropZoning'))
  img_area<-crop(img, area)
  img_area<-mask(img_area, area)
}


