.text
.global produkt

produkt:
push %rbp
mov %rsp, %rbp
xor %r8, %r8
movq $1, %rcx
petla:
    # rdi adres liczby do zamienienia
    # rsi adres do tablicy
    # rdx adres do tablicy liczb pierwszych
    # r8 licznik petli

    # rcx obecny iloczyn -- produkt

    # mnozenie RDX:RAX
    movq (%rdx), %rax # laduje kolejna liczbe pierwsza
    movq %rax, %r8
    mulq %rcx # mnozenie rax * rcx


    true: # if(produkt > x)
        # break
        cmpq (%rdi), %rax
        jnl koniec

    false: # rax do rcx
        add $4, %rdx
        movq %rax, %rcx
        movq %r8, (%rsi)
        add $4, %rsi
        jmp petla
koniec:
pop %rbp
ret