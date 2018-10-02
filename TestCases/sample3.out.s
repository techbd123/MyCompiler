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

  lw $a0 x
  sw $a0 4($gp)
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal sum
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
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

  b Exit

	.text
sum:
  sw $fp 0($sp)
  addiu $sp $sp -4
  sw $ra 0($sp)
  addiu $sp $sp -4

  la $fp 8($sp)

  lw $t1 n
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 4($fp)
  sw $a0 n

  lw $a0 n
  li $t1 0
  sle $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L0
  b L1
L0:
  li $a0 0
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 s

  b L2
L1:
  lw $a0 n
  li $t1 0
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L3
  b L4
L3:
  lw $a0 n
  li $t1 1
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 s
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 p
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal sum
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 p
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 s
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  sw $v0 p

  lw $a0 n
  lw $t1 p
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 s

  b L2
L4:
L2:

  lw $a0 s
  sw $a0 4($gp)
  lw $v0 4($gp)

  lw $a0 4($sp)
  sw $a0 n
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
newline:		.asciiz 	"\n"
n:				.word 		0
s:				.word 		0
p:				.word 		0

# PARSING SUCCESS!
