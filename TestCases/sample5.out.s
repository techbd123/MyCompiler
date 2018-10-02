### MIPS CODE ###
	.text
main:
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  jal Input_Integer
  addiu $sp $sp 0
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  sw $v0 x

  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  jal Input_Integer
  addiu $sp $sp 0
  lw $t2 4($sp)
  sw $t2 y
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  sw $v0 y

  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 z
  sw $t2 0($sp)
  addiu $sp $sp -4
  jal Input_Integer
  addiu $sp $sp 0
  lw $t2 4($sp)
  sw $t2 z
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  sw $v0 z

  lw $a0 x
  sw $a0 4($gp)
  lw $a0 y
  sw $a0 8($gp)
  lw $a0 z
  sw $a0 12($gp)
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 z
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 8($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 12($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal myfunc
  addiu $sp $sp 12
  lw $t2 4($sp)
  sw $t2 value
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 z
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  sw $v0 value

  lw $a0 value
  sw $a0 4($gp)
  la $a0 newline
  sw $a0 8($gp)
  lw $a0 4($gp)
  jal Print_Integer
  lw $a0 8($gp)
  jal Print_String

  b Exit

	.text
myfunc:
  sw $fp 0($sp)
  addiu $sp $sp -4
  sw $ra 0($sp)
  addiu $sp $sp -4

  la $fp 8($sp)

  lw $t1 z
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 4($fp)
  sw $a0 z

  lw $t1 y
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 8($fp)
  sw $a0 y

  lw $t1 x
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 12($fp)
  sw $a0 x

  lw $a0 x
  li $t1 0
  sge $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L0
  b L1
L0:
  lw $a0 x
  lw $t1 y
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 z
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 8($gp)
  sw $a0 m

  b L2
L1:
L2:

  lw $a0 m
  sw $a0 4($gp)
  lw $v0 4($gp)

  lw $a0 4($sp)
  sw $a0 x
  addiu $sp $sp 4

  lw $a0 4($sp)
  sw $a0 y
  addiu $sp $sp 4

  lw $a0 4($sp)
  sw $a0 z
  addiu $sp $sp 4

  lw $ra 4($sp)
  addiu $sp $sp 4
  lw $fp 4($sp)
  addiu $sp $sp 4
  jr $ra

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
z:				.word 		0
value:				.word 		0
newline:		.asciiz 	"\n"
m:				.word 		0

# PARSING SUCCESS!
