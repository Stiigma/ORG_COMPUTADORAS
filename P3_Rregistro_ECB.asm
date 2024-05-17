section .data
    numero1 dd 5
    numero2 dd 7
    resultado dd 0

section .text
    global _start

_start:
    ; Usando direccionamiento relativo a registro
    mov ebx, numero1        ; Cargamos la dirección de numero1 en ebx
    mov ecx, numero2        ; Cargamos la dirección de numero2 en ecx
    add [ebx], ecx          ; Sumamos el valor de numero2 al contenido apuntado por ebx (numero1)
    mov eax, [ebx]          ; Movemos el resultado a eax
    mov [resultado], eax    ; Almacenamos el resultado en resultado


    ; Salida del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80



