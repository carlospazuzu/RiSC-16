#include <stdio.h>

#define MAX 5
#define TRUE 1
#define FALSE 0

int pivo, esq, dir;
int vetor[] = {48, 46, 29, 99, 15};
int ordenados[] = {0, 0, 0, 0, 0};

int ordenou;

// verifica se o vetor esta ordenado ao checar todos os flags dos numeros que estao completamente ordenados
int estaOrdenado()
{
    int i;
    for (i = 0; i < MAX; i ++)    
        if (!ordenados[i])
            return FALSE;
    
    return TRUE;
}

// busca o pivo, ponteiro da esquerda e ponteiro da direita
void organizaPonteiros()
{
    // encontra o proximo pivo
    pivo = MAX - 1;

    while (1)
    {
        if (!ordenados[pivo])
        {
            // checa se o pivo esta entre dois numeros que ja estao completamente ordenados
            if (pivo - 1 >= 0 && pivo + 1 <= MAX - 1 && ordenados[pivo + 1] && ordenados[pivo - 1])
            {
                ordenados[pivo] = TRUE;
                ordenou = TRUE;
                return;
            }

            // checa se o pivo esta no inicio da lista e, se o numero posterior estiver ordenado, torne este tambem
            if (pivo - 1 == -1 && ordenados[pivo + 1])
            {
                ordenados[pivo] = TRUE;
                ordenou = TRUE;
                return;
            }

            // checa se o pivo esta no fim da lista e, se o numero anterior estiver ordenado, torne este tambem
            if (pivo + 1 == MAX && ordenados[pivo - 1])
            {
                ordenados[pivo] = TRUE;
                ordenou = TRUE;
                return;
            }

            // caso nenhuma condição seja satisfeita, achamos o novo pivo
            break;
        }
            
        pivo --;
    }

    // encontra o ponteiro da direita
    dir = pivo - 1;

    while (1)
    {
        if (!ordenados[dir])
            break;
        dir --;
    }

    // encontra o ponteiro da esquerda
    esq = pivo - 1;

    while (1)
    {
        if (!ordenados[esq] && esq >= 0 && ((ordenados[esq - 1] && esq == dir) || (esq != dir && (ordenados[esq - 1] || esq == 0))))
            break;
        esq --;
    }
}

void movePonteiroDaEsquerda()
{
    while (vetor[esq] < vetor[pivo])
    {        
        // caso o ponteiro da esquerda alcance o pivo, significa que o pivo esta no seu lugar certo
        if (esq == pivo)
        {
            ordenados[pivo] = TRUE;
            ordenou = TRUE;
            return;
        }
        esq ++;
    }        
}

void swap(int pos1, int pos2)
{
    int aux = vetor[pos1];
    vetor[pos1] = vetor[pos2];
    vetor[pos2] = aux;
}

void movePonteiroDaDireita()
{
    while (vetor[dir] > vetor[pivo])
    {        
        // se o ponteiro da direita encontrar o da esquerda, faça um swap desta posição pela posição do pivo
        if (dir == esq)
        {
            swap(dir, pivo);
            ordenados[dir] = TRUE;
            ordenou = TRUE;            
            return;
        }
        dir --;
    }

    // caso nao tenha encontrado o ponteiro da esquerda, ele encontrou o elemento que e menor que o pivo
    // e portanto deve realizar um swap pelo elemento que esta sendo apontado pelo ponteiro da esquerda
    swap(dir, esq);
}

int main()
{
    pivo = 0;
    esq = 0;
    dir = 0;
    
    while (!estaOrdenado())
    {
        ordenou = FALSE;
        organizaPonteiros();

        if (ordenou) continue;

        movePonteiroDaEsquerda();

        if (ordenou) continue;

        movePonteiroDaDireita();

        if (ordenou) continue;
    }

    getchar();

    return 0;
}