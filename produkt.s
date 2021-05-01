.text
.global produkt

# r11 adres liczby do zamienienia
# r12 adres do tablicy
# r13 adres do tablicy liczb pierwszych
# r8 liczba pierwsza ktora sklada sie na produkt
# r9 licznik petli
# r10 obecny produkt

produkt:
    push %rbp
    mov %rsp, %rbp
    xor %r8, %r8
    xor %r9, %r9
    movq $1, %r10
    movq %rdi, %r11
    movq %rsi, %r12
    movq %rdx, %r13
petla:
    movq (%r13, %r9, 8), %rax # laduje kolejna liczbe pierwsza
    movq %rax, %r8 
    mulq %r10
    true:
        movq %r8, (%r12, %r9, 8)
        cmpq (%r11), %rax
        jnl koniec
    false:
        movq %rax, %r10
        inc %r9
        jmp petla
koniec:
pop %rbp
ret