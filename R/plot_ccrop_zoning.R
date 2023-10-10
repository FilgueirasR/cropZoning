#' Function to plot the climate crop zoning stack  generated in ccrop_zoning
#'  
#' @description 
#' This function will plot the ccrop_zoning output. The result of the plotting
#' will generate a plot with the following classes.
#' 
#'   Climatic zoning classes:
#' \itemize{
#'   \item  ST: Suitable air temperature
#'   \item RLT: Restricted due to low temperature 
#'   \item RHT: Restricted due to high temperature 
#'   \item ULT: Unsuitable due to low temperature 
#'   \item UHT: Unsuitable due to high temperature 
#' }
#' 
#' @import ggplot2
#' @importFrom tidyr gather
#' @importFrom stats na.omit
#' @param zoning A stack generated in ccrop_zoning
#' @examples 
#' ### Data preparation
#' \dontrun{
#' ###ploting the cropzoning:
#' 
#' zoning_plot <- plot_ccrop_zoning(zoning)
#' }
#' @return Returns a plot (ggplot object) with the monthly climate crop zoning based in air temperature.
#' @export


plot_ccrop_zoning<-function(zoning){
  
xy<-terra::crds(zoning)

df <- as.data.frame(terra::as.points(zoning))
df<- cbind(xy, df)

for(i in 3:14){
  df[,i] <- factor(df[,i],levels=c(1,2,3, 4, 5),
                   labels=c("ST", "RLT", "RHT","ULT",
                            "UHT"))
}


df<-na.omit(tidyr::gather(df, "Months", "climatic zoning", 3:14))
Name.months<-c( "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December")
levels(df$Months)<-Name.months
df$Months<-ordered(df$Months, levels = levels(df$Months))

cbbPalette <- c("ST" = "#009E73", "RLT" = "#56B4E9",
                "RHT" = "#F0E442", "ULT" = "#000000",
                "UHT" = "#E69F00")# SAT = Suitable air temperature;

unique(df$Months)
ggplot2::ggplot(data=df, aes(y = df$y, x = df$x)) +
  geom_raster(aes(fill= df$`climatic zoning`))+
  coord_fixed(xlim = c(terra::ext(zoning)[1], terra::ext(zoning)[2]))+
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


