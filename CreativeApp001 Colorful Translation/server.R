################################
##Copyright 2017 R. D. Wooten	##
################################

library(shiny)
library(plot3D)
library(plotrix)

# Define server logic required to draw a diagram
shinyServer(function(input, output) {


output$translateText <- renderPlot(width=980,{
#initialize strings
KEY <- "ABCDEFGHIJKLMNOPQRSTUVWXYZ., "
STRING <- "Wisdom is to live in the present, plan for the future and profit from the past"
STRING <- input$quoteText
#measuring strings
n = nchar(STRING)
n
k = nchar(KEY)
k
#set color gradation
letter <- rep(" ",times=k)
for(i in 1:k)	{
letter[i] = substring(KEY,i,i)
			}
#set color scheme
mult = input$spread
if(input$colorScheme==1)	{	color <- rainbow(mult*k)	}
if(input$colorScheme==2)	{	color <- heat.colors(mult*k)	}
if(input$colorScheme==3)	{	color <- terrain.colors(mult*k)	}
if(input$colorScheme==4)	{	color <- topo.colors(mult*k)	}
if(input$colorScheme==5)	{	color <- cm.colors(mult*k)	}
if(input$colorScheme==6)	{	color <- c(rainbow(mult*6),heat.colors(mult*6),
							terrain.colors(mult*6),topo.colors(mult*6),
							cm.colors(mult*5))	}
color <- color[mult*seq(1:k)]
color[k] = "white"

#color block function
color.block <- function(x,y,char)	{
return(color[letter==toupper(char)])		}

#plot canvas
plot(0,0,col="white",axes=FALSE,ann=FALSE,xlim=c(0,100),ylim=c(0,60))
entry = 1

#plot text
m = 0
j = 1
entry = 1
for(i in 1:n)	{
text(5*(j-1)+10+2.5,50-m-2.5,substring(STRING,i,i))
entry = entry + 1
m = ifelse(16*round(entry/16,0)==entry,m+5,m)
j = ifelse(16*round(entry/16,0)==entry,1,j+1)
			}

#run color block
m=0
j=1
entry = 1

for(i in 1:n)	{
char = substring(STRING,i,i)
polygon(x = c( 5*(j-1)+10, 5*(j-1)+10, 5*j+10, 5*j+10,5*(j-1)+10 ),
	y = c( 50-m, 45-m, 45-m, 50-m ,50-m ),
	col=color.block( 5*(j-1)+10, 50-m, char ) )
entry = entry + 1
m = ifelse(16*round(entry/16,0)==entry,m+5,m)
j = ifelse(16*round(entry/16,0)==entry,1,j+1)
			}

#KEY
m = m + 10
q = m
q
j=1
entry = 1

for(i in 1:k)	{
char = substring(KEY,i,i)
polygon(x = c( 5*(j-1)+10, 5*(j-1)+10, 5*j+10, 5*j+10,5*(j-1)+10 ),
	y = c( 50-m, 45-m, 45-m, 50-m ,50-m ),
	col=color.block( 5*(j-1)+10, 50-m, char ) )
entry = entry + 1
m = ifelse(16*round(entry/16,0)==entry,m+5,m)
j = ifelse(16*round(entry/16,0)==entry,1,j+1)
			}
#plot text
m = q
j = 1
entry = 1
for(i in 1:k)	{
text(5*(j-1)+10+2.5,50-m-2.5,substring(KEY,i,i))
entry = entry + 1
m = ifelse(16*round((entry+1)/16,0)==entry,m+5,m)
j = ifelse(16*round((entry+1)/16,0)==entry,1,j+1)
			}
})

})
