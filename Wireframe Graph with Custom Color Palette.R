install.packages("gss")
library(gss)
library(lattice)
data(LakeAcidity)

#####################################################################
#
# Note: the models used here are from the examples in Chapter 4 of
# "Smoothing Spline Anova Models" by Chong Gu, 2013, Springer. Some of
# the code that generates the models may be pulled from there as well.
#
# The wireframe code is original though.
#
#####################################################################

#Color Palette Vector from "Color Palette Generator.xlsm" example
newcolors<-c("#0000FF","#0A0AFF","#1414FF","#1E1FFF","#2929FF","#3333FF","#3D3DFF","#4747FF",
	"#5152FF","#5B5CFF","#6666FF","#7070FF","#7A7AFF","#8485FF","#8E8FFF","#9899FF","#A3A3FF",
	"#ADADFF","#B7B8FF","#C1C2FF","#CBCCFF","#D5D6FF","#E0E0FF","#EAEBFF","#F4F5FF","#FEFFFF",
	"#FEF4F4","#FEEAEA","#FEDFDF","#FED4D4","#FECACA","#FEBFBF","#FEB5B5","#FEAAAA","#FE9F9F",
	"#FE9595","#FE8A8A","#FF7F7F","#FF7575","#FF6A6A","#FF6060","#FF5555","#FF4A4A","#FF4040",
	"#FF3535","#FF2A2A","#FF2020","#FF1515","#FF0B0B","#FF0A0A","#FF0000")

#Create the grid for the graph
grid0 <- seq(-.04,.04,len=31)
grid <- cbind(rep(grid0,31),rep(grid0,rep(31,31)))
I(grid)
new <- data.frame(cal=2.977,geog=I(grid))
new <- model.frame(~log(cal)+geog,new)

#Thin plate spline model on the LakeAcidity data (see Gu, ch. 4.3)
tps1<-ssanova(ph~log(cal)+geog,data=LakeAcidity, type="tp", method="m")
tps1fit<-predict(tps1,new,se=TRUE,inc=c("1","log(cal)","geog"))

#Set up grid and data
mdf=data.frame(z=tps1fit$fit,x=grid[,1],y=grid[,2])
c<-seq(min(mdf$z),max(mdf$z),(max(mdf$z)-min(mdf$z))/49)

#Plot wireframe graphic
wireframe(z~x*y,data=mdf,drape=TRUE,scales=list(arrows=FALSE),
	at=c,col.regions=newcolors, screen = list(z = 0, x = 0))
	#OR:
wireframe(z~x*y,data=mdf,drape=TRUE,scales=list(arrows=FALSE),
	at=c,col.regions=newcolors,screen = list(z = 225, x = 315))
