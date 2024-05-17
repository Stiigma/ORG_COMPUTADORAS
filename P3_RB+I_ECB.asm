section .data 
    numero1 dd 5
    numero2 dd 7
    resultado dd 0

section .text
    global _start

_start:
    ; Cargar la dirección base de numero1 en ebx
    mov ebx, offset numero1

    ; Cargar el contenido de numero1 en eax usando direccionamiento relativo a base
    mov eax, [ebx]

    ; Sumar el contenido de numero2 a eax usando direccionamiento relativo a base más índice
    add eax, [ebx + offset numero2 - offset numero1]

    ; Guardar el resultado en la dirección de memoria de resultado usando direccionamiento relativo a base
    mov [ebx + offset resultado - offset numero1], eax

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80


