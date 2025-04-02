#Creating the map that shows the distribution of studies in this meta-analysis

install.packages(c("terra", "sf", "ggplot2", "rnaturalearth", "rnaturalearthdata"))
library(terra)
library(sf)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library (readxl)

Data <- read_excel("~/Desktop/Masters/Anthropogenic/MetaAnalysisData.xlsx")


Data$Long <- as.numeric(Data$Long)
Data$Lat <- as.numeric(Data$Lat)

sites_vect <- vect(Data, geom = c("Long", "Lat"), crs = "EPSG:4326")

# Convert SpatVector to a data.frame (longitude and latitude as separate columns)
sites_df <- as.data.frame(sites_vect, xy = TRUE)

# Load world map data and convert to SpatVector
world_sf <- ne_countries(scale = "medium", returnclass = "sf")
world_vect <- vect(world_sf)  # Convert to terra SpatVector

# Create the plot
quartz()  # Opens a plotting window (use `x11()` on Linux)
plot(world_vect, col = "honeydew", border = "grey39", xlab = 'Longitude', ylab = "Latitude")
points(sites_vect, col = "orchid3", pch = 20, cex = 1.2)  # Add site locations in red








# Convert to terra SpatVector
sites_vect <- vect(Data, geom = c("longitude", "latitude"), crs = "EPSG:4326")
sites_df <- as.data.frame(sites_vect, xy = TRUE)

world_sf <- ne_countries(scale = "medium", returnclass = "sf")
world_vect <- vect(world_sf)  # convert to terra SpatVector

# Convert SpatVector to data.frame
quartz()
plot(world_vect, col = "wheat2", border = "grey40", xlab = 'Longitude', ylab="Latitude")
points(sites_vect, col = "red", pch = 20, cex = 1.2)