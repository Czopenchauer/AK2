.text
.global produkt

# Funkcja oblicza produkt tj. znajduje takie liczby pierwsze, ktorych iloczyn jest wiekszy
# wiekszy od liczby zamienianej.

# VARIABLE:
# r13 - liczba zamieniana
# r14 - tablica N
# r15 - tablica z liczbami pierwszymi
# r8  - petla pierwsza   [i]
# r9  - boolean
# r10 - petla wewnetrzna [j]
# r11 - produkt
# r12 - debiut
# rbx - buffor

produkt:
    push %rbp
    push %rbx
    push %r12
    push %r13
    push %r14
    push %r15
    mov %rsp, %rbp
    # zapisuje argumenty
    movq %rdi, %r13
    movq %rsi, %r14
    movq %rdx, %r15

    movq $1, %r11   # produkt = 1
    xor %r8, %r8    # i = 0
    petla_zew:
        cmpq (%r13), %r11               # if (produkt >= number)
        jae koniec 
        xor %r9, %r9                    # done = 0
        xor %r10, %r10                  # j = 0
        petla_krzyk:
            cmp %r8, %r10                 # j < i
            # jb petla_zew
            jae FUCK
            movq (%r15, %r10, 8), %rbx  # cur = primeNumber[j]; 
            movq %rbx, %rax             # cur to rax
            while_pow:                  # while(cur <= primeNumber[i])
                                        #   cur *= primeNumber[j]
                mul %rbx
                cmpq %rax, (%r15, %r8, 8)
                ja while_pow
            xor %rdx, %rdx
            div %rbx                    # cur /= primeNumber[j];
            inc %r10
            cmpq %rax, %rbx             # cur (rax) != primeNumber[j] (rbx)
            je petla_krzyk
            dec %r10
            clc
            movq (%r14, %r10, 8), %rcx
            inc %r10                   
            cmpq %rax, %rcx             # if (cur != N[j])
            je petla_krzyk
            dec %r10
            xor %rdx, %rdx
            movq %rax, %rbx             # w rax jest cur^ wiec przerzucam go do rbx
            movq %r11, %rax             # produkt do rax
            movq (%r14, %r10, 8), %r12  # wczytuje N[j] do r12
            div %r12                    # produkt /= N[j]
            movq %rbx, (%r14, %r10, 8)  # N[j] = cur
            mul %rbx                    # produkt *= N[j] (cur)
            movq %rax, %r11             # zapisuje wymnozony produkt w r11
            dec %r8
            mov $1, %r9                 # done = 1
            inc %r10                    # j++
            cmp (%r13), %r11             # produkt >= number
            jae koniec
            jmp petla_krzyk
        FUCK:
        inc %r8
        # _if(done == 0)
        cmp $1, %r9
        je petla_zew
        dec %r8
        movq (%r15, %r8, 8), %rbx       # primeNumber[i]
        movq %rbx, (%r14, %r8, 8)       # N[i] = primeNumber[i]
        movq %r11, %rax                 # produkt do rax
        mul %rbx                        # produkt *= primeNumber[i]
        movq %rax, %r11                 # zapisanie wymnozonego produktu w r11
        inc %r8                         # i++
        cmpq (%r13), %r11               # produkt >= number
        jae koniec
        jmp petla_zew
koniec:

# A TERAZ MNIE WYPIERDOL
# VARIABLE:
# r8  - wartosc 'i' z petli powyzej
# r9  - licznik petli
# r11 - produkt
xor %r9, %r9
petla_wy:
    cmp %r8, %r9                 # k < i
    jae finnaly
    movq (%r14, %r9, 8), %rbx    # wczytuje N[k]
    movq (%r15, %r9, 8), %rcx    # wczytuje primeNumber[k]
    cmpq %rbx, %rcx              # if(N[k] != primeNumber[k])
    je entire                    # jesli nie jest to spelnione to probujemy wywalic cala liczbe a nie tylko potege                       
    movq %r11, %rax              # produkt do rax
    div %rcx                     # produkt /= primeNumber[k]
    cmpq (%r13), %rax            # if(produkt < number)
    jb multiply                  # jesli tak to przywroc produkt i zakoncz
    movq %rax, %r11              # zapisz produkt
    movq (%r14, %r9, 8), %rax    # wczytuje N[k]
    div %rcx                     # N[k] /= primeNumber[k]
    movq %rax, (%r14, %r9, 8)    # zapisuje N[k]
    jmp petla_wy                 # i kolejny obiek
    # przed jmp powinno byc zwiekszenie licznika inc %r9
    # ale w tym ifie rowniez zmiejszamy licznik wiec nie robie tego
    multiply:
        mul %rcx
        movq %rax, %r11
        jmp finnaly
    entire:
        movq %r11, %rax              # laduje produkt do rax
        movq (%r14, %r9, 8), %rbx    # wczytuje N[k]
        div %rbx                     # produkt /= N[k]
        inc %r9
        cmpq (%r13), %rax            # if (produkt >= number)
        jb petla_wy
        dec %r9
        movq %rax, %r11              # zapisuje produkt
        movq $0, (%r14, %r9, 8)      # N[k] = 0
        movq %r9, %r10
        inc %r9 # zwiekszam licznik petla_wy
        smol:
            cmp $19, %r10             # s < 19
            jbe petla_wy
            inc %r10
            movq (%r14, %r10, 8), %rbx # wczytuje N[s + 1]
            dec %r10
            movq %rbx, (%r14, %r10, 8) # N[s] = N[s+ 1]
            inc %r10
            jmp smol
            
finnaly:
movq %r11, %rax

pop %r15
pop %r14
pop %r13
pop %r12
pop %rbx
pop %rbp
ret