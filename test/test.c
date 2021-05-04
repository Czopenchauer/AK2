#include <stdio.h>
#include <math.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };

int main(){
    long long number = 333L;
    unsigned long long produkt = 1L;
    scanf("%lld", &number);
    // bierzemy liczbe pierwsza
    // czy istnieje jakas wczesniejsza pierwsza ktora podniesiona do potegi bedzie mniejsza obecnej
    // jesli tak to bierzemy ja i mnozymy przez nia produkt
    int i = 0, fuck = 0;
    for(i; i < 18; i++) {   
        for(int j = 0; j < i; j++){   
            long long cur = primeNumber[j]; 
            while(cur < primeNumber[i]){ 
                cur *= primeNumber[j]; 
            }
            cur /= primeNumber[j]; 
            if (cur != primeNumber[j]){
                produkt /= N[j];
                N[j] = cur;                 
                produkt *= cur;
                i--;
                fuck++;
                if(produkt >= number){
                    break;
                }
                continue;
            }
        }
        N[i + fuck] = primeNumber[i + fuck]; // 5 na pozycje 3
        produkt *= primeNumber[i + fuck];
        if(produkt >= number){
            break;
        }
    }
    // 18 480
    // TERAZ TRZEBA WYJEBAC
    i += fuck;
    for(i ; i > 0; i--) {
        produkt /= N[i];
        long long kek = N[i];
        if(produkt >= number){
            N[i] = 0;
            // wykonuje do momentu az natrafimy na 0 w tablicy
            for(int k = 0; k < 18; k++){
                N[i + k] = N[i+ k + 1]; 
            }
            continue;
        }
        produkt *= kek;
    }
    printf("Produkt kocie to : %lld \n", produkt);
    for(int i = 0; i < 18; i++)
        printf("%lld, ", N[i]);
    return 0; // number = 123 
}