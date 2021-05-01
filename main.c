#include <stdio.h>

long long primeNumber[6] = {2L,3L,5L,7L,11L,13L};
long long N[6] = {0};

void produkt(long long *one, long long *N, long long *primeNumber);
void conversion(long long *tab, long long *N, long long *num);

int main(){
    long long *pNum = primeNumber;
    long long *pN = N;  
    long long first, second;
    scanf("%lld %lld", &first, &second);

    // na podstawie wiekszej liczby obliczamy produkt
    long long *chosen = NULL;
    if(first > second)
        chosen = &first;
    else
        chosen = &second;

    produkt(chosen, pN, pNum);

    printf("Tablica N to:\n");
    for(int i = 0; i < 6; i++)
        printf("%lld\n", N[i]);
    return 0;
}