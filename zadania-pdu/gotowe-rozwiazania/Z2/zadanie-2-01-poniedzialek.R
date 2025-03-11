# PDU - 10.03.2025
# Przykładowe rowiązanie zadania 2.1

# Wprowadzenie:
?rle

x <- c(1, 2, 1, 1, 4, 8, 1)
r <- rle( sort(x) )
str(r) # choć wygląda inaczej jest to nadal list

# elementy listy:
r$lengths # ile razy dany element wystepowal w ciagu
r$values # elementy

# Rozwiązanie:

x <- sample(10, 100, TRUE) # generujemy przykladowe dane
# 1.) Sortujemy wektor x
x_sorted <- sort(x)
# 2.) wyznaczamy długości ciągów kolejnych unikatowych wartości z x
r <- rle(x_sorted)
# 3.) Wybieramy tę która odpowiada najdłuższemu ciągowi tj. występuje
#     najczęsciej
moda <- r$values[which.max(r$lengths)]
print(moda)

