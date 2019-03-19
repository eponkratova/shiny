install.packages("radarchart")
library(radarchart)

df <- read.csv("directory.csv")


labs <- c("Real-time","Scalability","Maintenance","Publishing, sharing and collaborating","Degree of analysis",
          "Customizability","Cost","Visual appeal"
          )

scores <- list(
  "Open.source.data.visualization...batch" =df$Open.source.data.visualization...batch,
  "Economical.data.visualization...batch" = df$Economical.data.visualization...batch,
  "Open.source.reporting...batch." = df$Open.source.reporting...batch.,
  "Economical.data.visualization.with.high.interactivity...batch" =df$Economical.data.visualization.with.high.interactivity...batch,
  "Open.source.advanced.analytics...batch" = df$Open.source.advanced.analytics...batch,
  "Open.source.data.visualization...real.time" = df$Open.source.data.visualization...real.time
)



c <- grDevices::col2rgb(c("#790000","#B83200","#F96900","#F98632","#F9B17D","#FFD87A"))

chartJSRadar(scores = scores, labs = labs, maxScale = 3, scaleStepWidth = 1, addDots = F, 
             lineAlpha = 0, colMatrix = c
             , labelSize = 15, main = "Tools comparison")