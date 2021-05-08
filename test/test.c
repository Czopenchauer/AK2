#include <stdio.h>
#include <math.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };

int main(){
    long long number = 3333333333333L;
    unsigned long long produkt = 1L;

    // // toINT
    // unsigned long long sum = 0;
    // for(int i = 0; N[i] != 0; i++){
    //     // okreslanie wagi pozycji
    //     // produkt /= N[i]
    //     int temp = pro / N[i];
    //     // czy temp % N[i] == 1
    //     if (temp % N[i] == 1){
    //         sum += temp * first[i];
    //         continue;
    //     }
    //     else {
    //         //
    //         for(int j = 2; j <= N[i]; j++){
    //             int temp = pro / N[i];
    //             temp *= j;
    //             if(temp % N[i] == 1){
    //                 sum += temp * first[i];
    //                 continue; // j++
    //             }
    //         }            
    //     }
    // }

    // bierzemy liczbe pierwsza
    // czy istnieje jakas wczesniejsza pierwsza ktora podniesiona do potegi bedzie mniejsza obecnej
    // jesli tak to bierzemy ja i mnozymy przez nia produkt
    int i = 0, done = 0;
    for(i; i < 18; i++) {
        if(produkt >= number)
            break;
        done = 0;
        for(int j = 0; j < i; j++){   
            long long cur = primeNumber[j]; 
            while(cur <= primeNumber[i]){ 
                cur *= primeNumber[j]; 
            }
            cur /= primeNumber[j]; 
            if (cur != primeNumber[j] && cur != N[j]){
                produkt /= N[j];
                N[j] = cur;                 
                produkt *= N[j];
                i--;
                done = 1;
                if(produkt >= number){
                    break;
                }
            }
        }
        
        if(done == 0){
            N[i] = primeNumber[i];
            produkt *= primeNumber[i];
            if(produkt >= number){
                break;
            } 
        }
    }

    for(int k = 0 ; k < i; k++) {
        if(N[k] != primeNumber[k]){
            produkt /= primeNumber[k];
            if(produkt < number){
                produkt *= primeNumber[k];
                break;
            }
            N[k] /= primeNumber[k];
            k--;
            continue;
        }       
        produkt /= N[k];
        if(produkt >= number){
            N[k] = 0;
            for(int s = k; s < 19; s++){
                N[s] = N[s+ 1];
            }
            continue;
        }
        produkt *= N[k];
    }
    printf("Produkt to:%lld\n", produkt);
    printf("Tablica N to:\n");
    for(int i = 0; i < 19; i++)
        printf("%lld\n", N[i]);
    return 0;
    
}