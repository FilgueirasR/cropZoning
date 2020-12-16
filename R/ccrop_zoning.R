#' Climate crop zoning based on monthly air temperature data
#'
#' @description This function will calculate the climate crop zoning for the range of suitable air temperature informed.
#' @param temp_per_month stack
#' @param temp1 unsuitable due to low temperature (numeric)
#' @param temp2 minimum suitable temperature (numeric)
#' @param temp3 maximum suitable temperature (numeric)
#' @param temp4 unsuitable due to high temperature (numeric)
#' @import raster
#' @examples
#' \dontrun{
#'
#' tmean <- tmean(tmax_stack = tmax, tmin_stack = tmin)
#' start_date <- c('2000-01-01')
#' end_date <- c('2017-12-01')
#' tmean_monthly <- mean_monthly_stack(tmean_stack = tmean, start_date = start_date, end_date = end_date)
#' zoning <- ccrop_zoning(temp_per_month = tmean_monthly, temp1 = 10 , temp2 = 20, temp3 = 30, temp4 = 40)
#'
#' }
#' @return Returns a stack with a monthly climate crop zoning
#' @export

ccrop_zoning <- function(temp_per_month, temp1, temp2,  temp3, temp4){

reclass_temp_df<-c(temp2, temp3, 1,
                     temp1, temp2, 2,
                     temp3, temp4, 3,
                     -Inf, temp1, 4,
                     temp4, Inf, 5)


zoning.matrix<- reclassify(temp_per_month, reclass_temp_df, right=TRUE)
return(zoning.matrix)

}


