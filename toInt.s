.text
.global toInt

# Funkcja dostaje trzy argumenty:
# 1. tablica reszt z dzielenia                %rdi
# 2. tablica N                                %rsi
# 3. produkt                                  %rdx

# VARIABLES:
# r8 - tablica reszt z dzielenia rdi
# r9 - tablica N rsi
# r10 - produkt rdx
# r11 - licznik petli
# r12 - wczytana liczba z tablicy N
# r13 - licznik petli (j)
# rcx - suma
# rbx - bufor

toInt:
    push %rbp
    push %rbx
    push %r12
    push %r13
    mov %rsp, %rbp

    # zapisuje adresy
    mov %rdi, %r8
    mov %rsi, %r9
    mov %rdx, %r10

    xor %r11, %r11
    xor %rcx, %rcx
    petla:                          # petla for(int i = 0; N[i] != 0; i++)
        cmpq $0, (%r9, %r11, 8)     # N[i] != 0
        je break
        xor %rdx, %rdx           
        movq (%r9, %r11, 8), %rbx   # N[i]
        movq (%r10), %rax           # produkt
        div %rbx                    # produkt / N[i]
        movq %rax, %rsi             # zapisuje produkt / N[i]
        xor %rdx, %rdx
        div %rbx                    # temp % N[i]       
        cmp $1, %rdx                # reszta (rdx) == 1
        jne else
        movq %rsi, %rax             # wczytuje produkt / N[i]
        movq (%r8, %r11, 8), %rbx   # first[i]
        mul %rbx                    # temp * first[i]
        add %rax, %rcx              # dodaje iloczyn do sumy
        inc %r11                    # i++
        jmp petla
        else:
            movq $2, %r13
            smol:                           # petla for(int j = 2; j <= N[i]; j++)
                cmpq %r13, (%r9, %r11, 8)   # j <= N[i]
                jb petla
                xor %rdx, %rdx
                movq (%r9, %r11, 8), %rbx   # pobiera N[i]
                movq (%r10), %rax           # pobiera produkt
                div %rbx                    # produkt /= N[i]
                xor %rdx, %rdx                  
                mul %r13                    # temp *= j
                xor %rdx, %rdx                
                movq %rax, %rsi
                div %rbx                    # temp % N[i]
                inc %r13
                cmp $1, %rdx                # temp % N[i] == 1
                jne smol
                movq %rsi, %rax
                movq (%r8, %r11, 8), %rbx   # first[i]
                xor %rdx, %rdx
                mul %rbx                    # temp *= first[i]
                add %rax, %rcx              # dodaj do sumy
                inc %r11
                jmp petla
break:
movq %rcx, %rax
movq (%r10), %rbx
xor %rdx, %rdx
div %rbx
movq %rdx, %rax

pop %r13
pop %r12
pop %rbx
pop %rbp
ret