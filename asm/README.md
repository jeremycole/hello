# Assembly

Extra complicated, but also operating system specific, because assembly is like that.  
hello_macos.s: developed on a Mac, unlikely to compile on other platforms. (didn't compile on linux D: )  
hello_macos.nasm: hello.s copied to an 'easier to understand' assembler  
hello_linux.nasm: hello.nasm, except for linux.

## Compiling them

### Linux

```bash
nasm -f elf64 hello_linux.nasm
ld hello_linux.o -o hello
./hello
```

### MacOS

#### gas assembly version

```bash
gcc hello_macos.s -o hello
./hello
```

#### nasm assembly version

```bash
nasm -f macho64 hello_macos.nasm
ld hello_macos.o -o hello
./hello
```
