/* Write a LEX program to recognize valid arithmetic expression. Identifiers in the expression could be only integers and operators could be + and *. Count the identifiers & operators present and print them separately. */

%{
    #include <stdio.h>
    int v = 0, op = 0, id = 0, flag = 0;
%}

%%

[a-zA-Z]+[0-9a-zA-Z]* {
    id++;
    printf("\n Identifier : ");
    ECHO;
}

[\+\-\*\/\=] {
    op++;
    printf("\n Operator : ");
    ECHO;
}

"(" { v++; }
")" { v--; }
";" { flag = 1; }
.|\n { ; }

%%

int main() {
    printf("\n Enter the expression \n");
    yylex();

    if( (op + 1) == id && v == 0 && flag == 0) {
        printf("\n\n Expression valid");
        printf("\n Number of identifiers : %d", id);
        printf("\n Number of operators : %d \n\n", op);
    }
    else {
        printf("\n\n Expression invalid \n\n");
    }

    return 0;
}
