#' Function to see the Brazilian biomes available in cropZoning package and how we can use it in the loadROI function
#' \if{html}{\figure{logo_cropZoning.png}{options: height= 300 width=auto style = float:right alt= Our logo}}
#'
#' @description This fuction will show the biomes available in the package and how we can call each biome polygon.
#' @examples
#' \dontrun{
#' 
#' see_brazil_biomes()
#' }
#' @return Returns a character strings listing the biomes available to run the cropZoning package.
#' @export


see_brazil_biomes <- function(){
  a<- c("Caatinga = 1", "Cerrado = 2", "Pantanal = 3", "Pampa = 4", "Amazonia = 5", "Mata Atlantica = 6")
  print("Use the text format or the corresponding number:")
  return(a)
}
