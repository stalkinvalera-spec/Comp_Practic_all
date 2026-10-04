#include <stdio.h>
#include "arr_utils.h"

int main() {
    int M[20];
    read_array(M, 20);

    if (check_permutation_1_to_20(M, 20)) printf("YES\n"); 
    
    else printf("NO\n");

    return 0;
}
