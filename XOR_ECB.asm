section .data
    ; Define los valores de 8 bits
    valor1 db 10101010b  ; Primer valor (en binario)
    valor2 db 11001100b  ; Segundo valor (en binario)

section .bss
    ; Reservar espacio para almacenar el resultado
    resultado resb 1  ; Reserva 1 byte para almacenar el resultado

section .text
    global _start

_start:
    ; Cargar los valores en registros
    mov al, [valor1]
    mov bl, [valor2]

    ; Realizar la operación XOR bit a bit
    xor al, bl

    ; Almacenar el resultado en la dirección de memoria reservada
    mov [resultado], al

    ; Finalizar el programa
    mov eax, 1          ; Número de sistema de llamada para 'exit'
    xor ebx, ebx        ; Código de salida 0
    int 0x80            ; Llamada al sistema para salir

