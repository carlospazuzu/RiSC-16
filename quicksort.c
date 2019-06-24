#include <stdio.h>

#define MAX 5
#define TRUE 1
#define FALSE 0

int pivo, esq, dir;
int vetor[] = {98, 48, 25, 26, 38};    
int ordenados[] = {0, 0, 0, 0, 0};

int estaOrdenado()
{
    int i;
    for (i = 0; i < MAX; i ++)    
        if (!ordenados[i])
            return FALSE;
    
    return TRUE;
}

void organizaPonteiros()
{
    
}

int main()
{
    pivo = esq = dir = 0;
    
    while (!estaOrdenado())
    {
        organizaPonteiros();
    }

    return 0;
}