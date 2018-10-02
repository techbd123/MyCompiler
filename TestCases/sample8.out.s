### MIPS CODE ###
	.text
main:
  lw $a0 q
  lw $t1 c
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 d
  lw $t1 e
  mult $a0 $t1
  mflo $a0
  sw $a0 12($gp)
  lw $a0 8($gp)
  lw $t1 12($gp)
  add $a0 $a0 $t1
  sw $a0 16($gp)
  lw $a0 16($gp)
  sw $a0 y

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
  lw $a0 a
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L5
  b L6
L5:
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

  lw $a0 q
  lw $t1 c
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

	.text
myfunction:
  sw $fp 0($sp)
  addiu $sp $sp -4
  sw $ra 0($sp)
  addiu $sp $sp -4

  la $fp 8($sp)

  lw $t1 x
  sw $t1 0($sp)
  addiu $sp $sp -4
  lw $a0 4($fp)
  sw $a0 x

  lw $a0 x
  li $t1 123
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  li $a0 0
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 x
  lw $a0 8($gp)
  sw $a0 y

L15:
  lw $a0 x
  li $t1 123456
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L16
  lw $a0 y
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 y

  lw $a0 y
  lw $t1 y
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 x

  b L15
L16:

  lw $a0 y
  sw $a0 4($gp)
  lw $v0 4($gp)

  lw $a0 4($sp)
  sw $a0 x
  addiu $sp $sp 4

  lw $ra 4($sp)
  addiu $sp $sp 4
  lw $fp 4($sp)
  addiu $sp $sp 4
  jr $ra

  lw $a0 a
  sw $a0 8($gp)
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
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 m
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 asdf
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 8($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal myfunction
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 asdf
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 m
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
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
  sw $v0 q

  lw $a0 a
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 a
  lw $t1 a
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 4($gp)
  lw $t1 8($gp)
  sub $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 8($gp)
  lw $t1 a
  mult $a0 $t1
  mflo $a0
  sw $a0 16($gp)
  lw $a0 12($gp)
  lw $t1 16($gp)
  sub $a0 $a0 $t1
  sw $a0 20($gp)
  lw $a0 16($gp)
  lw $t1 a
  mult $a0 $t1
  mflo $a0
  sw $a0 24($gp)
  lw $a0 20($gp)
  lw $t1 24($gp)
  sub $a0 $a0 $t1
  sw $a0 28($gp)
  lw $a0 4($gp)
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 32($gp)
  lw $a0 32($gp)
  lw $t1 a
  mult $a0 $t1
  mflo $a0
  sw $a0 36($gp)
  lw $a0 4($gp)
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 40($gp)
  lw $a0 40($gp)
  lw $t1 a
  div $a0 $t1
  mflo $a0
  sw $a0 44($gp)
  lw $a0 36($gp)
  lw $t1 44($gp)
  add $a0 $a0 $t1
  sw $a0 48($gp)
  lw $a0 a
  lw $t1 a
  div $a0 $t1
  mflo $a0
  sw $a0 52($gp)
  lw $a0 48($gp)
  lw $t1 52($gp)
  add $a0 $a0 $t1
  sw $a0 56($gp)
  lw $a0 28($gp)
  lw $t1 56($gp)
  mult $a0 $t1
  mflo $a0
  sw $a0 60($gp)
  lw $a0 60($gp)
  sub $a0 $a0 $t1
  sw $a0 64($gp)
  lw $a0 64($gp)
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 68($gp)
  lw $a0 68($gp)
  li $t1 0
  bne $a0 $t1 L17
  b L18
L17:
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
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 m
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 asdf
  sw $t2 0($sp)
  addiu $sp $sp -4
  jal simple
  addiu $sp $sp 0
  lw $t2 4($sp)
  sw $t2 asdf
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 m
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
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
  sw $v0 a

  b L19
L18:
  lw $a0 a
  lw $t1 q
  seq $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L20
  b L21
L20:
  lw $a0 a
  lw $t1 q
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 c
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 q
  lw $t1 c
  mult $a0 $t1
  mflo $a0
  sw $a0 12($gp)
  lw $a0 12($gp)
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 16($gp)
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
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 m
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 asdf
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 8($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 16($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal simple
  addiu $sp $sp 8
  lw $t2 4($sp)
  sw $t2 asdf
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 m
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
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

  b L19
L21:
  lw $a0 a
  lw $t1 q
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L22
  b L23
L22:
  lw $a0 q
  lw $t1 c
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 d
  lw $t1 e
  mult $a0 $t1
  mflo $a0
  sw $a0 12($gp)
  lw $a0 8($gp)
  lw $t1 12($gp)
  add $a0 $a0 $t1
  sw $a0 16($gp)
  lw $a0 q
  lw $t1 c
  add $a0 $a0 $t1
  sw $a0 20($gp)
  li $a0 23
  sw $a0 24($gp)
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
  lw $t2 y
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 x
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 m
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 n
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $t2 asdf
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 16($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 20($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  lw $a0 24($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal simple
  addiu $sp $sp 12
  lw $t2 4($sp)
  sw $t2 asdf
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 n
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 m
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 x
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 y
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
  sw $v0 a
  sw $v1 q

  b L19
L23:
L19:

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
a:				.word 		0
q:				.word 		0
c:				.word 		0
d:				.word 		0
e:				.word 		0
y:				.word 		0
x:				.word 		0
m:				.word 		0
n:				.word 		0
asdf:				.word 		0

# PARSING SUCCESS!
