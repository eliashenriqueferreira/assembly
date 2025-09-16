ASM=nasm
ASMFLAGS=-f elf32
LD=ld
LDFLAGS=-m elf_i386

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

prog.exe: prog.o
	$(LD) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o prog.exe

.PHONY: clean

