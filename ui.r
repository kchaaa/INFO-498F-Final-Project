library(shiny)
library(dplyr)
source('C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/scripts/help_find.r')
source('C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/scripts/plot.r')
source('C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/scripts/test_results.r')
source("C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/scripts/wrangling.r")
names <- colnames(safe_num[2:4])
level_name <- colnames(total[2:4])
#--------------------------------------------------------------#


shinyUI(
  navbarPage("Flint Water Crisis",
  
  theme = "bootstrap.css",
             
  tabPanel("Home",
    img(src = "http://assets.rollingstone.com/assets/2016/article/who-poisoned-flint-michigan-20160122/225359/large_rect/1453440373/1401x788-flint-opener.jpg", width = "800", height = "500"),
    h3("What is the Flint Water Crisis?"),
    p("The Flint Water Crisis is about how the residents of Flint have been suffering from lead-infected water."),
    h3("How Did This Happen?"),
    p("In April 2013, the Flint city council voted to join the Karegnondi Water Authority (KWA) that promised that they would get water from Lake Huron. This deal will save the city $19 million over eight years instead of continuing to pay Detroit for water. In response to Flint's decision, Detroit announced that they would stop providing Flint water in April 2014 even though the KWA won't be ready for another 3 years. Despite previous concerns about the conditions of the river, the emergency manager in Flint decided that they should use the Flint River as a backup water source. After using it, residents begin to notice and complain about the poor tasting and smelly water. The city found fecal coliform bacteria and recommended residents boil their water and buy bottled water. Not long after, lead was found in the water."),
    h3("Effects of Lead Consumption"),
    p("The lead-infected water has serious health effects on the residents of Flint especially the children and pregnant women of Flint. There are medications that would reduce the amount of lead in their blood to reduce the negative effects of lead; however, no medication exist to treat for the adverse health effects."),
    h4(strong("Children")),
    tags$ul(
      tags$li("Behavior and learning problems"),
      tags$li("Lower IQ and hyperactivity"),
      tags$li("Slowed growth"),
      tags$li("Hearing problems Anemia")
    ),
    h4(strong("Pregnant Women")),
    tags$ul(
      tags$li("Reduced growth of the fetus"),
      tags$li("Premature Birth")
    ),
    h4(strong("Adults")),
    tags$ul(
      tags$li("Cardiovascular effects, increased blood pressure and incidence of hypertension"),
      tags$li("Decreased kidney function"),
      tags$li("Reproductive problems (in both men and women)")
    ),
    img(src = "http://a.abcnews.go.com/images/Health/GTY_Water_Flint_Michigan_ER_160113_4x3_992.jpg", width = "600", height = "400"),
    h3("How Did the Government Respond?"),
    p("On January 16, 2016, President Obama signed an emergency declaration ordering federal assistance to support state and local response efforts in Flint, Michigan. The U.S. Department of Health and Human Services (HHS) has been designated the lead federal agency responsible for coordinating federal government response and recovery efforts."),
    p("The government of Michigan and Flint worked to try to fix the water source; however, the state government refused to allow Flint to switch their water supply back to Detroit. Due to the government's effort, the city finally was able to improve the quality fo their water."),
    p("Their celebration would be short because scientists soon found lead in the water due to old pipes and poor infrastructure."),
    p("The State government promised to use $1 million to buy water filters for the city of Flint and finally allowed Flint to use Detroit water again. The government recommended they boil water as a way to clean their water, but boiling water results in higher lead concentration because a heavy metal like lead doesn't evaporate like water does.")
  ),
  tabPanel("By Ward",
    sidebarLayout(
      sidebarPanel(
        selectInput("choice", label = h3("Test Type"), choices = names, selected = "First_Ward_Num")
      ),
        mainPanel(
          h3("How is the Test Conducted?"),
          p("A few months ago, a test was done in Flint. Three tests were conducted using the residents' toilets: "),
          tags$ol(
            tags$li("the first draw,"),
            tags$li("45 seconds after flushing,  "),
            tags$li("2 minutes after flushing. ")
          ),
          plotlyOutput("bar"),
          h3("What is a Ward?"),
          p("A ward is a district or section of a city. As we can see in the grpahic above, there are a total of 9 wards in Flint, MI. "),
          h3("What is ppb?"),
          p("Ppb stands for Parts Per Billion. It is the unit used to measure how much lead is in the water."),
          h3("What Do the Results of the Tests Mean?"),
          p(strong("0 ppb: "),"No lead detected in the drinking water"),
          p(strong("1-4 ppb: "),"The EPA deems this range as acceptable"),
          p(strong("5-14 ppb: "),"Exposure is a concern, but still below an EPA federal action level"),
          p(strong("15-49 ppb: "),"A range above the federal action level for lead, but can be treated by filters"),
          p(strong("50-149 ppb: "),"Reaching dangerous levels, but can be treated by filters"),
          p(strong("150+ ppb: "),"A range at which the federal government says water filters might not work")
        )
    )
  ),
  tabPanel("By Time",
    sidebarLayout(
      sidebarPanel(
        selectInput("name", label = h3("Test Type"), choices = level_name, selected = "Safe_houses")
      ),
      mainPanel(
        h3("How is the Test Conducted?"),
        p("The Flint government would sample the water of many households very frequently. The latest tests were conducted on March 6 showing that this data is constantly updated."),
        plotlyOutput("barstack"), 
        plotlyOutput("bar2"),
        h3("What is ppb?"),
        p("Ppb stands for Parts Per Billion. It is the unit used to measure how much lead is in the water."),
        h3("What Do the Results of the Tests Mean?"),
        p("There has been a recent increase in the number of houses with contaminated water."),
        p("Only recently did the government start to test more households due to the sudden spike in January. As the problem becomes more mainstream and nationally covered, the more the government focuses on fixing the problem.")
      )
    ) 
  ),
  tabPanel("Help",
    mainPanel(
      h3("What We Gathered"),
      h4("Wards"),
      p("Wards 5, 7, and 8 have the most problems with contaminated water. Although it may look like the water gets better as time passes after the inital pass, it actually reveals something dangerous. This means that the residents of Flint will have to wait a while for their water to filter out the Lead which can cause trouble for those who need it immediately and those who have to pay extra money in terms of water bills."),
      h4("Time"),
      p("The lead concentration in the water is getting worse over time. Might be too large of an impact on the area which is affecting thousands of people. They need to work on fixing the pipes and infrastructure soon to prevent further contamination."),
      h3("What's Being Done About the Situation?"),
      p("Filter Locations are set up throughout the city in areas like Fire Stations. However, we must note that there are only a few locations at the moment. Based on the map, only certain areas have filter locations which forces those who need filtered water to travel far in order to obtain some. The state and local government should work together to create more filter stations and focus on fixing the contaminated water as soon as possible."),
      plotOutput("plot1"),
      p(""),
      p("More information on what you can do and on the crisis:"),
      tags$a("http://michiganradio.org/post/how-you-can-help-people-flint-during-water-crisis#stream/0")
    )
  )
  )
)

