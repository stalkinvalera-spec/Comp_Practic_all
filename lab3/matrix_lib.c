#include <stdio.h>
#include <stdlib.h>
#include "lib_api.h"

#define ROWS 7
#define COLS 10

static int count_div7(int m[ROWS][COLS])
{
    int i, j, count = 0;

    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            if (m[i][j] % 7 == 0)
                count++;
        }
    }
    return count;
}

EXPORT void run(void)
{
    int r[ROWS][COLS];
    int i, j;

    for (i = 0; i < ROWS; i++)
        for (j = 0; j < COLS; j++)
            r[i][j] = rand() % 101 - 50;

    printf("Матрица R (%dx%d):\n", ROWS, COLS);
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++)
            printf("%4d", r[i][j]);
        printf("\n");
    }

    printf("Элементов, кратных 7: %d\n", count_div7(r));
}
