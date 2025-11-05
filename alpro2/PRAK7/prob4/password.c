#include "password.h"
#include <stdio.h>

int length(int angka) {
    if (angka == 0) return -1;
	int len = 0;

  do {
    angka /= 10;
    ++len;
  } while (angka != 0);

    return len;
}

int getDigit(int angka, int index) {
    int temp = angka;
    int count = 0;
    do {
        temp /= 10;
        count++;
    } while (temp != 0);

    if (index >= count || index < 0) return -1;

    int mod = 1;
    for (int i = 0; i <= index; i++) {
        mod = mod*10;
    }
    return (angka % mod / (mod/10));
}

int removeDigit(int angka, int index) {
    if (index < 0) return angka;

    int i = 0; 
    while (getDigit(angka, i) != -1) {
        if (getDigit(angka, i) == angka) break;
        i++;
    }

    int remainder = 1;
    for (int i = 0; i < index; i++) {
        remainder *= 10;
    }

    int headExp = 1;
    for (int i = 0; i <= index; i++) {
        headExp *= 10;
    }

    int tail = angka % remainder;
    int head = (angka / headExp) * remainder;

    return head + tail;
}

void cariKombinasi(int angka, int current, int panjangAwal) {
	int len = length(angka);
	if (len == -1) {
        printf("%d\n", current);
        return;
    }

	for (int i = 0; i < len; i++) {
        int d = getDigit(angka, i);
        int newAngka = removeDigit(angka, i);
        int newCurrent = current * 10 + d;
        cariKombinasi(newAngka, newCurrent, panjangAwal);
    }
}

void findPassword(int angka) {
    int len = length(angka);
    cariKombinasi(angka, 0, len);
}