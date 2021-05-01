.text
.global conversion

# Funkcja zamienia liczbe podana jako argument na system RNS poprzez dzielenie jej
# przez kolejne liczby z tablicy N. Nastepnie reszte z dzielenia zapisuje w tablicy.

# Funkcja dostaje trzy argumenty:
# 1. tablica do wpisywania reszty z dzielenia %rdi
# 2. tablica N                                %rsi
# 3. liczba do zamienienia                    %rdx

# VARIABLES:
# r8 - zapisuje adres rdi
# r9 - zapisuje adres rsi
# r10 - zapisuje adres rdx
# r11 - licznik petli
produkt:
    push %rbp
    mov %rsp, %rbp
    # zapisuje rejestry
    movq %rdi, %r8
    movq %rsi, %r9
    movq %rdx, %r10
    xor %r11, %r11

petla:
    
koniec:

pop %rbp
ret