#include <stdio.h>
#include <math.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };
long long first[18] = { 0 };

int main(){
    long long number = 3333333333333L;
    unsigned long long produkt = 1L;
    
    unsigned long long sum = 0;
    for(int i = 0; N[i] != 0; i++){
        int temp = produkt / N[i];
        if (temp % N[i] == 1){
            sum += temp * first[i];
            continue;
        }
        else {
            for(int j = 2; j <= N[i]; j++){
                int temp = produkt / N[i];
                temp *= j;
                if(temp % N[i] == 1){
                    sum += temp * first[i];
                    continue;
                }
            }            
        }
    }
}