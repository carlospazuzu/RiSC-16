		nop
        lw 1,0,num
        addi 2,0,32768
        nand 1,1,2                
        nand 1,1,2
        halt
        
        
num:	.fill 1000