.text
	li 	$s0, 0x12345678		#load test value for these function
	andi 	$t0, $s0, 0xff000000	#Extract the MSB of $s0
	srl	$t0,$t0,24		#dich phai 24bit
	andi 	$t1,$s0,0xffffff00	
	ori	$t2,$s0,0x000000ff 
	xor	$s0,$s0,$s0
	