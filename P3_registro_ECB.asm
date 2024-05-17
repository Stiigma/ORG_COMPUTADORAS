section .data
    numero1 dd 5
    numero2 dd 7
    resultado dd 0

section .text
    global _start

_start:
    mov eax, numero1  ; Mueve el valor de numero1 al registro eax
    add eax, numero2  ; Suma el valor de numero2 al contenido de eax
    mov resultado, eax  ; Almacena el resultado de la suma en la variable resultado
