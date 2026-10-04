#include <stdio.h>
#include <math.h>

int main() {
    double Y = 0.0;
    for (double x = 1.0; x <= 2.05; x += 0.1) {
        Y += sin(x);
    }
    printf("Y = %lf\n", Y);
    return 0;
}
