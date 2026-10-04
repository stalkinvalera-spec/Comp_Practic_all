#include <stdio.h>
#include "arr_utils.h"

int main() {
    int B[18];
    read_array(B, 18);
    swap_first_last_negative(B, 18);
    print_array(B, 18);

    return 0;
}
