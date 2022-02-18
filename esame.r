
#necessario installare il pacchetto "vegan"


# install.packages("vegan")
library(vegan)
#
# setwd("C:/esamestat") #sembra non servire #rivedere percorso setwd in ogni caso
#

?mite #così vedo info sul dataset 

###################
#Oribatid mite data. 70 soil cores collected by Daniel Borcard in 1989. 
#See Borcard et al. (1992, 1994) for details.

#There are three linked data sets: 
# mite that contains the data on 35 species of Oribatid mites, 
# mite.env that contains environmental data in the same sampling sites, 
# mite.xy that contains geographic coordinates, and mite.pcnm that contains 22 PCNM base functions (columns) computed from the geographic coordinates of the 70 sampling sites (Borcard & Legendre 2002). 

#The whole sampling area was 2.5 m x 10 m in size.

#ELEMENTI DATASET:
# SubsDens-> Substrate density (g/L)
# WatrCont -> Water content of the substrate (g/L)
# Substrate -> Substrate type, factor with levels Sphagn1, Sphagn2 Sphagn3 Sphagn Litter Barepeat Interface
# Shrub -> Shrub density, an ordered factor with levels 1 < 2 < 3
# Topo -> Microtopography, a factor with levels Blanket and Hummock
###################

#2...........................................

mite_env <- read.table("esamestat/data/mite_env.txt", header = TRUE)
#header=TRUE perchè altrimenti i nomi delle variabili vengono considerati come elementi del dataset

mite_env


mite_csv <- read.csv("esamestat/data/mite.csv")
mite_csv

#..................................

#   Quante specie?

#in mite_csv le specie sono rappresentate in colonna, riferite alla presenza per sito
#quindi dal numero di colonne mi ricavo il numero di specie
ncol(mite_csv)
# [1] 35


#   Quante osservazioni (carotaggi effettuati)?

#considero le righe, che rappresentano i carotaggi effettuati per sito
nrow(mite_csv)
#[1] 70


# Quante variabili ambientali?

#da considerare è il numero di colonne di mite_env
ncol(mite_env)

#[1] 5



#Controlliamo che il dataset sia organizzato come nelle info originali

#Subdens
class(mite_env$SubsDens)
# [1] "numeric"

#WatrCont
class(mite_env$WatrCont)
# [1] "numeric"

#Substrate
class(mite_env$Substrate)
# [1] "character" -------> vogliamo sia "factor"

#conversione mite_env$Substrate in factor:
mite_env$Substrate <- factor(mite_env$Substrate, levels = c("Sphagn1", "Sphagn2", "Sphagn3", "Sphagn4", "Litter", "Barepeat", "Interface"))

class(mite_env$Substrate)
# [1] "factor"

#Shrub
class(mite_env$Shrub)
# [1] "character" -------> vogliamo sia "factor" 

#conversione mite_env$Shrub in factor 
mite_env$Shrub <- factor(mite_env$Shrub, ordered = T, levels = c("None","Few", "Many"))

class(mite_env$Shrub)                       
# [1] "ordered" "factor"                          

#Topo
class(mite_env$Topo)

#conversione mite_env$Topo in "factor"
mite_env$Topo <- factor(mite_env$Topo, levels = c("Blanket", "Hummock"))   

class(mite_env$Topo)
# [1] "factor"


#ora verifichiamo la struttura:
str(mite_env)

# dataset corretto:        
mite_env



#Calcolo summary e rimozione NAs
summary(mite_env)

#Righe con NAs:
is.na(mite_env)
#righe con NAs -> 2, 45, 50

#creare nuovo mite_env senza NAs
mite_enw <-mite_env[c(-2, -45, -50),] 
mite_enw


#5....................

#Creazione grafici

library(graphics)

#variabili qualitative 

#Substrate
subfreq <- table(mite_enw$Substrate)

barplot(subfreq,
        main = "Frequency of substrate levels",
        xlab = "Kind of substrate",
        ylab = "Frequency",
        col = "dark red")

#Shrub
shrbfreq <- table(mite_enw$Shrub)

barplot(shrbfreq,
        main = "Frequency of shrub density",
        xlab = "Shrub cover density",
        ylab = "Frequency",
        col = "dark green")
                         
#Topo
topofreq <- table(mite_enw$Topo)

barplot(topofreq,
        main = "Frequencies of microtopographies",
        xlab = "Microtopography",
        ylab = "Frequency",
        col = "blue")

#variabili quantitative

#Subdens
hist(mite_enw$SubsDens,
     xlab = "Substrate density (g/L)", 
     main = "Substrate density histogram",
     breaks = 5,
     col ="magenta")


#WatrCont
hist(mite_enw$WatrCont,
     xlab = "Water contenent in substrate (g/L)", 
     main = "Substrate water content histogram",
     breaks = 8,
     col = "light blue")

#Esportazione grafici 

#export Shrub_barplot
png("esamestat/outputs/Shrub_barplot.png", width = 2800, height = 1800, res = 300)

shrbfreq <- table(mite_enw$Shrub)

barplot(shrbfreq,
        main = "Frequency of shrub density",
        xlab = "Shrub cover density",
        ylab = "Frequency",
        col = "dark green")
dev.off()

#export Subdens_hist
png("esamestat/outputs/Subdens_hist.png", width = 2800, height = 1800, res = 300)

hist(mite_enw$SubsDens,
     xlab = "Substrate density (g/L)", 
     main = "Substrate density histogram",
     breaks = 5,
     col ="magenta")
dev.off()


#6...........................

#presence/absence

mite.pa <- decostand(mite_csv, method = "pa")
mite.pa

#decostand mi permette di convertire i dati in presenza/assenza
#tramote argomento method= "pa"



#7a..........................

#species richness

#eliminiamo righe che sono NA in Environmental variables

mite_csw <- mite_csv[c(-2, -45, -50), ]
mite_csw


#calcolo species richness 
specr <- specnumber(mite_csw)
specr


#aggiunta colonna specr
mite_enw1 <- cbind(mite_enw, specr)
mite_enw1


#7b..........................

#calcolare massimo minimo e media di specr

max(mite_enw1$specr)
# [1] 25

min(mite_enw1$specr)
# [1] 5

mean(mite_enw1$specr)
# [1] 15.02985


#7c...........................


boxplot(specr ~ Topo,
        data = mite_enw1,
        xlab = "Microtopography",
        ylab = "Species richness",
        main = "Distribution of Species Richness/Microtopography",
        col = "dark green")



# notiamo che in hummock è generalmente presente una maggiore species richness
# blanket ha una maggiore variabilità (valori estremi più distanti)
# blacket ha anche un outliar (valore anomalo)
# la mediana di hummock è maggiore di blanket 
# il 50% delle osservazioni di hummock è meno disperso rispetto a blanket

png("esamestat/outputs/boxplotspecr_topo.png", width = 1800, height = 1800, res = 300)

boxplot(specr ~ Topo,
        data = mite_enw1,
        xlab = "Microtopography",
        ylab = "Species richness",
        main = "Distribution of Species Richness/Microtopography",
        col = "dark green")
dev.off()

#8............................

#SubDens/SpecRich

plot(specr ~ SubsDens,
     data = mite_enw1,
     cex = 2,
     xlab = "Substrate density (g/l)",
     ylab = "Species richness",
     main = "Distribution of Species Richness/SubsDens",
     col = "purple")




#esporto il grafico

png("esamestat/outputs/scatterplot_SR-SD.png", width = 4000, height = 1800, res = 300)

plot(specr ~ SubsDens,
     data = mite_enw1,
     cex = 2,
     xlab = "Substrate Density (g/l)",
     ylab = "Species Richness",
     main = "Distribution of Species Richness/SubsDens",
     col = "purple")

dev.off()


#WatrCont/SpecRich

plot(specr ~ WatrCont,
     data = mite_enw1,
     cex = 2, 
     xlab = "Water Content (g/l)",
     ylab = "Species Richness",
     main = "Distribution Species Richness/Water Content",
     col = "dark blue")

#esporto il grafico

png("esamestat/outputs/scatterplot_SR-WC.png", width = 4000, height = 1800, res = 300)

plot(specr ~ WatrCont,
     data = mite_enw1,
     cex = 2, 
     xlab = "Water Content (g/l)",
     ylab = "Species Richness",
     main = "Distribution Species Richness/Water Content",
     col = "dark blue")

dev.off()


#Test per vedere se c'è correlazione tra le variabili numeriche e la Species Richness

#La mia ipotesi nulla (H0) è che non c'è correlazione tra le variabili
#Rigetto H0 quando il p value è significativo (valore piccolo) e c'è quindi correlazione
#soglia p value -> 0.05

#test per specr e Subdens
cor.test(mite_enw1$specr, mite_enw1$SubsDens)

# risultato p-value = 0.5028 -> H0 accettata (non c'è correlazione tra le due variabili)


#test per specr e Watrcont
cor.test(mite_enw1$specr, mite_enw1$WatrCont)

# risultato p-value = 0,000000007381 -> H0 rigettata (c'è correlazione tra le due variabili)



# Correlazione positiva o negativa?
  
  # test correlazione positiva
  cor.test(mite_enw1$specr,
           mite_enw1$WatrCont,
           alternative = "greater")

# p-value = 1 (no correlazione positiva)


# test correlazione negativa
cor.test(mite_enw1$specr,
         mite_enw1$WatrCont,
         alternative = "less")

# p-value = 0.000000000003691 -> significativo (correlazione è negativa)



# morello di regressione linearew tra WarrCont e specr e ispezione summary


regmod <- lm(specr ~ WatrCont, data = mite_enw1)
regmod

# summary
summary(regmod)

#output:

#Call:
#  lm(formula = specr ~ WatrCont, data = mite_enw1)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-7.9759 -2.1018  0.2023  2.3099  6.8810 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 24.38292    1.18937  20.501  < 2e-16 ***
#  WatrCont    -0.02292    0.00275  -8.336 7.38e-12 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 3.231 on 65 degrees of freedom
#Multiple R-squared:  0.5167,	Adjusted R-squared:  0.5093 
#F-statistic: 69.49 on 1 and 65 DF,  p-value: 7.381e-12

# interpretazione risultati #
