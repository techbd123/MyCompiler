### MIPS CODE ###
	.text
main:
  lw $a0 x
  lw $t1 y
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L0
  b L1
L0:
  lw $a0 q
  lw $t1 c
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 8($gp)
  lw $t1 d
  add $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 12($gp)
  lw $t1 e
  div $a0 $t1
  mflo $a0
  sw $a0 16($gp)
  lw $a0 8($gp)
  lw $t1 16($gp)
  add $a0 $a0 $t1
  sw $a0 20($gp)
  lw $a0 m
  lw $t1 n
  and $a0 $a0 $t1
  sw $a0 24($gp)
  lw $a0 4($gp)
  lw $t1 24($gp)
  mult $a0 $t1
  mflo $a0
  sw $a0 28($gp)
  lw $a0 24($gp)
  lw $t1 28($gp)
  add $a0 $a0 $t1
  sw $a0 32($gp)
  lw $a0 a
  lw $t1 q
  add $a0 $a0 $t1
  sw $a0 36($gp)
  lw $a0 36($gp)
  lw $t1 c
  add $a0 $a0 $t1
  sw $a0 40($gp)
  lw $a0 40($gp)
  lw $t1 d
  add $a0 $a0 $t1
  sw $a0 44($gp)
  lw $a0 44($gp)
  lw $t1 e
  add $a0 $a0 $t1
  sw $a0 48($gp)
  lw $a0 48($gp)
  lw $t1 f
  add $a0 $a0 $t1
  sw $a0 52($gp)
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 a
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 q
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 c
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 d
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 e
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 m
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 f
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 20($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 32($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 52($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal Brain
  addiu $sp $sp 12
  lw $t2 4($sp)
  sw $t2 f
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 m
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 e
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 d
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 c
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 q
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 a
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  sw $v0 x
  sw $v1 y

  b L2
L1:
  li $a0 2
  lw $t1 x
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  li $a0 3
  lw $t1 y
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 8($gp)
  li $t1 5
  add $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 4($gp)
  lw $t1 12($gp)
  sgt $a0 $a0 $t1
  sw $a0 16($gp)
  lw $a0 16($gp)
  li $t1 0
  bne $a0 $t1 L3
  b L4
L3:
  lw $a0 a
  nor $a0 $a0 $zero
  sw $a0 4($gp)
  lw $a0 4($gp)
  nor $a0 $a0 $zero
  sw $a0 8($gp)
  lw $a0 8($gp)
  nor $a0 $a0 $zero
  sw $a0 12($gp)
  lw $a0 12($gp)
  nor $a0 $a0 $zero
  sw $a0 16($gp)
  lw $a0 16($gp)
  nor $a0 $a0 $zero
  sw $a0 20($gp)
  lw $a0 20($gp)
  nor $a0 $a0 $zero
  sw $a0 24($gp)
  lw $a0 24($gp)
  nor $a0 $a0 $zero
  sw $a0 28($gp)
  lw $a0 28($gp)
  nor $a0 $a0 $zero
  sw $a0 32($gp)
  lw $a0 32($gp)
  nor $a0 $a0 $zero
  sw $a0 36($gp)
  lw $a0 36($gp)
  nor $a0 $a0 $zero
  sw $a0 40($gp)
  lw $a0 40($gp)
  nor $a0 $a0 $zero
  sw $a0 44($gp)
  lw $a0 44($gp)
  sw $a0 a

  b L2
L4:
  lw $a0 a
  li $t1 2
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 3
  slt $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 8($gp)
  li $t1 0
  bne $a0 $t1 L5
  b L6
L5:
L7:
  lw $a0 a
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L8
  lw $a0 a
  lw $t1 c
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 a

  b L7
L8:

  b L2
L6:
L2:

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
a:				.word 		0
q:				.word 		0
c:				.word 		0
d:				.word 		0
e:				.word 		0
m:				.word 		0
n:				.word 		0
f:				.word 		0

# PARSING SUCCESS!
