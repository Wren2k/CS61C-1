main:
	jal StringLen

loop:
	j loop
	
StringLen:   
		lui $r0, 0      
loop:
		lw $r1, 0($r0)  
		sw $r3, 0($r0)  
		lui $r3, 0      
		addi $r0 $r0 1  
		zb $r2, $r1     
		beq $r2, $r3, loop
ZeroInUpperToo:
		ffo $r2, $r1
		lui $r3, 0
		ori $r3, $r3, 8    
		slt $r3, $r2, $r3   
		beq $r1, $r3, ZeroInLowerOnly
		addi $r0, $r0, -1   
		lui $r3, 0
		ori $r3, $r3, 2    
		sllv $r0, $r0, $r3
		j exit
ZeroInLowerOnly:
		lui $r3, 0
		ori $r3, $r3, 2   
		sllv $r0, $r0, $r3  
		addi $r0, $r0, -1  
exit:
		disp $r0, 0 
		lui $r3, 0
		ori $r3, $r3, 0    		
		lw $r3, 0($r3)  
		jr $r3   

		
		
		
