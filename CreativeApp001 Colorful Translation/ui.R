################################
##Copyright 2015 R. D. Wooten	##
################################
library(shiny)
#runApp("D:\\R Code\\TRANSLATECOLOR")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Translate saying to color"),
	radioButtons("colorScheme", "Color Scheme", inline=TRUE,
		choices = list("Rainbow"=1, "Heat"=2,"Terrain"=3,
			"Topo"=4, "CM"=5,"Mixed"=6),selected=1),
	fluidRow(
		column(width=1,numericInput("spread","Spread", value = 5, min=1,max=100,step=1)),
		column(width=10,textInput("quoteText", "Saying", value="Wisdom is to live in the present, plan for the future and profit from the past", width='500px'))
	),
	mainPanel(
		plotOutput("translateText")
	)


))