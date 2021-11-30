# 05/11/2021
# caratteristiche delle metrici: bidimensionali e omogenee
matrix(1:9, nrow=3) # valori da 1 a 9 e  3 righe
#     [,1] [,2] [,3]  in [] sono gli indici di colonne e righe
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9

# creaiamo una nuova matrice dei campionamenti di 2 specie di passeriformi
garden <- c(10, 2) # numeri per il giardino
forest <- c(8, 3) # per una foresta
hedgerow <- c(1, 12) # per le siepi

# ho i vettori, posso creare la matrice di comunità in cui vengono indicate le comunità biotiche nelle varie località
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3) # i siti nelle righe
community_matrix
#     [,1] [,2]
#[1,]   10    3
#[2,]    2    1
#[3,]    8   12  
# l' ordine così è errato perchè manca l'argomento byrow che di default è falso e i valori vengono riempiti per colonna
# se scriviamo byrow = TRUE otteniamo un riempimento della matrice per riga
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3, byrow=T) # i siti nelle righe
community_matrix
#     [,1] [,2]
#[1,]   10    2 garden
#[2,]    8    3 forest
#[3,]    1   12 hedgerow

species <- c("Parus major", "Erithacus rubecula") # saranno i nomi delle colonne
sites <- c("Garden", "Forest", "Hedgerow") # i nomi delle righe
colnames(community_matrix) <- species # per rinominare le colonne
rownames(community_matrix) <- sites # per rinominare le righe
community_matrix

#         Parus major Erithacus rubecula
#Garden            10                  2
#Forest             8                  3
#Hedgerow           1                 12

# vogliamo ingrandire la matrice con nuovi dati
passer <- c(15, 2, 5) # creo un vettore con nuovi dati, passeri comuni, 15 nel 1° sito, 2 nel 2°, 5 nel 3° 
# possiamo fare un binding tra il vettore e la matrice es. 3 colonna tramite la funzione cbind
cbind(community_matrix, passer) # la c sta per colonna

#           Parus major Erithacus rubecula passer
#Garden            10                  2     15
#Forest             8                  3      2
#Hedgerow           1                 12      5

# sovrascriviamo l'oggetto per associarlo a community_matrix
community_matrix <- cbind(community_matrix, passer) # è diventata una matrice 3x3
community_matrix

# per le righe
park <- c(10, 1, 8) # nuovo sito di campionamento
# vogliamo legare una nuova riga alla matrice 3x3
rbind(community_matrix, park)
community_matrix <- rbind(community_matrix, park)
community_matrix

#         Parus major Erithacus rubecula passer
#Garden            10                  2     15
#Forest             8                  3      2
#Hedgerow           1                 12      5
#park              10                  1      8

# la formattazione dei nomi può essere modificata riassegnandoli tramite la funzione colnames
colnames(community_matrix) # visualizzo i nomi

#[1] "Parus major"        "Erithacus rubecula"
#[3] "passer"

# la formattazione di passer è sbagliata, possiamo utilizzare gli indici per selezionare l'elemento e modificare solo quello
colnames(community_matrix)[3] <- "Passer domesticus"
colnames(community_matrix)
#[1] "Parus major"        "Erithacus rubecula"
#[3] "Passer domesticus" 

# possiamo fare lo stesso con le righe
rownames(community_matrix)
#[1] "Garden"   "Forest"   "Hedgerow" "park" 
# voglio cambiare la formattazione di park
rownames(community_matrix)[4] <- "Park" # riassegnamo il nome
rownames(community_matrix)
#[1] "Garden"   "Forest"   "Hedgerow" "Park" 

community_matrix # la formattazione sarà quella corretta
#        Parus major Erithacus rubecula Passer domesticus
#Garden            10                  2                15
#Forest             8                  3                 2
#Hedgerow           1                 12                 5
#Park              10                  1                 8

# 09/11/2021
# la funzione dim è come length ma x le matrici -> ci dà le dimensioni
dim(community_matrix) # otterrò sempre un vettore di numeri interi integer di lunghezza 2
# [1] 4 3 quattro righe e tre colonne 4x3 -> prima SEPRE le righe

# funzione nrow per il numero di righe
nrow(community_matrix) # [1] 4

# funzione ncol per il numero di colonne
ncol(community_matrix) # [1] 3

# posso fare delle somme per colonna o per riga
# sommo per colonna tramite la funzione colSums per ottenere il tot di individui per ogni specie
colSums(community_matrix)
#Parus major Erithacus rubecula  Passer domesticus 
#    29                 18                 30 
# sommo per riga tramite la funzione rowSums per ottenere il numero di individui per ciascun sito
rowSums(community_matrix)
#Garden   Forest Hedgerow     Park 
#  27       13       18       19 

# se vogliamo aggiungere un'altra riga con il totale --> leghiamo tramite la funzione rbind
rbind(community_matrix, Total = colSums(community_matrix)) # lego la matrice al risultato di colSums

# # se vogliamo aggiungere un'altra colonna con il totale --> leghiamo tramite la funzione cbind
cbind(community_matrix, Total = rowSums(community_matrix)) #  # lego la matrice al risultato di rowSums

# possiamo applicare operatori matematici
community_matrix + 2 # se voglio aggiungere 2 individui x tutte le specie
# è una operazione scalare perchè viene applicata a tutti gli elementi in = modo

# se voglio x 2
community_matrix * 2

# se voglio lavorare solo su 1 elemento devo selezionarlo tramite indexin come per i vettori ma quì sono diverse le dimensioni, ne abbiamo 2
community_matrix[1, 2] # voglio selezionare il primo elemento della seconda colonna (SEMPRE prima le righe)
community_matrix[1, ] # voglio tutti i valori della prima riga, non metto nulla dopo la virgola
community_matrix[1:2, ]# se voglio estrarre le prime due righe
community_matrix[c(1, 3), ]# se voglio estrarre la riga 1 e 3 uso la funzione combine
community_matrix[-1, ]# se voglio rimuovere la prima riga
community_matrix[,"Parus major"] # se voglio estrarre colonne utilizzando i nomi
community_matrix[2,"Parus major"]# se voglio il secondo elemento della colonna Parus major
community_matrix[, 2:ncol(community_matrix)] # se voglio dalla seconda colonna fino all'ultima (ncol restituisce l'indice dell'ultima colonna)















