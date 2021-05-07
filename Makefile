all: main
main: main.c toInt.s produkt.s toRNS.s
	gcc -ggdb toRNS.s toInt.s produkt.s main.c -o main
clear:
	rm main