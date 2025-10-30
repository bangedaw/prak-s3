#include <stdio.h>

// n = 4 -> 5
// n = 5 -> 7
// n = 6 -> 12


int ukurLantai(int n){
    if(n < 4){
        return n;
    } else if(n == 4 || n == 5){
        return n + ukurLantai(n - 3);
    } else {
        return ukurLantai(n - 2) + ukurLantai(n - 1);
    }
}

int main() {
    int n;
    scanf("%d", &n);
    printf("%d\n", ukurLantai(n));
    return 0;
}