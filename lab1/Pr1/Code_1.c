#include <stdio.h>

int main() {
    int N;
    printf("Enter N: ");

    if (scanf("%d", &N) != 1 || N <= 0) {
        printf("0\n");
        return 0;
    }

    double s = 0;
    for (int i = 1; i <= N; i++) {
        double power = 1;
        for (int j = 0; j < i; j++) {
            power *= i;
        }
        s += power;
    }

    printf("Sum = %.0lf\n", s);
    return 0;
}
