#載入座標
df_star <- read.csv("star_taipei_full.csv",header = FALSE)
df_rtmart<- read.csv("rtmart_taipei_full.csv",header = FALSE) 
df_cosmed<- read.csv("cosmed_taipei_full.csv",header = FALSE)
df_cafe85<- read.csv("cafe85_taipei_full.csv",header = FALSE) 
df_post<- read.csv("post_taipei_full.csv",header = FALSE) 
#載入租屋座標及點擊數量
df_rent<- read.csv("Address_taipei_full.csv",header = FALSE)

#座標間距離
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