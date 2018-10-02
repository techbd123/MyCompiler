### MIPS CODE ###
	.text
main:
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  jal Input_Integer
  addiu $sp $sp 0
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  sw $v0 n

  lw $a0 n
  sw $a0 4($gp)
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal fibonacci
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 value
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
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

  lw $a0 n
  sw $a0 4($gp)
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal Hanoi
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 value
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
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
fibonacci:
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
  seq $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L0
  b L1
L0:
  li $a0 0
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 term

  b L2
L1:
  lw $a0 n
  li $t1 1
  seq $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L3
  b L4
L3:
  li $a0 1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 term

  b L2
L4:
  lw $a0 n
  li $t1 1
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L5
  b L6
L5:
  lw $a0 n
  li $t1 1
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term1
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal fibonacci
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term1
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 value
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  sw $v0 term1

  lw $a0 n
  li $t1 2
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term1
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term2
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal fibonacci
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term2
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term1
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 value
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  sw $v0 term2

  lw $a0 term1
  lw $t1 term2
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 term

  b L2
L6:
L2:

  lw $a0 term
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

	.text
Hanoi:
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
  seq $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 8($gp)
  li $t1 0
  bne $a0 $t1 L7
  b L8
L7:
  li $a0 0
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 term

  b L9
L8:
  lw $a0 n
  li $t1 0
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L10
  b L11
L10:
  lw $a0 n
  li $t1 1
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term1
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 term2
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal Hanoi
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term2
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term1
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 term
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 value
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  sw $v0 term1

  li $a0 2
  lw $t1 term1
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 8($gp)
  sw $a0 term

  b L9
L11:
L9:

  lw $a0 term
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
n:				.word 		0
value:				.word 		0
newline:		.asciiz 	"\n"
term:				.word 		0
term1:				.word 		0
term2:				.word 		0

# PARSING SUCCESS!
