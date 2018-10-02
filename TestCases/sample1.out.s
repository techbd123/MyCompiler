### MIPS CODE ###
	.text
Add:
  sw $fp 0($sp)
  addiu $sp $sp -4
  sw $ra 0($sp)
  addiu $sp $sp -4

  la $fp 8($sp)

  lw $t1 y
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 4($fp)
  sw $a0 y

  lw $t1 x
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 8($fp)
  sw $a0 x

  lw $a0 x
  lw $t1 y
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 c

  lw $a0 c
  sw $a0 4($gp)
  lw $v0 4($gp)

  lw $a0 4($sp)
  sw $a0 x
  addiu $sp $sp 4

  lw $a0 4($sp)
  sw $a0 y
  addiu $sp $sp 4

  lw $ra 4($sp)
  addiu $sp $sp 4
  lw $fp 4($sp)
  addiu $sp $sp 4
  jr $ra

	.text
main:
  li $a0 1
  sw $a0 8($gp)
  li $a0 5
  sw $a0 12($gp)
  lw $a0 8($gp)
  sw $a0 x
  lw $a0 12($gp)
  sw $a0 y

  lw $a0 x
  lw $t1 y
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L0
  b L1
L0:
L2:
  lw $a0 x
  lw $t1 y
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L3
  lw $a0 x
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 x

  b L2
L3:

  b L4
L1:
  lw $a0 x
  lw $t1 y
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L5
  b L6
L5:
  lw $a0 y
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 x

  b L4
L6:
L4:

  lw $a0 x
  sw $a0 4($gp)
  lw $a0 y
  sw $a0 8($gp)
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 c
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 8($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal Add
  addiu $sp $sp 8
  lw $t2 4($sp)
  sw $t2 c
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
  addiu $sp $sp 4
  sw $v0 x

  lw $a0 x
  sw $a0 4($gp)
  la $a0 newline
  sw $a0 8($gp)
  lw $a0 4($gp)
  jal Print_Integer
  lw $a0 8($gp)
  jal Print_String

  lw $a0 y
  sw $a0 4($gp)
  la $a0 newline
  sw $a0 8($gp)
  lw $a0 4($gp)
  jal Print_Integer
  lw $a0 8($gp)
  jal Print_String

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
y:				.word 		0
x:				.word 		0
c:				.word 		0
newline:		.asciiz 	"\n"

# PARSING SUCCESS!
