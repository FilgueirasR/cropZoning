#' Calibration of maximum air temperature from TerraClimate
#' 
#' @description This function will calibrate the maximum air temperature from TerraClimate dataset based in the relationship with observed weather stations data.The values of slope and intercept informed in example correspond a calibration performed between 'Terraclimate' images and INMET automatic weather stations realized for all the brazilian territory.  
#' @param tmax_stack stack of maximum air temperature
#' @param slope the slope of the linear regression (numeric)
#' @param intercept the intercept of the linear regression (numeric)
#' @examples
#' \dontrun{
#' 
#' tmax_cal<- tmax_calibration(slope = 0.874787, intercept = 4.612894 , tmax_stack = tmax);
#' }
#' @return Returns a SpatRaster object of calibrated maximum air temperature.
#' @export
#'
tmax_calibration<-function( slope, intercept, tmax_stack){
  tmax_calibrated<-slope*tmax_stack + intercept
  return(tmax_calibrated)}

#' Calibration of minimum air temperature from TerraClimate
#'
#' @description This function will calibrate the minimum air temperature from TerraClimate dataset based in the relationship with observed weather stations data. The values of slope and intercept informed in example correspond a calibration performed between 'Terraclimate' images and INMET automatic weather stations realized for all the brazilian territory.
#' @param tmin_stack stack of maximum air temperature
#' @param slope the slope of the linear regression (numeric)
#' @param intercept the intercept of the linear regression (numeric)
#' @import terra
#' @examples
#' \dontrun{
#' tmin_cal<- tmin_calibrated(slope = 0.830652, intercept = 4.187840, tmin_stack = tmin);
#' }
#' @return Returns a SpatRaster of calibrated minimum air temperature.
#' @export
#'
tmin_calibration<-function(slope, intercept, tmin_stack){
  tmin_calibrated<-slope*tmin_stack + intercept
  return(tmin_calibrated)}






