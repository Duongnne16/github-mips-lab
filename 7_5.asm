.data
	largest: .asciiz "Largest: "
	smallest: .asciiz "\nSmallest: "
	comma: .asciiz ","
.text
main:
	li $s0, 1
	li $s1, 4
	li $s2, -6
	li $s3, 0
	li $s4, 10
	li $s5, 2
	li $s6, -65
	li $s7, 8
	
	jal Duong
	nop
print:	
#print Largest
	li $v0,4
	la $a0, largest
	syscall
#print max
	add $a0, $t0, $zero
	li $v0, 1
	syscall
#print ,
	li $v0, 4
	la $a0, comma
	syscall
#print the register of max
	add $a0, $t5, $zero
	li $v0,1
	syscall
	
#print Smallest
	li $v0,4
	la $a0, smallest
	syscall
#print min
	add $a0, $t1, $zero
	li $v0, 1
	syscall
#print ,
	li $v0, 4
	la $a0, comma
	syscall
#print the register of min
	add $a0, $t6, $zero
	li $v0,1
	syscall
endmain:
	li $v0, 10
	syscall
	
	
#----------------
# $t0 = max
#$t1 = min
#index of max = $t5
#index of min = $t6
#$v0 the largest value
#----------------

swapMax:
	add $t0,$t3,$zero
	add $t5, $t2, $zero
	jr $ra
swapMin:
	add $t1,$t3,$zero
	add $t6, $t2, $zero
	jr $ra
Duong:
	add $t9,$sp,$zero   #save address of orgin $sp
	addi $sp,$sp, -32
	#sw $s0,0($sp)
	sw $s1,0($sp)
	sw $s2,4($sp)
	sw $s3,8($sp)
	sw $s4,12($sp)
	sw $s5,16($sp)
	sw $s6,20($sp)
	sw $s7,24($sp)
	sw $ra, 28($sp)  #save $ra for main
	add $t0,$s0, $zero
	add $t1,$s0,$zero
	li $t5, 0
	li $t6 ,0
	li $t2,0

findmaxmin:
	addi $sp,$sp,4
	lw $t3,-4($sp)
	sub $t4,$sp,$t9
	beq $t4,$zero,done	
	nop
	addi $t2,$t2,1
	sub $t4,$t0,$t3
	bltzal $t4,swapMax
	nop
	sub $t4,$t3,$t1
	bltzal $t4,swapMin
	nop
	j	findmaxmin
done:
	lw $ra,-4($sp)
	jr $ra
