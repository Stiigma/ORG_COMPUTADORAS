section .data
    numero1 dd 5
    numero2 dd 7
    resultado dd 0

section .text
    global _start

_start:
    mov eax, numero1  ; Mueve la dirección de memoria de numero1 a eax
    mov ebx, [eax]    ; Accede al valor almacenado en la dirección apuntada por eax (registro indirecto)
    mov eax, numero2  ; Mueve la dirección de memoria de numero2 a eax
    add ebx, [eax]    ; Suma el valor almacenado en la dirección apuntada por eax al contenido de ebx
    mov eax, resultado  ; Mueve la dirección de memoria de resultado a eax
    mov [eax], ebx    ; Almacena el contenido de ebx en la dirección apuntada por eax (registro indirecto)

