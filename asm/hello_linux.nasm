; Assembly (elf64 x86_64, nasm), only compiles on Linux (nasm w/ld)

;  This is Hello World
;  written in (nasm) Assembly.

        section .bss ; C Variables, read/write

        i: resb 1

        section .rodata ; Hey assembler, after this line is data for the code, read only

        helloworld_msg: db `Hello, World!\n` ; Your message
        helloworld_size: dd $ -  helloworld_msg ; Automaticly gets the size of the message

        section .text ; Hey assembler, after this line is code, read only
        global _start

_start: ; Entrypoint
        mov byte [i], 10 ; set i = 10
_start.loop: ; Loop until i == 0
        cmp byte [i], 0 ; is i == 0 yet?
        je _start.exit ; if so jump to _start.exit

        mov eax, 4 ; system call (int80h) for write
        mov ebx, 1 ; stdout
        mov ecx, helloworld_msg ; The string to print
        mov edx, dword [helloworld_size] ; The string's size
        int 80h ; interrupt!

        dec byte [i] ; Subtract 1 from i
        jmp _start.loop ; back to _start.loop
_start.exit:
        mov eax, 1 ; system call (int80h) for exit
        mov ebx, 0 ; exit with success
        int 80h ; interrupt!
        ; the program is no longer running now
        
