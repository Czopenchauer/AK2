all: main
main: main.c toInt.s produkt.s toRNS.s addRNS.s subRNS.s
	gcc -ggdb subRNS.s addRNS.s toRNS.s toInt.s produkt.s main.c -o main
clear:
	rm main