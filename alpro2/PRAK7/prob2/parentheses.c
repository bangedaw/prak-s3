#include <stdio.h>

int comb(int n, int k){
    if (k == 0){
        return 1;
    } else {
        int temp = comb(n, k-1);
        int a = (n - k + 1);
        int b = k;
        return (temp * a) / b;  
    }
}

int parentheses(int n){
    return comb(2*n, n) / (n + 1);
}

int main(){
    int a;
    scanf("%d", &a);
    printf("%d\n", parentheses(a));
    return 0;
}