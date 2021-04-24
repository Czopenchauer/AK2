#include <stdio.h>

//int primeNumber[6] = {2,3,5,7,11,13};
//long int N[6];

long long produkt(long long int *one, long int *N, long int *primeNumber);

int main(){
    long int primeNumber[6] = {2L,3L,5L,7L,11L,13L};
    long int N[6];
    long int *ptr = primeNumber;
    long int *ptr2 = N;
    long long int first, second;
    scanf("%lld", &first);
    produkt(&first, ptr2, ptr);
    for(int i = 0; i < 6; i++)
        printf("%ld", N[i]);
    return 0;
}