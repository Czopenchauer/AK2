.text
.global produkt

# Funkcja oblicza produkt tj. znajduje takie liczby pierwsze, ktorych iloczyn jest wiekszy
# wiekszy od liczby zamienianej.

# ARGUMENTY:
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
movq %r11, %rax

pop %r15
pop %r14
pop %r13
pop %r12
pop %rbx
pop %rbp
ret