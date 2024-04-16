.text
	li $s0, 15
	li $s1, -4
push:
	add $sp, $sp, -8	#dịch thanh ghi con trỏ sp 8 byte để tạo không giam mới cho ngăn xếp
	sw $s0, 4($sp)		#lưu giá trị của thanh ghi $s0 vào vị trí 4 byte trên con trỏ ngăn xếp hiện tại 
	sw $s1, 0($sp)		#lưu giá trị của thanh ghi $s0 vào vị trí 0 byte trên con trỏ ngăn xếp hiện tại 
	
work:
	nop
	nop
	nop

pop:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	add $sp, $sp, 8 	#dịch con trỏ trở lại vị trí ban đầu trước khi push

	