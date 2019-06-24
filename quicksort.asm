            nop
            movi 4,0            # o registrador 4 guarda qual operação esta sendo feito no momento
                                # 0 = ponteiro da esquerda, 1 = ponteiro da direita            
            beq 0,0,ini         # inicia o quick sort

p_ou_n:     add 2,1,6           # subtrai o conteudo do reg 1 com o reg 6 e poe o resultado em reg2
            lw 3,0,bms          # traz o numero com o bms ligado para fazer o and
            nand 2,2,3          # realiza a operação "and" com dois nands
            nand 2,2,3
            lw 3,0,vp           # coloca o valor positivo pra testar se e positivo 
            beq 2,3,np          # se forem iguais, o numero e positivo
            lw 3,0,m1           # coloca -1 no reg3 para testar se é negativo
            beq 2,3,nn          # se forem iguais, o numero e negativo

np:         beq 4,0,1           # se op = 0, esta mexendo com o ponteiro da esquerda
            beq 0,0,incesq
            movi 4,1            # se o numero e positivo, significa que foi encontrado um numero maior que o pivo
                                # entao deve-se agora mover o ponteiro da direita
            beq 0,0,ini
incesq:     lw 7,0,esq          # pega o indice atual do ponteiro da esquerda e incrementa em uma unidade
            addi 7,7,1
            sw 7,0,esq
            beq 0,0,ini
nn:         beq 4,0,1           # se op = 0, esta mexendo com o ponteiro da esquerda
            # nega o pivo e coloca o resultado no reg 2
neg:        nand 6,6,6
            addi 6,6,1
            beq 0,0,1
cmp_e:      beq 0,0,neg         # chama a funcao de tornar o numero negativo
            beq 0,0,p_ou_n      # chama a funcao de comparar se o resultado da subtração é positivo ou negativa

busca_pivo: movi 7,4            # aponta pro ultimo elemento do vetor
rec:        lw 1,7,vflag        # carrega no reg1 o conteudo de onde o ponteiro esta apontando atualmente
            lw 6,0,false        # usa r6 como auxiliar pra verificar se esta posicao nao esta com o numero totalmente ordenado
            beq 1,6,enc_piv
            lw 2,0,m1
            beq 1,2,fim         # se essa condição for satisfeita, significa que o vetor esta ordenado
            addi 1,1,-1         # indice = indice - 1
            beq 0,0,rec         # retorna pro inicio da função pra continuar buscando
enc_piv:    sw 1,0,pivo         # salva o indice do novo pivo na memoria
busc_dir:   addi 1,1,-1         # indice = indice - 1
            

ini:        lw 7,0,pivo         # pega o indice de onde esta atualmente o pivo
            lw 6,7,vetor        # coloca o conteudo de vetor[pivo] no registrador 6
            movi 7,1
            beq 4,7,pd
pe:         lw 7,0,esq          # pega o indice de onde esta atualmente o ponteiro da esquerda
            lw 1,7,vetor        # coloca o conteudo de vetor[esq] no registrador 1
            beq 0,0,ini_cmpe
pd:         lw 7,0,dir          # pega o indice de onde esta atualmente o ponteiro da direita
            lw 1,7,vetor        # coloca o conteudo de vetor[dir] no registrador 1            
            beq 0,0,ini_cmpd
ini_cmpe:   beq 0,0,cmp_e       # chama a funcao de comparar o pivo e o ponteiro da esquerda
ini_cmpd:   beq 0,0,cmp_d       # chama a funcao de comparar o pivo e o ponteiro da esquerda
fim:        halt
            halt

esq:        .fill 0
dir:        .fill 3
pivo:       .fill 4
vp:         .fill 32767
bms:        .fill -32768
m1:         .fill -1
maxelem:    .fill 5
true:       .fill 1
false:      .fill 0
vflag:      .space 5
vetor:      .fill 47
            .fill 63
            .fill 7
            .fill 92
            .fill 14