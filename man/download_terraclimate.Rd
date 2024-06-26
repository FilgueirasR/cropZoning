% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_terraclimate.R
\name{download_terraclimate}
\alias{download_terraclimate}
\title{Download of maximum and minimum air temperature from 'TerraClimate'}
\usage{
download_terraclimate(dir_out, variable, years, region, sub_region)
}
\arguments{
\item{dir_out}{Directory where you want to save the raster images that you are goind to download. Each variable should be locate in one folder.}

\item{variable}{Variable to download. The variables can be the minimum (tmin) or maximum (tmax) air temperature of 'TerraClimate' (Rasterstack).}

\item{years}{The period in years that the function should download.}

\item{region}{Use the "brazil" shapefile to extract the Rasterstack (variable) for one state (Brazilian state), or use the "biomes_brazil" to extract the Rasterstack (variable) for one biome of Brazil.}

\item{sub_region}{You have two options in this section, if you choice the brazil (in region parameter) you need to choice the Brazilian states, but if you choice the biomes_brazil (in region parameter) you must choice one of Brazilian biomes. Another option is to select "all" to download images for the entire territory of Brazil.}
}
\value{
Returns a Rasterstack of tmin (minimum air temperature) or tmax (maximum air temperature).
}
\description{
This function will download the tmax and tmin images and will load a rasterstack according to the the region of interest (Region and sub_region). The images downloaded by this function are intended to be used for calculating the climatic zoning of crops. To calculate the climatic zoning of the crops, you first have to calculate the mean air temperature (function tmean) and the monthly air temperature (function tmean_monthly).
}
\examples{
\dontrun{

### Downloading the minimum air temperature and maximum air temperature based on Brazil states.
see_brazil_states()

img <- download_terraclimate(
  dir_out = "C:/teste/tmin/state", variable = "tmin",
  years = c(2018:2019),
  region = "brazil",
  sub_region = 13
)

### Downloading the minimum air temperature and maximum air temperature based on Brazil states.
see_brazil_biomes()

img <- download_terraclimate(
  dir_out = "C:/teste/tmin/biome", variable = "tmin",
  years = c(2018:2019),
  region = "biomes_brazil",
  sub_region = 6
)
}
}
\references{
The images used in this package can be found in the paper: Abatzoglou, J.T., S.Z. Dobrowski, S.A. Parks, K.C. Hegewisch, 2018, Terraclimate, a high-resolution global dataset of monthly climate and climatic water balance from 1958-2015, Scientific Data.
}
