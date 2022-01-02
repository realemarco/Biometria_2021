# 19/11/2021
# come costruire funzioni su R
# 1a funzione da creare -> passando un numero, questa attua un +2
# dare un nome alla funzione es. add_two 
# la creo grazie alla funzione function
add_two <- function(x) { # in parentesi scrivo gli argomenti della mia funzione, quello che fa la funzione
  x_plus_two <- x + 2
  return(x_plus_two) # per fare in modo che la funzione ci ritorni l'oggetto 
} # nelle graffe scrivo il corpo della funzione, quello che andrà a fare

add_two(5)

# 2a funzione -> passando il nome resituirà un saluto
cheer_me <- function(nome) {
  cheer_string <- paste("Hello", nome, sep = " ") 
  # funzione paste per unire stringhe con separatori scelti 
  # argomento sep per indicare cosa ci sarà tra hello e il nome
  print(cheer_string)
}

