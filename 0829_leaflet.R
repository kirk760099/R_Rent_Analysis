library(leaflet)
m <- leaflet()
m <- addTiles(m)
df_star <- read.csv("starbucks_taipei.csv",header = FALSE)
names(df_star) <-c("text","lat","lng")
head(df_star)

for (x in c(1:nrow(df_star))){
m <- addMarkers(m, lng=df_star[x,3], lat=df_star[x,2], popup=df_star[x,3])
}
clearBounds(m)
m

#算距離的函式
earthDist <- function (lon1, lat1, lon2, lat2){
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- lon1 * rad
  b1 <- lat2 * rad
  b2 <- lon2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}
#25.0482792,121.52980920000005
m <- addMarkers(m, lng=121.52980, lat=25.04827, popup="新生北路一段X號
")
m <- addCircles(m, lng = 121.52980, lat = 25.04827, radius = 10, layerId = NULL, group = NULL, 
           stroke = TRUE, color = "green", weight = 5, opacity = 0.5, fill = TRUE, 
           fillColor = "red", fillOpacity = 0.2)
m <- addMarkers(m, lng=121.5628545, lat=25.058581, popup="民生東路五段158號")
m
earthDist(121.5298,25.048272,121.5628,25.0585)
earthDist(121.5628, 25.0585, 121.5482, 25.0520)
#台北市松山區民生東路五段158號,25.058581,121.5628545
#台北市松山區南京東路三段337號1樓,25.052006,121.548289

#library(argosfilter)
#distance(121.5628,121.5482,25.0585,25.0520)
