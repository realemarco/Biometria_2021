# seconda parte lezione 09/11/2021
# speciale tipo di vettori utilizzati x le variabili categoriche
# variabile categorica = definisce numero finito di stati es. T espressa in bassa, media e alta
# vogliamo creare un vettore di piante con classificazione in forme di crescita es. alberi, erbe, forbie
# vogliamo che i valori diventino un factor, ovvero che rientrino solo all'interno delle 3 categorie
# il tipo di forma di crescita è una variabile qualitativa
#creo un vettore di tipo character
plants_vector <- c("Tree", "Grass", "Forb", "Grass", "Tree")
plants_vector # è un vettore di tipo numerico con 5 elementi

# funzione factor per trasformare il vettore in un fattore
plants_factor <- factor(plants_vector)
plants_factor # 5 elementi NON virgolettati ma solo 3 LIVELLI (FORB, GRASS, TREE)
# la riga Levels, ovvero gli stati che può assumere l'elemento del vettore sono FINITI, PREDETERMINATI
# Levels elenca gli stati possibili, elencati in ordine alfabetico

# il fattore ha una struttura nascosta, ogni livello corrisponde ad un numero, posso visualizzarla tramite funzioni
as.integer(plants_factor) # se lo trasformiamo in integer
# perchè Tree è il terzo livello, Grass è il secondo e Forb è il 1

as.character(plants_factor) # se voglio tornare al vettore

# i factor possono essere NON ORDINATI, come quello precedente
# oppure ORDINATI
temperature_vector <- c("Low", "High", "Medium", "High", "Low") # 5 elelmenti, 3 livelli con ordine implicito che però devo specificare
temperature_factor <- factor(temperature_vector, ordered = T, levels = c("Low", "Medium", "High")) # argomento ordered di default è F, non ordinato; levels per dare l'ordine
temperature_factor 
# otteniamo il vettore e poi il levels in ordine crescente
#[1] Low    High   Medium High   Low   
#Levels: Low < Medium < High

# immaginiamo di avere milioni di elementi, possiamo calcolare delle statistiche riassuntive
# summary statistics tramite la funzione summary
summary(temperature_factor)
#   Low Medium   High 
#    2      1      2  --> sono le frequenze assolute

# se voglio calcolare la frequenza relativa 
summary(temperature_factor) / length(temperature_factor)
#Low    Medium   High 
# 0.4    0.2    0.4 

# se voglio le percentuali
(summary(temperature_factor) / length(temperature_factor))*100 # anche senza parentesi perchè la priorità * e / è la stessa
#   Low Medium   High 
#   40     20     40 --> sono %

# come è possibile modificare le labels
# es abbiamo campionato le comunità di muschi e raccolto info sul tipo di suolo CALCAREO e SILICATICO
substrate_vector <- c("L", "S", "S", "L", "S") # vettore
substrate_factor <- factor(substrate_vector) # lo trasformo in un fattore
substrate_factor 
#[1] L S S L S
#Levels: L S 

# se voglio > chiarezza, diversa formattazione posso modificare le labels ovvero i character associate ai livelli, le etichette
levels(substrate_factor) # stiamo specificando le labels dei vari livelli, così visualizzo i livelli
levels(substrate_factor) <- c("Limestone", "Siliceous") # assegno ai levels i nuovi valori nel giusto ordine
substrate_factor # ho cambiato le etichette
#[1] Limestone Siliceous Siliceous Limestone Siliceous
#Levels: Limestone Siliceous









