### MIPS CODE ###
# syntax error
lw $a0 x
lw $t1 y
slt $a0 $a0 $t1
sw $a0 4($gp)

# syntax error
lw $a0 y
li $t1 1
sub $a0 $a0 $t1
sw $a0 4($gp)
lw $a0 4($gp)
sw $a0 x

# syntax error
lw $a0 z
lw $t1 z
mult $a0 $t1
mflo $a0
sw $a0 4($gp)

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

# PARSING FAILURE!
