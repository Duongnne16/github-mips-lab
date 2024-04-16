.data
array: .word 5, 2, 4, 6, 1
array_size: .word 5

.text
main:
    la $a0, array	# $a0 = address (A[0])
    lw $a1, array_size	# $a1 = array_size

    li $t0, 0            # i = 0
loop1:
    li $t1, 0            # j = 0
    li $t2, 1            # flag = 1 (to check if any swap is performed)
    
loop2:
    # Calculate indices: 
    # index of array[j] = base address + (j * 4) (each element is 4 bytes)
    # index of array[j+1] = base address + ((j + 1) * 4)
    mul $t3, $t1, 4      # $t3 = j * 4
    mul $t4, $t1, 4      # $t4 = (j + 1) * 4
    lw $t5, 0($a0)       # $t5 = array[j]
    lw $t6, 4($a0)       # $t6 = array[j+1]

    # Compare array[j] and array[j+1]
    bgt $t5, $t6, swap   # If array[j] > array[j+1], branch to swap

    # No swap performed, increment j
    addi $t1, $t1, 1
    blt $t1, $a1, loop2   # Continue loop2 if j < array size
    j check_flag

swap:
    # Swap array[j] and array[j+1]
    sw $t6, 0($a0)       # array[j] = array[j+1]
    sw $t5, 4($a0)       # array[j+1] = array[j]
    li $t2, 0            # Set flag = 0 (swap performed)

    # Increment j
    addi $t1, $t1, 1
    blt $t1, $a1, loop2   # Continue inner loop if j < array size

check_flag:
    # Check if any swap was performed
    beq $t2, $zero, loop1   # If flag == 0, no swaps were made, so the array is sorted
    li $t2, 1            # Reset flag to 1
    j loop1

        # End of program
    li $v0, 10
    syscall
