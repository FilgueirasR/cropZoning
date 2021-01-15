#' Monthly mean air temperature estimation to generate the climate crop zoning
#'
#'
#' @description This function will calculate the mean monthly air temperature based on the period of time selected (start_date and end_date).
#' @param tmean_stack Stack of mean air temperature based on minimum and maximum air temperature Rasterstack
#' @param start_date Date that start the investigation, should be in the following format (1958-01-01 /Year-Month-Day)
#' @param end_date Date that end the investigation, should be in the following format (2017-12-31 /Year-Month-Day)
#' @import raster
#' @examples
#' \dontrun{
#' 
#' start_date <- c('2000-01-01')
#' end_date <- c('2017-12-01')
#' 
#' tmean_monthly <- tmean_monthly_stack(tmean_stack = img_tmean,
#'                                     start_date = start_date,
#'                                     end_date = end_date)
#' }
#' @export
#' @return Returns a stack with a monthly mean air temperature from a period of time


tmean_monthly_stack<-function(tmean_stack, start_date, end_date){
  id_month <- seq(as.Date(start_date), as.Date(end_date), 'month')
  months <- as.numeric(format(id_month, "%m"))
  tmean_per_month <- stackApply(tmean_stack, indices =months, mean)
  names(tmean_per_month)<-c("January", "February", "March", "April", "May", "June",
                            "July", "August", "September", "October", "November", "December")

  return(tmean_per_month)
}
