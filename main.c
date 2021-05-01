#include <stdio.h>

long long primeNumber[6] = {2L,3L,5L,7L,11L,13L};
long long N[6] = {0};
long long first[6] = {0};
long long second[6] = {0};

void produkt(long long *one, long long *N, long long *primeNumber);
void conversion(long long *tab, long long *N, long long *num);

// ZAKLADAM ZE TYLKO DLA DODATNICH
int main(){
    long long *pNum = primeNumber, *pN = N, *firstPtr = first, *secondPtr = second;
    long long fi, sec;
    scanf("%lld %lld", &fi, &sec);

    // na podstawie wiekszej liczby obliczamy produkt
    long long *chosen = NULL;
    if(fi > sec)
        chosen = &fi;
    else
        chosen = &sec;

    produkt(chosen, pN, pNum);
    conversion(firstPtr, pN, &fi);
    conversion(secondPtr, pN, &sec);

    printf("Tablica N to:\n");
    for(int i = 0; i < 6; i++)
        printf("%lld\n", first[i]);
    return 0;
}