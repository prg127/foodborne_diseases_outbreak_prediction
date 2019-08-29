library(ggplot2)

ggplot(data=dataset,aes(x=Year,y=Status))

#add geometry
#figure 21
ggplot(data=dataset,aes(x=Year,y=Status))+
  geom_point() +
  ggtitle("Year vs Status")

#figure 22
ggplot(data=dataset,aes(x=Month,y=Status))+
  geom_point() +
  ggtitle("Month vs Status")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#figure 23
ggplot(data=dataset,aes(x=State,y=Status))+
  geom_point() +
  ggtitle("State vs Status")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))




#add color
#according to month
#figure 24
ggplot(data=dataset,aes(x=Year,y=Status,color=Month))+
  geom_point() +
  ggtitle("Year vs Status Monthwise")


#figure 25
ggplot(data=dataset,aes(x=State,y=Status,color=Month))+
  geom_point() +
  ggtitle("State vs Status Monthwise")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#figure 26
ggplot(data=dataset,aes(x=State,y=Status,color=Year))+
  geom_point() +
  ggtitle("State vs Status Yearwise")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#figure 27
ggplot(data=dataset,aes(x=Illnesses,y=Status))+
  geom_point() +
  ggtitle("Illnesess vs Status")


#figure 28
ggplot(data=dataset,aes(x=Hospitalizations,y=Status))+
  geom_point() +
  ggtitle("Hospitalizations vs Status")


#figure 29
ggplot(data=dataset,aes(x=Fatalities,y=Status))+
  geom_point() +
  ggtitle("Fatalities vs Status")

# 
# #according to state
# ggplot(data=dataset,aes(x=Year,y=Status,color=State))+
#   geom_point()
# 
# #add size - better way
# ggplot(data=dataset,aes(x=Year,y=Status,color=Month,size=Year))+
#   geom_point()
# 
# ggplot(data=dataset,aes(x=Illnesses,y=Status,color=Month,size=Year))+
#   geom_point()
# 
# 
# 
# ggplot(data=dataset,aes(x=Hospitalizations,y=Status,color=Month,size=Year))+
#   geom_point()
# 
# 
# 
# ggplot(data=dataset,aes(x=Fatalities,y=Status,color=Month,size=Year))+
#   geom_point()
# 
# 
# #adding layer to the ggplot
# 
# p<-ggplot(data=dataset,aes(x=Year,y=Illnesses,color=Month))
# 
# p + geom_line()
# 
# 
# q<-ggplot(data=dataset,aes(x=Year,y=Hospitalizations,color=Month))
# 
# q + geom_line(size = 1)#here we can change the size of line and any other geometry
# 
# 
# #mapping versus setting 
# #if we change in geom_point in aes and all color then this procedure called mapping
# #but if we add color argument in geom_line function then this called setting 
# 
# q + geom_line(color = "DarkGreen")
# 
# 
# #histogram or density chart
# 
# 
# s <- ggplot(data=dataset,aes(x=Illnesses,y=Status)) 
# 
# s + geom_density()
# 


#statistical transformation

dataset1 <- read.csv("finalcleandata.csv")


a <- ggplot(dataset1,aes(x = food , y =Illnesses)) 
 a +  geom_point() 
 a + geom_smooth()
 
 
 b <- ggplot(dataset1,aes(x =location , y =Illnesses)) 
  b + geom_point()
  b + geom_smooth()
  
  
c <- ggplot(dataset1,aes(x=location,y=food))
c + geom_smooth()
  
  
d <- ggplot(dataset1,aes(x=location))
d + geom_histogram(binwidth = 10)

e <- ggplot(dataset1,aes(x=food))
e + geom_histogram(binwidth = 10)



# 
# g <- ggplot(dataset,aes(x=State))
# g + geom_histogram(binwidth = 10)
# g + facet_grid(Year~.)
# g + theme(axis.text.x = element_text(angle = 90, hjust = 1))



#we also adding limit on x and Y axis
# 
#  x + geom_point()
#  x + xlim(aa,aaa)
#  x + ylin(bb,bbb)


#we also adding some theme in the graph
# h + xlab()+
#   ylab()+
#   theme(axis.title.x = element_text(colour = "",size = ),
#         axis.title.y = element_text(colour = "",size = ),
#         axis.text.x = element_text(size=20),
#         axis.text.y = element_text(size = ))
# 


  

  
































