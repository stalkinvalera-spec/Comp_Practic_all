#include <stdio.h>
#include <string.h>
#include "lib_for_lab2.h"

void swap_edges(char *s, int n)
{
    int i, len;
    char t;

    len = (int)strlen(s);
    for (i = 0; i < n; i++) {
        t = s[i];
        s[i] = s[len - n + i];
        s[len - n + i] = t;
    }
}

int main(void)
{
    char str[MAX_LEN];
    char buf[MAX_LEN];
    int n = 0;

    printf("Введите строку:\n");
    input_string(str, MAX_LEN);

    printf("Введите N:\n");
    input_string(buf, MAX_LEN);
    if (sscanf(buf, "%d", &n) != 1 || n < 0) {
        printf("Ошибка: N должно быть неотрицательным целым числом\n");
        return 1;
    }
    if (2 * n > (int)strlen(str)) {
        printf("Ошибка: 2*N больше длины строки (%d)\n", (int)strlen(str));
        return 1;
    }

    swap_edges(str, n);

    printf("Результат:\n");
    output_string(str);
    return 0;
}
