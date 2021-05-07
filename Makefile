all: main
main: main.c toInt.s produkt.s conversion.s
	gcc -ggdb conversion.s toInt.s produkt.s main.c -o main
clear:
	rm main