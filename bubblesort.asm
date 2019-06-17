            # o registrador r1 vai sempre guardar o indice do vetor
            # o registrador r5 sempre vai ter o minuendo
            # o registrador r6 sempre vai ter o subtraendo
            # o registrador r7 sempre vai ter o endereço de retorno da "função"
            # coloca os valores no vetor[4]
            movi 5,79
            movi 1,0
            sw 5,1,vetor
            movi 5,23
            addi 1,0,1
            sw 5,1,vetor
            movi 5,9
            addi 1,0,1
            sw 5,1,vetor
            movi 5,45
            addi 1,0,1
            sw 5,1,vetor            
            movi 1,3            # coloca o reg de indice como a ultima posicao do vetor
            beq 0,0,init        # pula pra função principal
            halt
            # convencionei que sempre o subtraendo vai estar no registrador r6
neg:        nop
            nand 6,6,6
            addi 6,0,1
            beq 0,0,retneg
            # função que checa se o numero é positivo ou negativo, o operando tem que estar no registrador 3
p_or_n:     nop
            lw 2,0,msb          # test for msb if it is zero or one
            nand 3,2,3
            nand 3,2,3
            lw 2,0,msb          # if number is equal to 32768, it is positive
            beq 3,2,posn
            lw 2,0,m1           # if number is equal to -1, it is negative
            beq 3,2,negn
            # end of p_or_n function
            nop
            nop
            nop
            nop
            # inicio do bubble sort
init:       nop
            lw 5,1,vetor        # coloca o minuendo atual no r5
            addi 1,0,-1          # r1 = r1 - 1
            lw 6,1,vetor        # coloca o subtraendo atual no r6
            beq 0,0,neg         # torna o subtraendo negativo pra fazer a subtração
retneg:     nop                 # "retorno" da função neg
            add 3,5,6           # realiza a subtração r5 - r6 e salva o resultado em r3
            beq 0,0,p_or_n      # chama a função pra verificar se o numero e positivo ou negativo
            nop
            nop
posn:       nop
            movi 0,100
            halt
negn:       nop
            movi 0,500
            halt


msb:        .fill 32768
m1:         .fill -1
vetor:      .space 4    # 79, 23, 9, 45