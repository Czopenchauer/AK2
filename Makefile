all: produkt
produkt: produkt.c produkt.s
	gcc -ggdb produkt.s produkt.c -o produkt
clear:
	rm produkt