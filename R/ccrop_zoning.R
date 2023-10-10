#' Climate crop zoning based on monthly air temperature data
#'
#' @description This function will calculate the climate crop zoning for the range of air temperature informed. The result will be a raster image with five possible values (values of 1 to 5) according to what is explained below.
#'   
#' \itemize{
#'   \item  Pixel values = 1, correspond to suitable air temperature (ST);
#'   \item  Pixel values = 2, correspond to restricted due to low temperature (RLT);
#'   \item  Pixel values = 3, correspond to restricted due to high temperature (RHT);
#'   \item  Pixel values = 4, correspond to unsuitable due to low temperature (ULT);
#'   \item  Pixel values = 5, correspond to unsuitable due to high temperature (UHT).
#'}
#'   The thermal suitability ranges established were as follows:
#'   
#'    \enumerate{
#'      \item ST - Temperature range (range of temp2 to temp3) considered optimal for the growth, development and production of the crop;
#'      \item RLT - Temperature range (range of temp2 to temp1) which the crop is able to develop, however, below its potential due to the air temperature values being slightly lower than those of the suitable range;
#'      \item RHT - Temperature range (range of temp3 to temp4) which the crop is able to develop, however, below its potential due to the temperature values being slightly higher than those of the suitable range;
#'      \item ULT - When temperature values are not suitable for commercial exploitation of the crop due to low air temperature (air temperature below the temp1);
#'      \item UHT - When temperature values are not suitable for commercial exploitation of the crop due to high air temperature (air temperature above the temp4);
#'}
#' @param temp_per_month Rasterstack object with a monthly mean air temperature from a period of time
#' @param temp1 unsuitable due to low temperature (numeric)
#' @param temp2 minimum suitable temperature (numeric)
#' @param temp3 maximum suitable temperature (numeric)
#' @param temp4 unsuitable due to high temperature (numeric)
#' @importFrom  terra classify
#' @examples
#' \dontrun{
#' ### Example with Brazil states
#' 
#' see_brazil_states()
#' 
#' image_tmin<-loadROI(variable = "tmin", 
#'                    region = "brazil", 
#'                    sub_region = 13) # sub_regions 1:27
#'                    
#' image_tmax<-loadROI(variable = "tmax",
#'                    region = "brazil", 
#'                    sub_region = 13)
#'                    
#' image_tmean <- tmean(tmax_stack = image_tmax, tmin_stack = image_tmin)
#' 
#' 
#' start_date <- c('2000-01-01')
#' end_date <- c('2017-12-01')
#' 
#' tmean_monthly <- tmean_monthly_stack(tmean_stack = img_tmean,
#'                                     start_date = start_date,
#'                                     end_date = end_date)
#'                                     
#'                     
#' zoning <- ccrop_zoning(temp_per_month = tmean_monthly,
#'                        temp1 = 10 , temp2 = 20, 
#'                        temp3 = 30, temp4 = 40)
#' }
#' @return Returns a SpatRaster object of climate crop zoning based in air temperature.
#' @export

ccrop_zoning <- function(temp_per_month, temp1, temp2,  temp3, temp4){

reclass_temp_df<-c(temp2, temp3, 1,
                     temp1, temp2, 2,
                     temp3, temp4, 3,
                     -Inf, temp1, 4,
                     temp4, Inf, 5)

reclass_temp_df<- matrix(reclass_temp_df, ncol=3, byrow=TRUE)

zoning.matrix<- terra::classify(temp_per_month, reclass_temp_df, right=TRUE)
return(zoning.matrix)

}


