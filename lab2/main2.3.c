#include <stdio.h>
#include <string.h>
#include "lib_for_lab2.h"

int is_hex(const char *s)
{
    int i;

    if (s[0] == '\0')
        return 0;
    for (i = 0; s[i] != '\0'; i++) {
        if (!((s[i] >= '0' && s[i] <= '9') ||
              (s[i] >= 'A' && s[i] <= 'F') ||
              (s[i] >= 'a' && s[i] <= 'f')))
            return 0;
    }
    return 1;
}

int main(void)
{
    char str[MAX_LEN];

    printf("Введите строку (буквы и цифры):\n");
    input_string(str, MAX_LEN);

    if (is_hex(str))
        output_string("Да, это число в шестнадцатеричной системе");
    else
        output_string("Нет, это не шестнадцатеричное число");
    return 0;
}
