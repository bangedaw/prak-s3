/* File : listlinier.h */
/* contoh ADT list berkait dengan representasi fisik pointer  */
/* Representasi address dengan pointer */
/* ElType adalah integer */

#ifndef listlinier_H
#define listlinier_H

#include "boolean.h"

/* Definisi Node : */
typedef int ElType;
typedef struct node *Address;
typedef struct node
{
  ElType info;
  Address next;
} Node;

#define INFO(p) (p)->info
#define NEXT(p) (p)->next

Address newNode(ElType val);

/* Definisi List : */
/* List kosong : FIRST(l) = NULL */
/* Setiap elemen dengan Address p dapat diacu INFO(p), NEXT(p) */
/* Elemen terakhir list: jika addressnya Last, maka NEXT(Last)=NULL */

typedef Address List;

#define IDX_UNDEF (-1)
#define FIRST(l) (l)

/****************** PEMBUATAN LIST KOSONG ******************/
void CreateList(List *l);
/* I.S. sembarang             */
/* F.S. Terbentuk list kosong */

/****************** PROSES SEMUA ELEMEN LIST ******************/
void displayList(List l);
// void printInfo(List l);
/* I.S. List mungkin kosong */
/* F.S. Jika list tidak kosong, iai list dicetak ke kanan: [e1,e2,...,en] */
/* Contoh : jika ada tiga elemen bernilai 1, 20, 30 akan dicetak: [1,20,30] */
/* Jika list kosong : menulis [] */
/* Tidak ada tambahan karakter apa pun di awal, akhir, atau di tengah */


#endif
