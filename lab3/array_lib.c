#include <stdio.h>
#include <stdlib.h>
#include "lib_api.h"

#define N 73

static int count_div7(const int *a, int n)
{
    int count = 0;

    for (int i = 0; i < n; i++) {
        if (a[i] % 7 == 0)
            count++;            
    }
    return count;
}

EXPORT void run(void)
{
    int k[N];
    int i;

    for (i = 0; i < N; i++)
        k[i] = rand() % 101 - 50;

    printf("Массив K (%d элементов):\n", N);

    for (i = 0; i < N; i++) {

        printf("%4d", k[i]);

        if ((i + 1) % 10 == 0)
            printf("\n");
    }
    printf("\n");

    printf("Элементов, кратных 7: %d\n", count_div7(k, N));
}
