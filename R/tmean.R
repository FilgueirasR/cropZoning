#' Mean air temperature calculation
#'
#' @description This fuction will calculate the mean air temperature from  minimum and maximum air temperature data.
#' @param tmax_stack stack of maximum air temperature
#' @param tmin_stack stack of minimum air temperature
#' @import raster
#' @examples
#' \dontrun{
#' tmean <- tmean(tmax_stack = tmax, tmin_stack = tmin)
#' }
#' @return Returns a Rasterstack of mean air temperature.
#' @export

tmean<-function(tmax_stack, tmin_stack){
  t<-(tmax_stack + tmin_stack)/2
  return(t)}

