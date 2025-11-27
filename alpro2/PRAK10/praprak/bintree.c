#include "bintree.h"
#include <stdio.h>
#include <stdlib.h>

BinTree NewTree(ElType root, BinTree left_tree, BinTree right_tree) {
    Address p = newTreeNode(root);
    if (p != NULL) {
        LEFT(p) = left_tree;
        RIGHT(p) = right_tree;
    }
    return p;
}

void CreateTree(ElType root, BinTree left_tree, BinTree right_tree, BinTree *p) {
    *p = NewTree(root, left_tree, right_tree);
}

Address newTreeNode(ElType val) {
    Address p = (Address)malloc(sizeof(TreeNode));
    if (p != NULL) {
        ROOT(p) = val;
        LEFT(p) = NULL;
        RIGHT(p) = NULL;
    }
    return p;
}

void deallocTreeNode(Address p) {
    free(p);
}

boolean isTreeEmpty(BinTree p) {
    return (p == NULL);
}

boolean isOneElmt(BinTree p) {
    return (!isTreeEmpty(p) && LEFT(p) == NULL && RIGHT(p) == NULL);
}

boolean isUnerLeft(BinTree p) {
    return (!isTreeEmpty(p) && LEFT(p) != NULL && RIGHT(p) == NULL);
}

boolean isUnerRight(BinTree p) {
    return (!isTreeEmpty(p) && LEFT(p) == NULL && RIGHT(p) != NULL);
}

boolean isBinary(BinTree p) {
    return (!isTreeEmpty(p) && LEFT(p) != NULL && RIGHT(p) != NULL);
}

void printPreorder(BinTree p) {
    if (isTreeEmpty(p)) {
        printf("()");
    } else {
        printf("(");
        printf("%d", ROOT(p));
        printPreorder(LEFT(p));
        printPreorder(RIGHT(p));
        printf(")");
    }
}

void printInorder(BinTree p) {
    if (isTreeEmpty(p)) {
        printf("()");
    } else {
        printf("(");
        printInorder(LEFT(p));
        printf("%d", ROOT(p));
        printInorder(RIGHT(p));
        printf(")");
    }
}

void printPostorder(BinTree p) {
    if (isTreeEmpty(p)) {
        printf("()");
    } else {
        printf("(");
        printPostorder(LEFT(p));
        printPostorder(RIGHT(p));
        printf("%d", ROOT(p));
        printf(")");
    }
}

static void printTreeRecursive(BinTree p, int current_indent, int step) {
    if (!isTreeEmpty(p)) {
        for (int i = 0; i < current_indent; i++) {
            printf(" ");
        }
        printf("%d\n", ROOT(p));
        printTreeRecursive(LEFT(p), current_indent + step, step);
        printTreeRecursive(RIGHT(p), current_indent + step, step);
    }
}

void printTree(BinTree p, int h) {
    printTreeRecursive(p, 0, h);
}