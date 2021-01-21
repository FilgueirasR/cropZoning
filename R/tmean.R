#' Mean air temperature calculation
#' \if{html}{\figure{logo_cropZoning.png}{options: height= 300 width=auto style = float:right alt= Our logo}}
#' @description This fuction will calculate the mean air temperature from  minimum and maximum air temperature data.
#' @param tmax_stack stack of maximum air temperature
#' @param tmin_stack stack of minimum air temperature
#' @import raster
#' @examples
#' \dontrun{
#' 
#' image_tmean <- tmean(tmax_stack = image_tmax, tmin_stack = image_tmin)
#' }
#' @return Returns a Rasterstack object of mean air temperature.
#' @export

tmean<-function(tmax_stack, tmin_stack){
  t<-(tmax_stack + tmin_stack)/2
  return(t)}

