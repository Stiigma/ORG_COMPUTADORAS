section .data
    mensaje db 'Eduardo Castro', 0

section .text
    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, 11
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80