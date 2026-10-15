#include <stdio.h>
#include <string.h>

void input_string(char *s, int max)
{
    if (fgets(s, max, stdin) == NULL) {
        s[0] = '\0';
        return;
    }
    s[strcspn(s, "\r\n")] = '\0';
}

void output_string(const char *s)
{
    printf("%s\n", s);
}
