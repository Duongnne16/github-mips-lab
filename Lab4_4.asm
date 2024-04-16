.text

start:
	li 	$s1,0x7fffffff
	li	$s2,10

	li 	$t0,0 		#$t0 =0 neu khong tran so
	addu 	$s3,$s1,$s2 	# s3 = s1 + s2
	xor 	$t1,$s1,$s2 	#kiem tra $s1,$s2 co cung dau khong
	bltz 	$t1,EXIT 		#Neu t1<0, exit
	xor 	$t2,$s3,$s1	#Kiem tra $s3,$s1 co cung dau khong
	bgtz	$t2,EXIT	#Neu $t2 >0 , exit
	
	j OVERFLOW
OVERFLOW:
	li 	$t0,1 		#ket qua tran so
EXIT: