## PDU
## Zadanie 2.9


distance <- function(p, a, b){
   stopifnot(is.numeric(p), length(p) > 0)
   stopifnot(is.numeric(a), length(a) > 0, length(a) == length(p))
   stopifnot(is.numeric(b), length(b) == 1)
   
   # iloczyn skalarny suma{a_i * p_i} == sum(a*p) w R
   # norma Euklidesowa: sqrt(suma{a_i * a_i}) == sqrt(sum(a^2)) 
   abs(sum(a*p) + b)/sqrt(sum(a^2))
}

### Przyklady:
distance(c(2, -2, 0.5), c(2, 1, 4), b = -4)
distance(c(0, 0), c(1, 1), b = -2.0)
