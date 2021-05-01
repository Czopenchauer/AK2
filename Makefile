all: main
main: main.c produkt.s conversion.s
	gcc -ggdb conversion.s produkt.s main.c -o main
clear:
	rm main
r:
	./main