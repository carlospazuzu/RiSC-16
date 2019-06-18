            # o registrador r1 vai sempre guardar o indice do vetor
            # o registrador r5 sempre vai ter o minuendo
            # o registrador r6 sempre vai ter o subtraendo
            # o registrador r7 sempre vai ter valor de trocar ocorridas em um ciclo de ordenação
            # coloca os valores no vetor[4]

            movi 5,79
            movi 1,0
            sw 5,1,vetor
            movi 5,23
            addi 1,1,1
            sw 5,1,vetor
            movi 5,9
            addi 1,1,1
            sw 5,1,vetor
            movi 5,45
            addi 1,1,1
            sw 5,1,vetor            
            movi 1,2            # coloca o reg de indice como a ultima posicao do vetor
            beq 0,0,init        # pula pra função principal
            halt
            # convencionei que sempre o subtraendo vai estar no registrador r6
            # transforma o subtraendo em negativo para a subtração acontecer em forma de adição
neg:        nop
            nand 6,6,6
            addi 6,6,1
            beq 0,0,retneg
            # função que checa se o numero é positivo ou negativo, o operando tem que estar no registrador 3
p_or_n:     nop
            lw 2,0,msb          # test for msb if it is zero or one
            nand 3,2,3
            nand 3,2,3
            lw 2,0,cp          # if number is equal to 32767, it is positive
            beq 3,2,posn
            lw 2,0,m1           # if number is equal to -1, it is negative
            beq 3,2,negn
            # end of p_or_n function            
            # inicio do bubble sort

msb:        .fill -32768
cp:         .fill 32767
m1:         .fill -1
vetor:      .space 4    # 79, 23, 9, 45

init:       nop
            lw 5,1,vetor        # coloca o minuendo atual no r5
            addi 1,1,1          # r1 = r1 + 1
            lw 6,1,vetor        # coloca o subtraendo atual no r6
            beq 0,0,neg         # torna o subtraendo negativo pra fazer a subtração
retneg:     nop                 # "retorno" da função neg
            add 3,5,6           # realiza a subtração r5 - r6 e salva o resultado em r3
            beq 0,0,p_or_n      # chama a função pra verificar se o numero e positivo ou negativo            
            # se chegar aqui, e porque o numero e positivo
posn:       nop
            beq 0,0,swap
            halt
            # se chegar aqui, e porque o numero e negativo
negn:       nop            
            beq 0,0,checa
            nop
            # troca os dois operandos de posição
swap:       nop
            addi 1,1,-1         # r1 = r1 - 1, retorna a registrador de indice pra posicao anterior
            lw 5,1,vetor        # coloca o minuendo atual no r5
            addi 1,1,1          # r1 = r1 + 1
            lw 6,1,vetor        # coloca o subtraendo atual no r6
            addi 1,1,-1
            sw 6,1,vetor        # inverte os operandos, colocando o menor antes e o maior depois        
            addi 1,1,1
            sw 5,1,vetor
            addi 7,7,1          # registrador contador de swaps incrementa em 1
            nop
            nop
            # diminui em uma unidade o indice do vetor e checa se chegou no final e se esta ordenado ou nao
checa:      nop
            addi 1,1,-2
            lw 3,0,m1
            beq 1,3,checa2         # se r1 == -1, o indice saiu do vetor, portanto ele ja realizou todas as trocas                        
            beq 0,0,init            # senao, volta pro inicio do algoritmo e continue a ordenar
            # checa se houve trocas, se houve ao menos uma, significa que ainda nao esta ordenado
checa2:     nop
            beq 7,0,fim         # se nao houve trocas, finalize o algoritmo, pois o vetor esta ordenado
            movi 1,2            # senao, sete o registrador de indice pro final e volte pro começo
            movi 7,0            # e resete o contador de trocas 
            beq 0,0,init        
            # imprima o vetor ordenado nos registradores e seja feliz
fim:        nop
            movi 7,0
            lw 1,7,vetor
            addi 7,7,1
            lw 1,7,vetor
            addi 7,7,1
            lw 1,7,vetor
            addi 7,7,1
            lw 1,7,vetor
            halt



