#include <stdio.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };
long long first[18] = {0};
long long second[18] = {0};

// funkcja zwraca produkt
unsigned long long produkt(long long *number, long long *N, long long *primeNumber);
void conversion(long long *modulo, long long *N, long long *num);
long long toInt(long long *number, long long *N, long long *pro);

// ZAKLADAM ZE TYLKO DLA DODATNICH
// potencjal wyjebania:
// W produkt petla smol. Czemu? Byc moze indeksy s i k beda wychodzic poza zakres
int main(){
    long long fi = 3333333333333L;
    long long *chosen = &fi;
    unsigned long long pro = produkt(chosen, N, primeNumber);
    printf("Produkt to:%lld\n", pro);
    printf("Tablica N to:\n");
    int i = 0;
    for(int i = 0; i < 19; i++)
        printf("%lld\n", N[i]);
    return 0;
}