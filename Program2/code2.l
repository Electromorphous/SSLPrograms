/* Develop, implement and execute a program using YACC tool to recognize all strings ending with 'b' preceded by n 'a's using the grammar (a^n)b (note: input n value). */

%{
    #include "y.tab.h"
%}

%%

[aA] { return A; }
[bB] { return B; }
\n return '\n';

. { return yytext[0]; }

%%

int yywrap() {
    return 1;
}

/* Exercise1: Write YACC program to recognize string with grammar */
/* { (ab)^n | n >= 0 } 

/* Exercise2: Write YACC program to recognize strings of */
/* { (a^n)b | n >= 5 } */
