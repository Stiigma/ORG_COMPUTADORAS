#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Función para invertir los bits de un número binario
void invertir_bits(char *binario) {
    int longitud = strlen(binario);

    // Recorre todos los bits del número binario
    for (int i = 0; i < longitud; i++) {
        // Si el bit es '0', cámbialo a '1', y viceversa
        if (binario[i] == '0')
            binario[i] = '1';
        else
            binario[i] = '0';
    }
}

// Función para sumar 1 a un número binario
void sumar_uno(char *binario) {
    int carry = 1;
    int longitud = strlen(binario);

    // Recorre los bits desde el último hacia el primero
    for (int i = longitud - 1; i >= 0; i--) {
        // Suma el valor del bit con el carry
        int suma = (binario[i] - '0') + carry;
        
        // Actualiza el bit y el carry
        binario[i] = (suma % 2) + '0';
        carry = suma / 2;
    }
}

// Función para convertir un número binario a su complemento a dos
char* complemento_a_dos(char *binario) {
    int longitud = strlen(binario);

    // Reserva espacio suficiente para almacenar el resultado
    char *complemento = (char *)malloc((longitud + 1) * sizeof(char));

    // Copia el número binario original al complemento
    strcpy(complemento, binario);

    // Invierte los bits del complemento
    invertir_bits(complemento);

    // Suma 1 al complemento invertido
    sumar_uno(complemento);

    return complemento;
}

int main() {
    char binario[33];
    printf("Introduce un número binario (máximo 32 bits): ");
    scanf("%s", binario);

    // Obtiene el complemento a dos del número binario ingresado
    char *complemento = complemento_a_dos(binario);

    // Imprime el complemento a dos
    printf("El complemento a dos de %s es: %s\n", binario, complemento);

    // Libera la memoria asignada
    free(complemento);

    return 0;
}
