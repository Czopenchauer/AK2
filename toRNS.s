.text
.global toRNS

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
# r12 - wczytana liczba z tablicy N

toRNS:
    push %rbp
    push %r12
    push %r13
    mov %rsp, %rbp
    # kopiuje adresy
    movq %rdi, %r8
    movq %rsi, %r9
    movq %rdx, %r10
    movq %rcx, %r13
    xor %r11, %r11
petla:
    xor %rax, %rax
    xor %rdx, %rdx
    # odczytuje N
    movq (%r9, %r11, 8), %r12
    cmp $0, %r12 # jesli N jest 0 to znaczy ze skonczyly sie liczby/ koniec tablicy N
    jz koniec
    movq %r10, %rax
    div %r12
    movq %rdx, (%r8, %r11, 8)
    inc %r11
    jmp petla
koniec:
clc
cmpq $1, %r13
je end
xor %r11, %r11
complement:
    clc
    xor %rax, %rax
    xor %rdx, %rdx
    # odczytuje N
    movq (%r9, %r11, 8), %r12
    movq (%r8, %r11, 8), %r13
    cmp $0, %r12 # jesli N jest 0 to znaczy ze skonczyly sie liczby/ koniec tablicy N
    jz end
    sub %r13, %r12
    movq %r12, (%r8, %r11, 8)
    inc %r11
    jmp complement

end:
pop %r13
pop %r12
pop %rbp
ret