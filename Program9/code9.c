// Design, develop and implement a C/C++/Java program to
// implement page replacement algorithms LRU and FIFO
// Assume suitable input required to demonstrate the results

#include <stdio.h>

void FIFO(char s[], char F[], int l, int f)
{
    int i, j = 0, k, flag = 0, cnt = 0;

    printf("\n\t PAGE \t FRAME \t FAULT");

    for (i = 0; i < l; i++)
    {
        for (k = 0; k < f; k++)
        {
            if (F[k] == s[i])
                flag = 1;
        }
        if (flag == 0)
        {
            printf("\n\t%c\t", s[i]);
            F[j] = s[i];
            j++;

            for (k = 0; k < f; k++)
                printf("%c", F[k]);

            printf("\t page_fault : %d", cnt);
            cnt++;
        }
        else
        {
            flag = 0;
            printf("\n\t%c\t", s[i]);

            for (k = 0; k < f; k++)
                printf("%c", F[k]);

            printf("\t No page_fault");
        }

        if (j == f)
            j = 0;
    }
}

void lru(char s[], char F[], int l, int f)
{
    int i, j = 0, k, m, flag = 0, cnt = 0, top = 0;

    printf("\n\t PAGE \t FRAMES \t FAULTS \t");

    for (i = 0; i < l; i++)
    {
        for (k = 0; k < f; k++)
        {
            if (F[k] == s[i])
            {
                flag = 1;
                break;
            }
        }

        printf("\n\t%c\t", s[i]);

        if (j != f && flag != 1)
        {
            F[top] = s[i];
            j++;

            if (j != f)
                top++;
        }

        else
        {
            if (flag != 1)
            {
                for (k = 0; k < top; k++)
                    F[k] = F[k + 1];

                F[top] = s[i];
            }
            if (flag == 1)
            {
                for (m = k; m < top; m++)
                    F[m] = F[m + 1];

                F[top] = s[i];
            }
        }
        for (k = 0; k < f; k++)
            printf("%c", F[k]);

        if (flag == 0)
        {
            printf("\t page_fault : %d", cnt);
            cnt++;
        }
        else
            printf("\t No page_fault");

        flag = 0;
    }
}

int main()
{
    int ch, YN = 1, i, l, f;
    char F[10], s[25];

    printf("\n\n\t Enter the no. of empty frames : ");
    scanf("%d", &f);

    printf("\n\n\t Enter the length of the string : ");
    scanf("%d", &l);

    printf("\n\n\t Enter the string : ");
    scanf("%s", s);

    for (i = 0; i < f; i++)
        F[i] = -1;

    do
    {
        printf("\n\n\t ***MENU***");
        printf("\n\n\t 1. FIFO \n\n\t 2. LRU");
        printf("\n\n\t Enter your choice : ");
        scanf("%d", &ch);

        switch (ch)
        {
        case 1:
            for (i = 0; i < f; i++)
                F[i] = -1;

            FIFO(s, F, l, f);
            break;

        case 2:
            for (i = 0; i < f; i++)
                F[i] = -1;

            lru(s, F, l, f);
            break;
        }

        printf("\n\n\t Do you want to continue? \n\t IF YES ENTER 1 \n\t IF NO ENTER 0 \n\n\t");
        scanf("%d", &YN);

    } while (YN == 1);

    return (0);
}
