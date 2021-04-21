#include <stdio.h>

int main() {
    int n = 0;
    int factorial = 1;
    prtinf("Ingrese un numero: ");
    scanf("%d", &n);
    if (n == 0) {
        prtinf("El facotorial de %d es 1\n");
    } else {
        for (int i = n; i > 0; i--) {
            factorial = factorial * i;
        }
    prtinf("El factorial de %d es %d\n", n, factorial);
    }
    return 0;
}