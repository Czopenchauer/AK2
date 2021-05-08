.text
.global addRNS

# Funkcja dodaje dwie liczby zapisane w systemie RNS.
# Wynik jest zapisany w liczbie pierwszej.

# Funkcja dostaje trzy argumenty:
# 1. liczba pierwsza                          %rdi
# 2. liczba druga                             %rsi
# 3. tablica N                                %rdx

# VARIABLES:
# r8 - liczba pierwsza      rdi
# r9 - liczba druga         rsi
# r10 - tablica N           rdx
# r11 - licznik petli
# r12 - wczytana liczba z tablicy N

addRNS:
    push %rbp
    mov %rsp, %rbp
    mov %rdi, %r8
    mov %rsi, %r9
    mov %rdx, %r10
    xor %r11, %r11
petla:
    movq (%r10, %r11, 8), %r12      # wykonujemy petle do momentu N[i] == 0
    cmp $0, %r12
    jz koniec
    xor %rdx, %rdx
    movq (%r8, %r11, 8), %rax       # liczba pierwsza
    movq (%r9, %r11, 8), %rcx       # liczba druga
    add %rcx, %rax
    div %r12
    movq %rdx, (%r8, %r11, 8)
    inc %r11
    jmp petla

koniec:
pop %rbp
ret