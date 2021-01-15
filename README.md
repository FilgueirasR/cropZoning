# cropZoning

<div class="fluid-row" id="header">
    <img src='https://lh6.googleusercontent.com/MSPFLsASqJ0gltD6-KvcFXkhJm7S7zZZZ6qdHD7s8xjy1ccuBv4IdEt_T8OlQ0wdwvTck2vJKjcLyrennnzDM9voD09uit7ZPiN3XE9qKmznn3ReC3IL=w1280' height='150' width='auto' align='right'>


<!-- badges: start -->
<!-- badges: end -->

The goal of cropZoning is to make climate zoning of different crops (air temperature based) for any region of Brazil. For this,
cropZoning uses minimum and maximum air temperature from Terraclimate dataset (http://www.climatologylab.org/terraclimate.html)
calibrated with the automatic weather stations of National Meteorological Institute of Brazil (INMET).


## Installation

To install the last version of cropZoning package follow this steps:

``` r
devtools::install_github("FilgueirasR/cropZoning")

```

## Example

This is a basic example which shows you how to run the cropZoning package:

``` r
## basic example code

#devtools::install_github("FilgueirasR/cropZoning")
library(cropZoning)
library(raster)


see_brazil_states()

image_tmin<-loadROI(variable = "tmin", region = "brazil", sub_region = 19) # sub_region = Rio Grande do Norte
image_tmax<-loadROI(variable = "tmax", region = "brazil", sub_region = 19) # sub_region = Rio Grande do Norte

start_date<-c('2000-01-01')
end_date<-c('2017-12-01')

image_tmean<- tmean(tmax_stack = image_tmax , tmin_stack = image_tmin)

monthly_tmean <- cropZoning::tmean_monthly_stack(tmean_stack = image_tmean, start_date = start_date, end_date = end_date)
plot(monthly_tmean)

cz<-ccrop_zoning(monthly_tmean, temp1= 10, temp2= 20, temp3 = 30, temp4 = 40)
plot(cz)

plot_ccrop_zoning(cz)



```

