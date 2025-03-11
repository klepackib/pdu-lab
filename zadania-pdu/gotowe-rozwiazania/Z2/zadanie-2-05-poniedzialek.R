# PDU - 10.03.2025
# Przykładowe rowiązanie zadania 2.5

# Wstęp o funkcji paste()
#
# dwa lub wiecej wektorow: 
# odpowiadajace sobie elementy sa sklejane w napis
paste(c(1, 2, 3), c("a", "b", "c"))
paste(c(1, 2, 3), c("a", "b", "c"), sep = '**')
paste(c(1, 2, 3), c("a", "b", "c", "s"), sep = '**')
# jeden wektor + collapse: wszystkie elementy jednego wektora sa sklejone
# w jeden napis gdzie łącznikiem jest collapse
paste(letters, collapse = "~")

paste( paste(c(1, 2, 3), collapse = '-'), 
       paste(c("a", "b", "c"), collapse = '+'), 
       sep = '**' )


# Rozwiazanie:

merge_string_list <- function(x, lacznik = '') {
  # ...  
  stopifnot(is.list(x), length(x) > 0)
  
  czy_napisow <- sapply(x, is.character)
  stopifnot( all(czy_napisow) )
  # 
  
  paste( unlist(x), collapse = lacznik )
}


# Przykłady:

x <- list(letters, LETTERS, 1:10)
merge_string_list(x) # blad :(

x <- list(letters, LETTERS)
merge_string_list(x)
merge_string_list(x, '*~*')



