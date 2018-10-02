### MIPS CODE ###
	.text
main:
L0:
  lw $a0 x
  lw $t1 y
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L1
  lw $a0 x
  li $t1 7
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 x

  b L0
L1:

  b Exit

####EXTRA####

Print_Integer:
# LOAD INTEGER VALUE IN $a0
  li $v0 1
  syscall
  jr $ra

Print_String:
# LOAD STRING ADDRESS IN $a0
  li $v0 4
  syscall
  jr $ra

Input_Integer:
  li $v0 5
  syscall
# INPUT INTEGER WILL BE PLACED IN $v0
  jr $ra

Exit:
  li $v0 10
  syscall

####EXTRA####

	.data
x:				.word 		0
y:				.word 		0

# PARSING SUCCESS!
