#include <stdio.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };
long long first[18] = { 0 };
long long second[18] = { 0 };

// funkcja zwraca produkt
unsigned long long produkt(long long *number, long long *N, long long *primeNumber);
void toRNS(long long *modulo, long long *N, long long *num);
long long toInt(long long *number, long long *N, long long *pro);
void addRNS(long long *first, long long *second, long long *N);
void subRNS(long long *first, long long *second, long long *N);

int main(){
    long long fi = 203;
    long long sec = 14;
    //scanf("%lld %lld", &fi, &sec);
    long long temp = fi + sec;
    long long *chosen = &temp;

    unsigned long long pro = produkt(chosen, N, primeNumber);
    chosen = &fi;
    toRNS(first, N, chosen);
    chosen = &sec;
    toRNS(second, N, chosen);
    subRNS(first, second, N);
    long long *ptr = &pro;
    int a = toInt(first, N, ptr);

    for(int i = 0; i < 5; i ++){
        printf("%lld, ", N[i]);
    }
    printf("Produkt to: %lld\ntoInt to: %d\n", pro, a);

}