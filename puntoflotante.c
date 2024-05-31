#include <stdio.h>
#include <stdint.h>

// Función para sumar dos números binarios en punto flotante
uint32_t sumar_binarios(uint32_t a, uint32_t b) {
    return a + b;
}

// Función para restar dos números binarios en punto flotante
uint32_t restar_binarios(uint32_t a, uint32_t b) {
    return a - b;
}

int main() {
    uint32_t num1, num2;

    // Solicitar al usuario que ingrese los dos números binarios en punto flotante
    printf("Ingrese el primer número binario en punto flotante (en formato hexadecimal): ");
    scanf("%x", &num1);

    printf("Ingrese el segundo número binario en punto flotante (en formato hexadecimal): ");
    scanf("%x", &num2);

    // Realizar la suma
    uint32_t suma = sumar_binarios(num1, num2);
    printf("Suma en binario: %08x\n", suma);

    // Realizar la resta
    uint32_t resta = restar_binarios(num1, num2);
    printf("Resta en binario: %08x\n", resta);

    return 0;
}
