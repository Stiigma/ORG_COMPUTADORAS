section .data
    msg_greater db "El número es mayor o igual a 22", 0xA  ; Mensaje para números mayores o iguales a 22
    len_msg_greater equ $ - msg_greater  ; Longitud del mensaje

    msg_lower db "El número es menor a 22", 0xA ; Mensaje para números menores a 22
    len_msg_lower equ $ - msg_lower ; Longitud del mensaje

section .bss
    number resd 1  ; Reserva espacio para almacenar un número (4 bytes)

%macro imprimir_mensaje 2 ; Macro para imprimir un mensaje
    mov eax, 4  ; Llamada al sistema para escribir en la salida estándar
    mov ebx, 1   ; Descriptor de archivo: salida estándar (stdout)
    mov ecx, %1 ; Dirección del mensaje
    mov edx, %2 ; Longitud del mensaje
    int 0x80  ; Realizar la llamada al sistema
%endmacro

section .text
    global _start

_start:
    mov dword [number], 15 ; Almacena el valor 15 en la ubicación de memoria reservada para 'number'

    mov eax, dword [number]  ; Mueve el valor almacenado en 'number' a eax
    cmp eax, 22  ; Compara el valor con 22
    jl less_than_22 ; Salta a 'less_than_22' si el valor es menor a 22
    jge greater_than_or_equal ; Salta a 'greater_than_or_equal' si el valor es mayor o igual a 22

less_than_22:
    ; Si el número es menor a 22
    imprimir_mensaje msg_lower, len_msg_lower  ; Llama al macro para imprimir el mensaje de número menor a 22
    jmp end_if_else   ; Salta al final del bloque 'if/else'

greater_than_or_equal:
    ; Si el número es mayor o igual a 22
    imprimir_mensaje msg_greater, len_msg_greater  ; Llama al macro para imprimir el mensaje de número mayor o igual a 22

end_if_else:
    mov eax, 1  ; Llamada al sistema para salir del programa
    xor ebx, ebx   ; Código de retorno (0)
    int 0x80  ; Realizar la llamada al sistema
