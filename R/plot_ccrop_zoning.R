#' Function to plot the climate crop zoning stack  generated in ccrop_zoning
#'
#'
#' @param zoning_stack stack

#' @description This function will plot the ccrop_zoning.
#' @import ggplot2
#' @importFrom tidyr gather
#' @importFrom stats na.omit
#' @examples 
#' \dontrun{
#' plot_ccrop_zoning(zoning.matrix)
#' 
#' climatic zoning classes: 
#'                        - ST - suitable air temperature;
#'                        - RLT - Restricted due to low temperature;
#'                        - RHT - Restricted due to high temperature;
#'                        - ULT - Unsuitable due to low temperature;
#'                        - UHT - Unsuitable due to high temperature.
#' }
#' @return Returns a  plot (gg file) of monthly climate crop zoning
#' @export


plot_ccrop_zoning<-function(zoning_stack){
  df <- as.data.frame(rasterToPoints(zoning_stack))
  for(i in 3:14){
    df[,i] <- factor(df[,i],levels=c(1,2,3, 4, 5),
                     labels=c("ST", "RLT", "RHT","ULT",
                              "UHT"))
  }




  df<-na.omit(gather(df, "Months", "climatic zoning", 3:14))
  Name.months<-c( "January", "February", "March", "April", "May", "June",
                  "July", "August", "September", "October", "November", "December")
  df$Months<-factor(df$Months, labels= Name.months[1:12], ordered=TRUE)
  factor(df$Months)

  cbbPalette <- c("ST" = "#009E73", "RLT" = "#56B4E9",
                  "RHT" = "#F0E442", "ULT" = "#000000",
                  "UHT" = "#E69F00")# SAT = Suitable air temperature;

  ggplot(data=df, aes(y = df$y, x = df$x)) +
    geom_raster(aes(fill= df$`climatic zoning`))+
    coord_fixed(xlim = c(extent(zoning_stack)[1], extent(zoning_stack)[2]))+
    scale_fill_manual(values = cbbPalette) +
    theme(axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          legend.position = "right")+
    facet_wrap(~df$Months)+
    theme(strip.text.x = element_text(size = 12))+
    guides(color = guide_legend(override.aes = list(size=5)))+
    theme(legend.key.size = unit(1, "cm"),
          legend.text=element_text(size=12),
          legend.title = element_text(size = 14))+
    labs(fill = "Climatic zoning:")

}


