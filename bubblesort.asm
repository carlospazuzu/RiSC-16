            movi 7,3
            beq 0,0,ini
p_ou_n:     lw 4,0,msb
            nand 3,3,4
            nand 3,3,4
            lw 4,0,vp
            beq 3,4,np
            lw 4,0,m1
            beq 3,4,nn
neg:        nand 6,6,6
            addi 6,6,1
            beq 0,0,retneg
ini:        lw 5,7,vetor
            addi 7,7,1
            lw 6,7,vetor
            beq 0,0,neg
retneg:     add 3,5,6
            beq 0,0,p_ou_n
            halt
np:         beq 0,0,swap           
nn:         beq 0,0,checa          
swap:       addi 7,7,-1
            lw 5,7,vetor
            addi 7,7,1
            lw 6,7,vetor
            addi 7,7,-1
            sw 6,7,vetor
            addi 7,7,1
            sw 5,7,vetor
            addi 1,1,1            
checa:      addi 7,7,-2
            lw 2,0,m1
            beq 7,2,checa2            
            beq 0,0,ini
checa2:     beq 1,0,fim
            movi 7,3
            movi 1,0
            beq 0,0,ini        
fim:        movi 7,0
            lw 1,7,vetor
            movi 7,1
            lw 2,7,vetor
            movi 7,2
            lw 3,7,vetor
            movi 7,3
            lw 4,7,vetor
            movi 7,4
            lw 5,7,vetor
            halt
            
msb:        .fill -32768
m1:         .fill -1
vp:         .fill 32767
vetor:		.fill 98       
			.fill 79
			.fill 2
			.fill 57
			.fill 34
