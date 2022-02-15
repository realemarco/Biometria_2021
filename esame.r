# 1) ok
# 2) impot datasets and count the variables
# richiamo le librerie
install.packages("vegan")
library(vegan)

# scarico i dataset
mite_env <- read.table("data/mite_env.txt", header = TRUE) # per lettura e importazione tabelle, header per i nomi colonne
mite_csv <- read.csv("data/mite.csv") #per importare il dataframe


# struttura dataset
mite_env
mite_csv

# quante specie? 
ncol(mite_csv) # le specie sono in colonna, sommo il numero colonne
#[1] 35

# quante osservazioni? 70-71
nrow(mite_csv) # le osservazioni sono le righe
# [1] 70

# quante variabili ambientali? 5
ncol(mite_env) # sono le colonne
# [1] 5



#3
?mite # per info sul dataset

# variabili in datasets e documentazione corrispondono?
str(mite_env)
#'data.frame':	70 obs. of  5 variables:
#  $ SubsDens : num  39.2 55 46.1 48.2 23.6 ...
#$ WatrCont : num  350 435 372 360 204 ...
#$ Substrate: chr  "Sphagn1" "Litter" "Interface" "Sphagn1" ...
#$ Shrub    : chr  "Few" "Few" "Few" "Few" ...
#$ Topo     : chr  "Hummock" "" "Hummock" "Hummock" ...


# A. mite_env
# 1. SubsDens
class(mite_env$SubsDens) # [1] "numeric"


# 2. WatrCont
class(mite_env$WatrCont) # è un numeric


# 3. Substrate
class(mite_env$Substrate) # è un character
# devo convertirlo in factor
mite_env$Substrate <- factor(mite_env$Substrate, levels = c("Sphagn1", "Sphagn2", "Sphagn3", "Sphagn4", "Litter", "Barepeat", "Interface"))
is.factor(mite_env$Substrate)
# [1] TRUE

# 4. Shrub
class(mite_env$Shrub) # è un character
mite_env$Shrub <- factor(mite_env$Shrub, ordered = T, levels = c("None", "Few", "Many"))
is.factor(mite_env$Shrub)
#[1] TRUE

mite_env$Shrub # il fattore è adeguatamente ordinato

# 5. Topo
class(mite_env$Topo) # character
mite_env$Topo <- factor(mite_env$Topo, levels = c("Blanket", "Hummock"))
is.factor(mite_env$Topo)
# [1] TRUE

# verifico la nuova struttura
str(mite_env)
#'data.frame':	70 obs. of  5 variables:
#  $ SubsDens : num  39.2 55 46.1 48.2 23.6 ...
#$ WatrCont : num  350 435 372 360 204 ...
#$ Substrate: Factor w/ 7 levels "Sphagn1","Sphagn2",..: 1 5 7 1 1 1 1 7 5 1 ...
#$ Shrub    : Ord.factor w/ 3 levels "None"<"Few"<"Many": 2 2 2 2 2 2 NA 3 3 3 ...
#$ Topo     : Factor w/ 2 levels "Blanket","Hummock": 2 NA 2 2 2 2 2 1 1 2 ...

# la struttura è corretta

# 4) summary statistics and NAs in  mite_env
summary(mite_env)
#SubsDens        WatrCont         Substrate   Shrub         Topo   
#Min.   :21.17   Min.   :134.1   Sphagn1  :25   None:18   Blanket:44  
#1st Qu.:30.01   1st Qu.:314.1   Sphagn2  :11   Few :25   Hummock:25  
#Median :36.38   Median :398.5   Sphagn3  : 1   Many:25   NA's   : 1  
# Mean   :39.28   Mean   :410.6   Sphagn4  : 2   NA's: 2               
#3rd Qu.:46.81   3rd Qu.:492.8   Litter   : 2                         
#Max.   :80.59   Max.   :827.0   Barepeat : 2                         
#Interface:27        


is.na(mite_env)
# dove sono gli NA?
# riga 2, 7, 52

# rimuovo le righe corrispondenti
mite_env2 <- mite_env[c(-2, -7, -52), ]
mite_env2
is.na(mite_env2) # FALSE

# 5) graphical expressio of mite_env2

# quantitativi
# hist
# SubsDens
hist(mite_env2$SubsDens,
     xlab = "Substrate density (g/L)", 
     main = NULL, # per modificare il titolo, in questo caso per rimuoverlo
     breaks = 8,
     col = "light green") 

# Water content
hist(mite_env2$WatrCont,
     xlab = "Water content (g/L)", 
     main = "Water content of the substrate",
     breaks = 10,
     col = "light blue")



# qualitativi
# barplots
# Substrate
subscount <- table(mite_env2$Substrate) # x calcolare le frequenze del livello
barplot(subscount,
        main = "Frequency of different substrate levels",
        xlab = "Substrate",
        ylab = "Frequencies",
        col = "orange")
# Shrub
shrubcount <- table(mite_env2$Shrub)
barplot(shrubcount,
        main = "Degree of vegetation cover",
        xlab = "Shrub",
        ylab = "Frequencies",
        col = "dark green")

# Topo

topocount <- table(mite_env2$Topo)
barplot(topocount,
        main = "Microtopography",
        xlab = "Microtopography",
        ylab = "Frequencies",
        col = "brown")

# export dei + belli
png("outputs/WatrCont.png", width = 2800, height = 1800, res = 300)
hist(mite_env2$WatrCont,
     xlab = "Water content (g/L)", 
     main = "Water content of the substrate",
     breaks = 10,
     col = "light blue")
dev.off()


png("outputs/Substrate.png", width = 2800, height = 1800, res = 300)
subscount <- table(mite_env2$Substrate) # x calcolare le frequenze del livello
barplot(subscount,
        main = "Frequency of different substrate levels",
        xlab = "Substrate",
        ylab = "Frequencies",
        col = "orange")
dev.off()


png("outputs/shrub.png", width = 1800, height = 1800, res = 300)
shrubcount <- table(mite_env2$Shrub)
barplot(shrubcount,
        main = "Degree of vegetation cover",
        xlab = "Shrub",
        ylab = "Frequencies",
        col = "dark green")
dev.off()

# 6) Is your community matrix presence/absence? If not, convert it to presence/absence.
# funzione decostand del pacchetto vegan
mite_pa <- decostand(mite_csv, method = "pa")
mite_pa


# 7a) Calculate species richness for each observation of your community matrix. 

# prima modifico il dataset mite_csv così da avere lo stesso n di righe di mite_env2
mite_csv2 <- mite_csv[c(-2, -7, -52), ]

# calcolo la sr
sr <- specnumber(mite_csv2) # funzione specnumber
sr

# Then, add it to the environmental variables dataframe as a new column.
mite_env3 <- cbind(mite_env2, sr)
mite_env3

# 7b) Which are the maximum, minimum and average species richness in the dataset?
# devo lavorare su mite_env3
max(mite_env3$sr) #[1] 25
min(mite_env3$sr) # [1] 5
mean(mite_env3$sr) # così dà la media [1] 15.02985


 # 7c) How does species richness distribute in respect with topo variable? Explore it with a boxplot.
boxplot(sr ~ Topo,
        data = mite_env3,
        xlab = "Microtopography",
        ylab = "Species richness",
        main = "Distribution of sr in respect with topo variable")

# esporto il grafico
png("outputs/boxplotsrtopo.png", width = 1800, height = 1800, res = 300)
boxplot(sr ~ Topo,
        data = mite_env3,
        xlab = "Microtopography",
        ylab = "Species richness",
        main = "Distribution of sr in respect with topo variable")
dev.off()

# 8) Plot the distribution of species richness in respect with the available numeric environmental variables. 
# creo dei grafici a dispersione o scatterplot x 2 variabili continue

# SubsDens
plot(sr ~ SubsDens,
     data = mite_env3,
     cex = 1.5,
     xlab = "Substrate density (g/l)",# importante l'unità di misura
     ylab = "Species richness",
     main = "Distribution of sr in respect with SubsDens variable",
     col = "red")
# export
png("outputs/scatterplotSub.png", width = 4000, height = 1800, res = 300)
plot(sr ~ SubsDens,
     data = mite_env3,
     cex = 1.5,
     xlab = "Substrate density (g/l)",# importante l'unità di misura
     ylab = "Species richness",
     main = "Distribution of sr in respect with SubsDens variable",
     col = "red")
dev.off()

# WatrCont
plot(sr ~ WatrCont,
     data = mite_env3,
     cex = 1.5, # per le dimensioni
     xlab = "Water content (g/l)",# importante l'unità di misura
     ylab = "Species richness",
     main = "Distribution of sr in respect with WatrCont variable",
     col = "blue")

# export
png("outputs/scatterplotWatr.png", width = 4000, height = 1800, res = 300)
plot(sr ~ WatrCont,
     data = mite_env3,
     cex = 1.5, # per le dimensioni
     xlab = "Water content (g/l)",# importante l'unità di misura
     ylab = "Species richness",
     main = "Distribution of sr in respect with WatrCont variable",
     col = "blue")
dev.off()

# test di correlazione x capire se c'è correlazione + o -
# The null hypothesis is that there is no correlation between the variables
# Rigetto H0 quando il p value è molto piccolo e quindi significativo, c'è una correlazione
# P-value --> soglia a 0,05
# p-value sotto 0,05 = è sifgnificativo, posso rifiutare l'ipotesi nulla
# SubsDens
cor.test(mite_env3$sr,
         mite_env3$SubsDens)# p-value = 0.5487
# p-value is not significant there is no correlation
# accetto l'ipotesi nulla, non c'è correlazione

cor.test(mite_env3$sr,
         mite_env3$WatrCont) # p-value = 3.06e-11 --> 0.0000000000306 
# p-value is significant, there is correlation
# rifiuto l'ipotesi nulla

# is correlation positive or negative?

# correlazione positiva
cor.test(mite_env3$sr,
         mite_env3$WatrCont,
         alternative = "greater")
# il p value è 1, no correlazione positiva


# correlazione negativa
cor.test(mite_env3$sr,
         mite_env3$WatrCont,
         alternative = "less") # p-value = 1.53e-11

# è significativo, la correlazione è negativa



# For each numeric environmental variable 
#significantly correlated with species richness, 
#run a regression model and inspect its summary.

# modello di regressione lineare

mod <- lm(sr ~ WatrCont, data = mite_env3)
mod

# summary
summary(mod)

# interpretazione risultati 

