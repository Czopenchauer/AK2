#include <stdio.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };
long long first[18] = { 0 };
long long second[18] = { 0 };

long long maxResult(int power){
    long long result = 9;
    for(int i = 1; i < power; ++i){
        result *= 10;
        result += 9;
    }
    return result;
}

int countDigits(int number){
    int digits = 0;
    do {
        ++digits;
        number /= 10;
    } while(number != 0);
    return digits;
}

long long estimateResult(int first, int second, char type){
    int bigger = first > second ? first : second;
    switch(type){
        case '+':
            return maxResult(countDigits(bigger) + 1);
        case '-':
            return maxResult(countDigits(bigger));
        case '*':
            return maxResult(countDigits(first) + countDigits(second));
    }
}

unsigned long long produkt(long long number, long long *N, long long *primeNumber);
void toRNS(long long *modulo, long long *N, long long num);
long long toInt(long long *number, long long *N, long long pro);
void addRNS(long long *first, long long *second, long long *N);
void subRNS(long long *first, long long *second, long long *N);
void mulRNS(long long *first, long long *second, long long *N);

int main(){
    int fi = 1;
    int sec = 0;
    char type = '+';
    printf("Podaj liczby oraz dzialanie (znak +/*)\n");
    scanf("%d %d %c", &fi, &sec, &type);
    long long maks = estimateResult(fi,sec,type);
    unsigned long long pro = produkt(maks, N, primeNumber);
    toRNS(first, N, fi);
    toRNS(second, N, sec);
    switch(type){
        case '+':
            addRNS(first, second, N);
        break;
        case '-':
            subRNS(first, second, N);
        break;
        case '*':
            mulRNS(first, second, N);
        break;
    }
    long long a = toInt(first, N, pro);
    printf("Maksymalny wynik dzialania: %lld\n"
            "Zakres dynamiczny: %lld"
            "\nDzialanie: %d %c %d = %lld\n"
            ,maks, pro, fi, type, sec, a);
}