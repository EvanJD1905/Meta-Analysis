library (readxl)
library(metafor)


Data <- read_excel("~/Desktop/Masters/Anthropogenic/MetaAnalysisData.xlsx")

model1<-lm(Effect_Size~1, data=Data)
summary(model1)


meta1<-rma.mv(yi=Effect_Size,V=(SE^2), data=Data, method="REML", random=~1|Species/Family/Study)
meta1 #-15.39

# Creating Graphs
quartz()
par(mfrow=c(1,2))
forest(meta1, slab= Data$ES, header='Effect Size', cex.lab=0.8, cex.axis = 0.8,
       shade='zebra', xlab = "Dawn chorus timing difference", lwd = 2,
       pch = 15, cex = 0.8, xlim = c(-300,300))
funnel(meta1, shade='orchid2', back= 'honeydew2',xlab = "Dawn chorus timing difference")
par(mfrow=c(1,1))

confint(meta1) #Checking heterogeneity
#Very high heterogeneity

regtest(meta1) #Checking Publication bias 
#No publication bias




meta2<-rma.mv(yi=Effect_Size,V=(SE^2), mods=~Tropic, data=Data, method="REML", random=~1|Species/Family/Study)
meta2 #-17.8, -10.9?

