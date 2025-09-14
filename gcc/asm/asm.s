#####################################################
#           AS - the portable GNU assembler.        #
#####################################################
#: Ideal para comentários de uma única linha.
/* : Útil para comentários que se estendem por várias linhas ou para comentar um bloco de código. */
/*
Devemos verificar se a architetura é 64 bits com o comando arch:
{0} CentOS7 root@WSLCENTOS7 ~/srcGit/assembly/gcc/asm  (main)
2025-09-14 19:57:30 $ arch
x86_64
*/

/* Devemos compilar como : "gcc -o asm asm.o -nostdlib" para que não haja comflito com o entry_point do stdlib da linguagem C 
Dependendo da versão do gcc devemos acrescentar a flag -no-pie.
-no-pie --> Don't produce a dynamically linked position independent executable.
*/
.global _start # Assim como todo programa precisamos de um entry_point
.intel_syntax noprefix

_start:				# Definindo o entry_point
	CALL print_hello_world
	JMP exitZero

print_hello_world:
	MOV rax, 0x01 			# código da syscall write
	MOV rdi, 0x01 			# File descriptor para onde será enviado o conteúdo do write. (0-stdin, 1-stdout, 2-stderr)
	LEA rsi, [hello_str]	# Carregamento do endereço de memória da variável que queremos escrever
	MOV rdx, 14				# Tamanho da string
	SYSCALL
	RET
	
exitZero:
	MOV rax, 0x3c		# código 60 do syscall exit
	MOV rdi, 0
	SYSCALL

.section .data 
	hello_str: .asciz "hello, world!\n"


/*
asm.s: Assembler messages:
asm.s:4: Error: too many memory references for `mov'
asm.s:5: Error: too many memory references for `mov'
*/
#.intel_syntax	# Para evitar o erro acima

/*
2025-09-13 11:04:09 $ as asm.s -o asm.o
asm.s: Assembler messages:
asm.s:18: Error: ambiguous operand size for `mov'
asm.s:19: Error: ambiguous operand size for `mov'
*/
#.intel_syntax noprefix 		# Para evitar o erro acima e evitar tambem de ter que colocar o % na frente de cada registrador.

