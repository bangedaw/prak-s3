#include <stdio.h>

long long countComb(int n) {
	// base case
	if (n == 0) return 0;
	if (n == 1) return 1;

	long long total = 0;

	for (int i = 0; i < n; i++) {
		long long left = countComb(i);
		long long right = countComb(n - 1 - i);

		if (left == 0) left = 1;
		if (right == 0) right = 1;

		total += left * right;
	}
	return total;
}

int main() {
    int n;
    scanf("%d", &n);
    printf("%d\n", countComb(n));
    return 0;
}