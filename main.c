#include <stdio.h>

long long primeNumber[6] = {2L,3L,5L,7L,11L,13L};
long long N[6] = {0};
long long first[6] = {0};
long long second[6] = {0};

// funkcja zwraca produkt
unsigned long long produkt(long long *number, long long *N, long long *primeNumber);
void conversion(long long *modulo, long long *N, long long *num);
long long toInt(long long *number, long long *N, long long *pro);

// ZAKLADAM ZE TYLKO DLA DODATNICH
int main(){
    long long fi = 123;
    long long *chosen = &fi;
    unsigned long long pro = produkt(chosen, N, primeNumber);
    printf("Produkt to:%lld\n", pro);
    printf("Tablica N to:\n");
    for(int i = 0; i < 7; i++)
        printf("%lld\n", N[i]);
    return 0;
}