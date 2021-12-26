# fine lezione 09/11/2021
# dataframe = genere di dati rettangolari anche non omogenei (es colonne con integer, characters etc.
# il mio primo dataframe
 dat <- data.frame( # funzione per creare dataframe, parentesi e a capo x la prima colonna (è + comodo leggere il codice in verticale)
				  id = 1:6,  # prima colonna, sequenza di valori interi da 1 a 6 (ogni nuova riga sarà una nuova colonna)
				  name = c("Eokochia saxicola", "Cytisus aeolicus", "Anthemis aeolica", "Centaurea aeolica", "Silene hicesia", "Genista tyrrhena"), # seconda colonna, nomi delle specie
				  has_legumes = c(F, T, F, F, T , F), # terza colonna su quale è leguminosa
				  population_size = c(50, 2000, 5000, 10000, 200, 3000), # quanti individui per ciascuna specie ci sono alle eolie
				  growth_form = c("Herb", "Tree", "Herb", "Shrub", "Herb", "Tree") # tipo di forma di crescita
				)
dat
#  id              name has_legumes population_size growth_form
#1  1 Eokochia saxicola       FALSE              50        Herb
#2  2  Cytisus aeolicus        TRUE            2000        Tree
#3  3  Anthemis aeolica       FALSE            5000        Herb
#4  4 Centaurea aeolica       FALSE           10000       Shrub
#5  5    Silene hicesia        TRUE             200        Herb
#6  6  Genista tyrrhena       FALSE            3000        Tree

# diverse colonne possono avere diverti tipi di dati ma hanno sempre i nomi, così come le righe (ma + semplici, sono gli indici)


