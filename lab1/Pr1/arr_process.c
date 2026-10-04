// Для Задания 2
void swap_first_last_negative(int B[], int size) {
    int f = -1, l = -1;

    for (int i = 0; i < size; i++) {
        if (B[i] < 0) {
            if (f == -1) f = i; 
            l = i;              
        }
    }

    if (f != -1 && l != -1) {
        int temp = B[f];
        B[f] = B[l];
        B[l] = temp;
    }
}

// Для Задания 3
int check_permutation_1_to_20(const int M[], int size) {
    int used[21] = {0};

    for (int i = 0; i < size; i++) {
        if (M[i] < 1 || M[i] > size || used[M[i]]) {
            return 0; 
        }
        used[M[i]] = 1;
    }
    return 1; 
}