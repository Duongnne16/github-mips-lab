.text
	li $a0, 16
	li $a1, -10
	li $a2, 32
	jal max
	nop
	add $s1, $v0,$zero 	#lưu kết quả max vào $a1 và kết thúc chương trình
	li $v0, 10
	syscall
	
	
	#$v0 để lưu giá trị max
max:
	add $v0, $zero, $a0   #gán giá trị v0 = a0
	sub $t0, $a1, $v0	#t0 = a1-v0
	bltz $t0, okay 		#so sánh t1 với 0 nếu t1 <0 giá trị trả về là 1 (tức là s0 >s1) thì sẽ nhảy đến okay để xét tiếp a2
				# nếu giá trị trả về là 0 (a0<a1) thì cập nhật max
	nop
	add $v0, $zero, $a1
	
okay:
	sub $t0, $a2, $v0	#t0 = a2-v0
	bltz $t0, done 		# nếu giá trị trả về là 1 (a2 < max) thì kết thúc hàm và trả về v0 max
				# nếu giá trị trả về là 0 thì cập nhật max
	add $v0, $zero, $a2

done:
	jr $ra
	
	
	