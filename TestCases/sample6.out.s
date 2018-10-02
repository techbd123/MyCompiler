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
  lw $a0 p
  lw $t1 q
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
  lw $a0 20($gp)
  sw $a0 x
  lw $a0 32($gp)
  sw $a0 y

  li $a0 151
  lw $t1 y
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 asdf

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
  lw $a0 p
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L5
  b L6
L5:
  lw $a0 p
  lw $t1 q
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
  lw $a0 16($gp)
  lw $t1 y
  mult $a0 $t1
  mflo $a0
  sw $a0 20($gp)
  lw $a0 8($gp)
  lw $t1 20($gp)
  add $a0 $a0 $t1
  sw $a0 24($gp)
  lw $a0 24($gp)
  sw $a0 x

  lw $a0 p
  lw $t1 q
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 x
  lw $t1 y
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 4($gp)
  lw $t1 8($gp)
  add $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 12($gp)
  sw $a0 a

  b L7
L6:
L7:

  b L2
L4:
  lw $a0 x
  lw $t1 y
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L8
  b L9
L8:
  lw $a0 y
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 y

L10:
  lw $a0 y
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L11
  lw $a0 a
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L12
  b L13
L12:
  lw $a0 a
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 a

  lw $a0 q
  li $t1 1
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 q

  b L14
L13:
L14:

  b L10
L11:

  b L2
L9:
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
p:				.word 		0
q:				.word 		0
d:				.word 		0
e:				.word 		0
m:				.word 		0
n:				.word 		0
asdf:				.word 		0

# PARSING SUCCESS!
