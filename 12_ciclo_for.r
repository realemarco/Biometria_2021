# 30/11/2021
# ciclo for come tecnica per l'iterazione, applicare funzioni o processi ad un numero di elementi noti
# utilizzato quando si sa il numero di iterazioni
# stampa digitale di un insieme di numeri da 1 a 10

# per chiamare il ciclo for, parola chiave for
# il ciclo si compone di 5 elementi
# 1. la parola chiave for
# 2. un nome di una variabile nelle parentesi (
# 3. la parola chiave in per indicare che la variabile riguarda il vettore
# 4. il vettore 

for (i in 1:10) { # dopo le tonde nelle graffe si definisce la procedura
print(i) # nel primo sarà print 1, secondo giro print 2, terzo print 3...
} 

# ciclo for per calcolare valori sul database dune
library(vegan)
data(dune)

# creeremo un oggetto che verrà modificato durante il ciclo manipolando il dataset
# vettore in cui verranno salvati valori calcolati sul dataframe
sr <- vector() # creo un vettore vuoto, sr = species richness

for (i in 1:nrow(dune)) { # come vettore metteremo le righe di dune, indicate da 1 fino a ultima riga di dune
sr[i] <- sum(dune[i, ] > 0) # 
} # ?????

sr # per visualizzarlo unghezza 20
# vettore di numeri interi con l
# [1]  5 10 10 13 14 11 13 12 13 12  9  9 10  7  8  8  7  9  9  8

# funzione per calcolare la sr
calculate_sr <- function(df) {
sr <- vector() # come argomento passeremo un dataframe
for (i in 1:nrow(dune)) {
sr[i] <- sum(df[i, ] > 0) # df in modo che come argomento gli passiamo un datafame che quì si chiamerà df e farà i passaggi fatti con dune prima
} # riprendiamo il ciclo e ivece di usare dune utilizziamo un segnaposto, alias, che sarà df che nel codice corrisponderà a dune
return(sr)
}
calculate_sr(df = dune)
# [1]  5 10 10 13 14 11 13 12 13 12  9  9 10  7  8  8  7  9  9  8 
# si crea sempre un ciclo 

# se voglio applicare la funzione ad un altro dataset
data(mite)
sr_mite <- calculate_sr(df = mite)
sr_mite
# [1] 20 23 19 23 19 21 16 21 16 19 25 19 18 23 18 17 14 18 21 20 ??? non è uguale




