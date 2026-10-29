#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "load.h"

#ifdef _WIN32
#include <windows.h>
#define LIB_ARRAY  "array.dll"
#define LIB_MATRIX "matrix.dll"
#else
#define LIB_ARRAY  "./libarray.so"
#define LIB_MATRIX "./libmatrix.so"
#endif

int main(void)
{
    char buf[64];
    int choice = 0;

    srand((unsigned)time(NULL)); 

#ifdef _WIN32 
    SetConsoleCP(CP_UTF8);
    SetConsoleOutputCP(CP_UTF8);
#endif

    for (;;) {
        printf("\nМеню:\n1 - работа с массивом\n2 - работа с матрицей\n3 - выход\nВаш выбор: ");
        if (fgets(buf, sizeof(buf), stdin) == NULL)
            break;
        if (sscanf(buf, "%d", &choice) != 1)
            choice = 0;

        if (choice == 1)
            load_run(LIB_ARRAY);
        else if (choice == 2)
            load_run(LIB_MATRIX);
        else if (choice == 3)
            break;
        else
            printf("Нет такого пункта меню\n");
    }
    return 0;
}
