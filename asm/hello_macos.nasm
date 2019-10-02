; Assembly (macos x86_64, nasm), only compiles on MacOS (nasm w/gcc, cstdlib required)

;  This is Hello World
;  written in (nasm) Assembly.

        global  _main
        extern  _write

_main:
        ; Initialize stack:
        push    rbp                   ; save previous rbp
        mov     rbp, rsp              ; store rsp as rbp
        sub     rsp, 16               ; reserve 16 bytes of stack

        ; Initialize local variables:
        mov     byte [rbp-4], 0       ; int i = 0

loop:
        ; Print the "Hello, World!" message:
        mov    edi, 1                   ; 1 = stdout
        mov    rsi, message             ; address of message
        mov    edx, dword [message_size]; length of message
        call   _write                   ; call _write syscall

        ; Increment i, check if i < 10, jump to "loop" if so:
        add    byte [rbp-4], 1         ; add 1 to i
        cmp    byte [rbp-4], 10        ; compare i to 10
        jl     loop                    ; jump if less than 10

        ; Return from main():
        mov     eax, 0                  ; return code = 0
        add     rsp, 16                 ; un-reserve stack
        pop     rbp                     ; restore previous rbp
        ret

message: db `Hello, World!\n` ; 'backticks allow \n, double quotes do not' -Liam
message_size: dd $ - message  ; Automaticery
