#' Calibration of maximum air temperature from TerraClimate
#'
#' @description This fuction will calibrate the maximum air temperature from TerraClimate dataset based in the relationship with observed weather stations data.
#' @param tmax_stack stack of maximum air temperature
#' @param slope the slope of the linear regression (numeric)
#' @param intercept the intercept of the linear regression (numeric)
#' @import raster
#' @examples
#' \dontrun{
#' tmax_cal<- tmax_calibrated(slope = 0.874787, intercept = 4.612894 , tmax_stack = tmax);
#' }
#' @return Returns a Rasterstack of mean air temperature.
#' @export
#'
tmax_calibration<-function( slope, intercept, tmax_stack){
  tmax_calibrated<-slope*tmax_stack + intercept
  return(tmax_calibrated)}

#' Calibration of minimum air temperature from TerraClimate
#'
#' @description This fuction will calibrate the minimum air temperature from TerraClimate dataset based in the relationship with observed weather stations data.
#' @param tmin_stack stack of maximum air temperature
#' @param slope the slope of the linear regression (numeric)
#' @param intercept the intercept of the linear regression (numeric)
#' @import raster
#' @examples
#' \dontrun{
#' tmin_cal<- tmin_calibrated(slope = 0.830652, intercept = 4.187840, tmin_stack = tmin);
#' }
#' @return Returns a Rasterstack of mean air temperature.
#' @export
#'
tmin_calibration<-function(slope, intercept, tmin_stack){
  tmin_calibrated<-slope*tmin_stack + intercept
  return(tmin_calibrated)}






