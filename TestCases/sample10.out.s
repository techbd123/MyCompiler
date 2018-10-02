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

  lw $a0 a
  sw $a0 4($gp)
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
  lw $t2 value
  sw $t2 0($sp)
  addiu $sp $sp -4
  lw $a0 4($gp)
  sw $a0 0($sp)
  addiu $sp $sp -4
  jal simple
  addiu $sp $sp 4
  lw $t2 4($sp)
  sw $t2 value
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
  sw $v0 value

L0:
  lw $a0 value
  lw $t1 a
  or $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  nor $a0 $a0 $zero
  sw $a0 8($gp)
  lw $a0 8($gp)
  li $t1 0
  beq $a0 $t1 L1
  lw $a0 a
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 a
  or $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 4($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 8($gp)
  lw $t1 12($gp)
  or $a0 $a0 $t1
  sw $a0 16($gp)
  lw $a0 12($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 20($gp)
  lw $a0 16($gp)
  lw $t1 20($gp)
  or $a0 $a0 $t1
  sw $a0 24($gp)
  lw $a0 20($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 28($gp)
  lw $a0 24($gp)
  lw $t1 28($gp)
  or $a0 $a0 $t1
  sw $a0 32($gp)
  lw $a0 28($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 36($gp)
  lw $a0 32($gp)
  lw $t1 36($gp)
  or $a0 $a0 $t1
  sw $a0 40($gp)
  lw $a0 40($gp)
  lw $t1 36($gp)
  or $a0 $a0 $t1
  sw $a0 44($gp)
  lw $a0 36($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 48($gp)
  lw $a0 44($gp)
  lw $t1 48($gp)
  or $a0 $a0 $t1
  sw $a0 52($gp)
  lw $a0 48($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 56($gp)
  lw $a0 52($gp)
  lw $t1 56($gp)
  or $a0 $a0 $t1
  sw $a0 60($gp)
  lw $a0 56($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 64($gp)
  lw $a0 60($gp)
  lw $t1 64($gp)
  or $a0 $a0 $t1
  sw $a0 68($gp)
  lw $a0 64($gp)
  lw $t1 a
  and $a0 $a0 $t1
  sw $a0 72($gp)
  lw $a0 68($gp)
  lw $t1 72($gp)
  or $a0 $a0 $t1
  sw $a0 76($gp)
  lw $a0 76($gp)
  sw $a0 value

  b L0
L1:

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

L2:
  lw $a0 a
  lw $t1 q
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L3
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
  sw $a0 a

  b L2
L3:

  lw $a0 a
  lw $t1 q
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 c

  li $a0 0
  sw $a0 4($gp)
  li $a0 1
  sw $a0 8($gp)
  li $a0 1
  sw $a0 12($gp)
  li $a0 1000
  sw $a0 16($gp)
  lw $a0 4($gp)
  sw $a0 old
  lw $a0 8($gp)
  sw $a0 sgn
  lw $a0 12($gp)
  sw $a0 step
  lw $a0 16($gp)
  sw $a0 lim

L4:
  lw $a0 step
  lw $t1 lim
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  beq $a0 $t1 L5
  lw $a0 sgn
  lw $t1 step
  div $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  lw $t1 old
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 8($gp)
  sw $a0 new

  lw $a0 step
  li $t1 2
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 step

  lw $a0 sgn
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 sgn

  lw $a0 old
  lw $t1 new
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 2
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 8($gp)
  sw $a0 pi

  lw $a0 new
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 old

  b L4
L5:

  lw $a0 x
  lw $t1 y
  slt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L6
  b L7
L6:
  lw $a0 y
  li $t1 1
  sub $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 x

  b L8
L7:
  lw $a0 x
  lw $t1 y
  seq $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L9
  b L10
L9:
  b L8
L10:
  lw $a0 x
  lw $t1 y
  sgt $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  li $t1 0
  bne $a0 $t1 L11
  b L12
L11:
  lw $a0 y
  li $t1 1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 x

  b L8
L12:
L8:

  lw $a0 tol
  li.s $f1 0.0
  move $t1 $f1
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 t

  li.s $f1 2.0
  move $a0 $f1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 i

  li $a0 2
  sw $a0 4($gp)
  li $a0 3
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 ao
  lw $a0 8($gp)
  sw $a0 a

  li $a0 1
  sw $a0 4($gp)
  li $a0 1
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 bo
  lw $a0 8($gp)
  sw $a0 q

  lw $a0 ao
  lw $t1 bo
  div $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 a
  lw $t1 q
  div $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 4($gp)
  lw $t1 8($gp)
  sub $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 12($gp)
  sw $a0 diff

L13:
  lw $a0 diff
  lw $t1 diff
  mult $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 t
  lw $t1 t
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 4($gp)
  lw $t1 8($gp)
  slt $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 12($gp)
  li $t1 0
  beq $a0 $t1 L14
  lw $a0 a
  sw $a0 4($gp)
  lw $a0 a
  lw $t1 i
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 8($gp)
  lw $t1 ao
  add $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 4($gp)
  sw $a0 ao
  lw $a0 12($gp)
  sw $a0 a

  lw $a0 q
  sw $a0 4($gp)
  lw $a0 q
  lw $t1 i
  mult $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 8($gp)
  lw $t1 bo
  add $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 4($gp)
  sw $a0 bo
  lw $a0 12($gp)
  sw $a0 q

  lw $a0 a
  sw $a0 4($gp)
  lw $a0 ao
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 ao
  lw $a0 8($gp)
  sw $a0 a

  lw $a0 q
  sw $a0 4($gp)
  lw $a0 bo
  lw $t1 q
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 qo
  lw $a0 8($gp)
  sw $a0 q

  lw $a0 a
  sw $a0 4($gp)
  lw $a0 ao
  lw $t1 a
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 ao
  lw $a0 8($gp)
  sw $a0 a

  lw $a0 q
  sw $a0 4($gp)
  lw $a0 bo
  lw $t1 q
  add $a0 $a0 $t1
  sw $a0 8($gp)
  lw $a0 4($gp)
  sw $a0 bo
  lw $a0 8($gp)
  sw $a0 q

  lw $a0 i
  li $t1 2
  add $a0 $a0 $t1
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 i

  lw $a0 ao
  lw $t1 bo
  div $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 a
  lw $t1 q
  div $a0 $t1
  mflo $a0
  sw $a0 8($gp)
  lw $a0 4($gp)
  lw $t1 8($gp)
  sub $a0 $a0 $t1
  sw $a0 12($gp)
  lw $a0 12($gp)
  sw $a0 diff

  b L13
L14:

  lw $a0 a
  lw $t1 q
  div $a0 $t1
  mflo $a0
  sw $a0 4($gp)
  lw $a0 4($gp)
  sw $a0 e

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
value:				.word 		0
lim:				.word 		0
step:				.word 		0
sgn:				.word 		0
old:				.word 		0
new:				.word 		0
pi:				.word 		0
x:				.word 		0
y:				.word 		0
tol:				.word 		0
t:				.word 		0
i:				.word 		0
ao:				.word 		0
bo:				.word 		0
diff:				.word 		0
qo:				.word 		0

# PARSING SUCCESS!
