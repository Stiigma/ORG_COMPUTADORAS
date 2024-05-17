section .data
    msg_greater db "El número es mayor o igual a 10", 0xA  ; Mensaje para números mayores o iguales a 10
    len_msg_greater equ $ - msg_greater ; Longitud del mensaje

    msg_lower db "El número es menor a 10", 0xA ; Mensaje para números menores a 10
    len_msg_lower equ $ - msg_lower  ; Longitud del mensaje

section .bss
    number resd 1 ; Reserva espacio para almacenar un número (4 bytes)

section .text
    global _start

_start:
    mov dword [number], 7; Almacena el valor 7 en la ubicación de memoria reservada para 'number'

    mov eax, dword [number] ; Mueve el valor almacenado en 'number' a eax
    cmp eax, 10 ; Compara el valor de eax con 10
    jl less_than_10 ; Salta a 'less_than_10' si el valor es menor a 10
    jge greater_than_or_equal ; Salta a 'greater_than_or_equal' si el valor es mayor o igual a 10

less_than_10:
    ; Si el número es menor a 10
    mov eax, 4  ; Cargar la llamada al sistema para escribir en la salida estándar (sys_write)
    mov ebx, 1  ; Descriptor de archivo: salida estándar (stdout)
    mov ecx, msg_lower  ; Dirección del mensaje a escribir (mensaje para números menores a 10)
    mov edx, len_msg_lower ; Longitud del mensaje
    int 0x80   ; Realizar la llamada al sistema
    jmp end_if_else  ; Salta al final del bloque 'if/else'

greater_than_or_equal:
    ; Si el número es mayor o igual a 10
    mov eax, 4  ; Cargar la llamada al sistema para escribir en la salida estándar (sys_write)
    mov ebx, 1   ; Descriptor de archivo: salida estándar (stdout)
    mov ecx, msg_greater ; Dirección del mensaje a escribir (mensaje para números mayores o iguales a 10)
    mov edx, len_msg_greater ; Longitud del mensaje
    int 0x80 ; Realizar la llamada al sistema

end_if_else:
    mov eax, 1  ; Cargar la llamada al sistema para salir del programa (sys_exit)
    xor ebx, ebx   ; Código de retorno (0)
    int 0x80 ; Realizar la llamada al sistema

