#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Función para convertir un número binario representado como cadena de caracteres en un entero decimal
int binario_a_decimal(char *binario) {
    int longitud = strlen(binario);
    int decimal = 0;

    for (int i = 0; i < longitud; i++) {
        // Multiplica el valor actual por la potencia de 2 correspondiente
        // y lo suma al valor acumulado
        decimal = decimal * 2 + (binario[i] - '0');
    }

    return decimal;
}

// Función para convertir un número decimal en binario
char* decimal_a_binario(int decimal) {
    // Reservar espacio suficiente para el resultado, como máximo será de 32 bits
    char *binario = (char *)malloc(33 * sizeof(char));
    int indice = 0;

    // Convierte el número decimal en binario
    while (decimal > 0) {
        // Obtén el dígito binario correspondiente al resto de la división por 2
        binario[indice++] = (decimal % 2) + '0';
        // Divide el número decimal por 2
        decimal /= 2;
    }

    // Si no se ha añadido ningún dígito, el número es 0
    if (indice == 0)
        binario[indice++] = '0';

    // Agrega el terminador de cadena
    binario[indice] = '\0';

    // Invierte la cadena para obtener la representación correcta
    for (int i = 0; i < indice / 2; i++) {
        char temp = binario[i];
        binario[i] = binario[indice - i - 1];
        binario[indice - i - 1] = temp;
    }

    return binario;
}

// Función para sumar dos números binarios
char* sumar_binarios(char *binario1, char *binario2) {
    int decimal1 = binario_a_decimal(binario1);
    int decimal2 = binario_a_decimal(binario2);
    int suma = decimal1 + decimal2;
    return decimal_a_binario(suma);
}

// Función para restar dos números binarios
char* restar_binarios(char *binario1, char *binario2) {
    int decimal1 = binario_a_decimal(binario1);
    int decimal2 = binario_a_decimal(binario2);
    int resta = decimal1 - decimal2;
    return decimal_a_binario(resta);
}

// Función para multiplicar dos números binarios
char* multiplicar_binarios(char *binario1, char *binario2) {
    int decimal1 = binario_a_decimal(binario1);
    int decimal2 = binario_a_decimal(binario2);
    int producto = decimal1 * decimal2;
    return decimal_a_binario(producto);
}

// Función para dividir dos números binarios
char* dividir_binarios(char *binario1, char *binario2) {
    int decimal1 = binario_a_decimal(binario1);
    int decimal2 = binario_a_decimal(binario2);
    // Comprueba si el divisor es 0 para evitar la división por cero
    if (decimal2 == 0) {
        printf("Error: No se puede dividir por cero.\n");
        exit(EXIT_FAILURE);
    }
    int division = decimal1 / decimal2;
    return decimal_a_binario(division);
}

int main() {
    char binario1[33], binario2[33];
    printf("Introduce dos números binarios (máximo 32 bits cada uno): ");
    scanf("%s %s", binario1, binario2);

    // Suma
    char *resultado_suma = sumar_binarios(binario1, binario2);
    printf("Suma: %s\n", resultado_suma);
    free(resultado_suma);

    // Resta
    char *resultado_resta = restar_binarios(binario1, binario2);
    printf("Resta: %s\n", resultado_resta);
    free(resultado_resta);

    // Multiplicación
    char *resultado_multiplicacion = multiplicar_binarios(binario1, binario2);
    printf("Multiplicación: %s\n", resultado_multiplicacion);
    free(resultado_multiplicacion);

    // División
    char *resultado_division = dividir_binarios(binario1, binario2);
    printf("División: %s\n", resultado_division);
    free(resultado_division);

    return 0;
}
