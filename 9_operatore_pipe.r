# 16/11/2021
# se voglio concatenare + funzioni ho diverse possibilità
# es voglio fare la radice quadrata del logaritmo di 42

# 1. posso annidare le funzioni
sqrt(log(42))
#[1] 1.933305
# se ho + funzioni ho un problema di leggibilità
# l'ordine delle funzioni è dall'interno all'esterno

# 2. posso creare valori intermedi 
log_42 <- log(42)
sqrt(log_42)
# [1] 1.933305
# se hai matrici e salvi valori intermedi con troppi numeri occupi troppa RAM

# 3. uso l'operatore pipe %>% del pacchetto magrittr 
# se hai versioni di R + recenti puoi utilizzare l'operatore senza installare il pacchetto con l'operatore nativo |>
install.packages("magrittr")
library(magrittr)
42 %>% log() # così ho il log
42 %>% log() %>% sqrt() # posso concatenare le funzioni così
# non ho bisogno di salvare intermedi e leggo in maniera naturale l'ordine delle funzioni applicate


