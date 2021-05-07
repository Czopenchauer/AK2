#include <stdio.h>

long long primeNumber[18] = { 2, 3, 5, 7, 11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,49, 53, 0 };
long long N[18] = { 0 };
long long first[18] = { 0 };
long long second[18] = { 0 };

// funkcja zwraca produkt
unsigned long long produkt(long long *number, long long *N, long long *primeNumber);
void conversion(long long *modulo, long long *N, long long *num);
long long toInt(long long *number, long long *N, long long *pro);

// ZAKLADAM ZE TYLKO DLA DODATNICH
// potencjal wyjebania:
// W produkt petla smol. Czemu? Byc moze indeksy s i k beda wychodzic poza zakres
int main(){
    long long fi = 203;
    long long *chosen = &fi;
    unsigned long long pro = produkt(chosen, N, primeNumber);
    conversion(first, N, chosen);
    long long *ptr = &pro;
    int a = toInt(first, N, ptr);
    // // toINT
    // unsigned long long sum = 0;
    // for(int i = 0; N[i] != 0; i++){
    //     // okreslanie wagi pozycji
    //     // produkt /= N[i]
    //     int kek = pro / N[i];
    //     // czy kek % N[i] == 1
    //     if (kek % N[i] == 1){
    //         sum += kek * first[i];
    //         continue;
    //     }
    //     else {
    //         //
    //         for(int bruh = 2; bruh <= N[i]; bruh++){
    //             int kek = pro / N[i];
    //             kek *= bruh;
    //             if(kek % N[i] == 1){
    //                 sum += kek * first[i];
    //                 continue; // bruh++
    //             }
    //         }            
    //     }
    // }
    
    printf("FAFA %d\n", a);

}