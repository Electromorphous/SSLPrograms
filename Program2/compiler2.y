%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token A B

%%

input: S '\n' {
    printf("\n Valid string \n\n");
    exit(0);
}

 S: A S1 B
|S1: A S1
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
