# Assembly (macos x86_64, gas), only compiles on MacOS (using gcc, cstdlib required)

/*
  This is Hello World
  written in Assembly.
*/

        .globl  _main

_main:
        # Initialize stack:
        pushq   %rbp                    # save previous rbp
        movq    %rsp, %rbp              # store rsp as rbp
        subq    $16, %rsp               # reserve 16 bytes of stack

        # Initialize local variables:
        movl    $0, -4(%rbp)            # int i = 0

loop:
        # Print the "Hello, World!" message:
        movl    $1, %edi                # 1 = stdout
        leaq    message(%rip), %rsi     # address of message
        movl    message_size(%rip), %edx # length of message
        callq   _write                  # call _write syscall

        # Increment i, check if i < 10, jump to "loop" if so:
        addl    $1, -4(%rbp)            # add 1 to i
        cmpl    $10, -4(%rbp)           # compare i to 10
        jl      loop                    # jump if less than 10

        # Return from main():
        movl    $0, %eax                # return code = 0
        addq    $16, %rsp               # un-reserve stack
        popq    %rbp                    # restore previous rbp
        retq

message: .asciz  "Hello, World!\n"
message_size: .long 14 # TODO Hardcoded because i dont know what im doing
