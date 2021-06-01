/* Lex code to count number of lines, tabs and spaces */

%{
#include<stdio.h>
int lc = 0, sc = 0, tc = 0, ch = 0;
%}

%%

\n lc++;        /* Line counter */
[ ]+ sc++;      /* Space counter */
\t tc++;        /* Tab counter */
. ch++;         /* Line counter */

%%

int main() {
    yylex();
    printf("\n Number of lines : %d \n", lc);
    printf("\n Number of spaces : %d \n", sc);
    printf("\n Number of tabs : %d \n", tc);
    printf("\n Number of other characters : %d \n", ch);
}
