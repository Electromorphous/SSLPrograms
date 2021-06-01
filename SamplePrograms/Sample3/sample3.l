/* Lex code to count number of words */

%{
    #include<stdio.h>
    #include<string.h>
    int i = 0;
%}

%%

[A-Za-z0-9]* i++;

\n {    
    printf("\n %d \n", i);
    i = 0;
}

%%

int yywrap(void){}

int main(){
    yylex();

    return 0;
}
