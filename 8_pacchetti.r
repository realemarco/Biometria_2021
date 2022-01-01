# 16/11/2021
# installazione dei pacchetti -> 1 volta
# devi richiamarli x ogni sessione di R

# come installare un pacchetto
# funzione install.packages
install.packages("swirl")

# se voglio installarne + di 1
# install.packages( c(nomi dei vari pacchetti))

# come caricare il pacchetto
# funzione library
library(swirl) # pacchetto x apprendimento interattivo R
swirl() # per lanciare il pacchetto

# pacchetto 2
install.packages("vegan") # pacchetto per indagini ecologia di comunità
library(vegan)

# insieme ai pacchetti gli sviluppatori posson fornire delle vignette 
vignette(package = "vegan") # per capire se sono presenti nel pacchetto vegan e se si come si chiamano 

# se voglio vedere una vignette in particolare
vignette("intro-vegan") # aprirà il visualizzatore PDF



