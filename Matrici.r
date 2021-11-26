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

#sei a 38min

















