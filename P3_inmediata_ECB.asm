section .data
    numero1 dd 5
    numero2 dd 7
    resultado dd 0

section .text
    global _start

_start:
    mov eax, 5  ; Mueve el valor inmediato 5 al registro eax
    add eax, 7  ; Suma el valor inmediato 7 al contenido de eax
    mov resultado, eax  ; Almacena el resultado de la suma en la variable resultado
