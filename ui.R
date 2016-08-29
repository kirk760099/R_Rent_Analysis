
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(navbarPage(
  "店面出租地點",
  tabPanel("各類商店群聚",
           numericInput(inputId = "n",
                        "Sample size", value = 25),
           plotOutput(outputId = "hist")  
                    ),
  tabPanel("店面K-Means分析"),
  tabPanel("清單分析"),
  tabPanel("關於","台大系統資訊班課程作品: 使用R語言進行資料分析",br(),
           a("https://www.csie.ntu.edu.tw/train/?page=course_info.html&courseid=1505",href="https://www.csie.ntu.edu.tw/train/?page=course_info.html&courseid=1505",target="_blank"),
           h3("資料來源:"),
           "1. 好房網租屋行情",br(),
           a("http://tradeinfo.sinyi.com.tw",href="http://tradeinfo.sinyi.com.tw",target="_blank"),br(),
           "2. 台北捷運站點座標:",br(),
           a("https://github.com/repeat/taipei-metro-stations",href="https://github.com/repeat/taipei-metro-stations",target="_blank")
           ) #tabPanel:關於
  ))

