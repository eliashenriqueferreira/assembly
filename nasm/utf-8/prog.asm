section .data
    msg db 0x09, '-', 0x09, 'Olá, Mundo!', 0x09, '-', 0x0a, 0  ; tabtab Ola e CR. Será que consegue entender utf-8 ?
    len equ $ - msg            		; Calcula o tamanho da string

section .text
    global _start

_start:
    ; Escrever na tela
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg        ; endereço da mensagem
    mov edx, len        ; tamanho da mensagem
    int 0x80            ; chamada do kernel

    ; Sair do programa
    mov eax, 1          ; sys_exit
    mov ebx, 0          ; código de retorno
    int 0x80

