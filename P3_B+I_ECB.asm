section .data
    numero1 dd 5
    numero2 dd 7
    resultado dd 0

section .text
    global _start

_start:
    mov eax, [numero1]
    add eax, [numero2]
    mov [resultado], eax

    ; Usando direccionamiento de base más índice
    mov eax, resultado
    mov ebx, numero1
    mov ecx, numero2
    add [eax + ebx], dword [eax + ecx]

    mov eax, 1
    xor ebx, ebx
    int 0x80


