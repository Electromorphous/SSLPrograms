%{
    #include <stdio.h>
    #include <stdlib.h>    
%}

%token num
%left '+''-'
%left '*''/'

%%

input:exp {
    printf("%d \n", $$);
    exit(0);
}

exp:
 exp'+'exp { $$ = $1 + $3; }
|exp'-'exp { $$ = $1 - $3; }
|exp'*'exp { $$ = $1 * $3; }
|exp'/'exp { 
    if( $3 == 0 ) {
        printf("\n Division by zero error \n\n");
        exit(0);
    }
    else {
        $$ = $1 / $3;
    }
 }
|'('exp')' { $$ = $2; }
|num { $$ = $1; }

%%

int yyerror() {
    printf("\n Error \n\n");
    exit(0);
}

int main() {
    printf("\n Enter an expression \n");
    yyparse();
}
