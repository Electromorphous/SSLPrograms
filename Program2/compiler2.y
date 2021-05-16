%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token A B NL

%%

stmt: S NL {
    printf("\n Valid string \n\n");
    exit(0);
}

S: A S B
|;

%%

int yyerror() {
    printf("\n Invalid string \n\n");
    exit(0);
}

int main() {
    printf("\n Enter the string \n");
    yyparse();

    return 0;
}
