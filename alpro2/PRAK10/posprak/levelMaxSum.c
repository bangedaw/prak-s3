/* =======================================================
* File: problem.c
* Deskripsi:
*   Implementasi fungsi untuk mencari level pada binary tree
*   yang memiliki jumlah nilai node (sum) terbesar.
*
*   Level dari root adalah 1, level anak-anaknya adalah 2, dan seterusnya.
*   Jika ada lebih dari satu level dengan sum maksimal yang sama,
*   kembalikan level terkecil (paling atas).
*
* ======================================================= */

#include <stdio.h>
#include <stdlib.h>
#include "bintree.h"   /* Asumsikan ADT bintree sudah disediakan */
#define TreeNode treeNode

/* =======================================================
* Fungsi Utama: levelMaxSum
* =======================================================
*
* Deskripsi:
*   Mengembalikan level dengan jumlah nilai node (sum) terbesar
*   dari sebuah binary tree.
*
* Spesifikasi:
*   I.S.  : root terdefinisi (mungkin NULL)
*   F.S.  : Mengembalikan nilai level (integer >= 1)
*           dengan sum tertinggi.

* Catatan:
*   - Jumlah node n ∈ [1, 10^4].
*   - Nilai node ∈ [-10^5, 10^5].
*   - Jika ada lebih dari satu level dengan sum maksimal yang sama,
*     kembalikan level terkecil (paling atas).
*/

/* =======================================================
* ----------------------- CONTOH 1 ------------------------
* =========================================================
* Misal pohon terbentuk:
*
*           (1)
*          /   \
*        (7)   (0)
*       /  \
*     (7)  (-8)
*
* Level 1 → sum = 1
* Level 2 → sum = 7 + 0 = 7
* Level 3 → sum = 7 + (-8) = -1
*
* Hasil: level 2 (7 adalah sum tertinggi)
* Output : 2
* ======================================================= */

/*
* ----------------------- CONTOH 2 ------------------------
* Misal pohon 2:
*
*              (989)
*                 \
*                (10250)
*               /      \
*           (98693)   (-89388)
*                      \
*                      (-32127)
*
* Level 1 → sum = 989
* Level 2 → sum = 10250
* Level 3 → sum = 98693 + (-89388) = 929305
* Level 4 → sum = -32127
*
* Jadi level dengan jumlah terbesar adalah level 2 (sum = 10250)
* Output  : 2
* --------------------------------------------------------
*/


void calculateLevelSums(BinTree p, int level, int sums[], int *maxLevel) {
if (isTreeEmpty(p)) return;

sums[level] += ROOT(p);
if (level > *maxLevel) {
    *maxLevel = level;
}

calculateLevelSums(LEFT(p), level + 1, sums, maxLevel);
calculateLevelSums(RIGHT(p), level + 1, sums, maxLevel);
}

int levelMaxSum(struct TreeNode* root) {
if (root == NULL) return 0;

/* Asumsi maksimum level tidak melebihi jumlah node (10^4) */
/* Menggunakan static array agar aman dari stack overflow jika recursive depth tinggi, 
    tapi di sini array lokal di stack main/function call. 
    Size 20000 integer = 80KB, aman untuk stack default. */
int sums[20000] = {0}; 
int maxLevel = 0;

calculateLevelSums(root, 1, sums, &maxLevel);

int maxSum = sums[1];
int bestLevel = 1;

int i;
for (i = 2; i <= maxLevel; i++) {
    if (sums[i] > maxSum) {
        maxSum = sums[i];
        bestLevel = i;
    }
}

return bestLevel;
}