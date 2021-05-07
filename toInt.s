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
# r13 - licznik petli (bruh)
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
    petla:
        cmpq $0, (%r9, %r11, 8)
        je koniec
        xor %rdx, %rdx
        movq (%r9, %r11, 8), %rbx   # N[i]
        movq (%r10), %rax           # produkt
        div %rbx                    # kek = produkt / N[i] 210 / 2
        movq %rax, %rsi
        xor %rdx, %rdx
        div %rbx                    # kek % N[i]            105/2
        cmp $1, %rdx                # reszta (rdx) == 1
        jne else
        movq %rsi, %rax
        movq (%r8, %r11, 8), %rbx
        mul %rbx                    # kek * first[i]
        add %rax, %rcx             # sum += ^
        inc %r11
        jmp petla
        else:
            movq $2, %r13
            smol:
                cmpq %r13, (%r9, %r11, 8) # bruh <= N[i]
                jb petla
                xor %rdx, %rdx
                movq (%r9, %r11, 8), %rbx   # pobiera N[i]
                movq (%r10), %rax           # pobiera produkt
                div %rbx                    
                mul %r13   
                xor %rdx, %rdx             
                div %rbx
                inc %r13
                cmp $1, %rdx
                jne smol
                movq (%r8, %r11, 8), %rbx
                mul %rbx
                add %rax, %rcx
                inc %r11
                jmp petla
koniec:
movq %rcx, %rax
movq (%r10), %rbx
xor %rdx, %rdx
div %rbx

pop %r13
pop %r12
pop %rbx
pop %rbp
ret