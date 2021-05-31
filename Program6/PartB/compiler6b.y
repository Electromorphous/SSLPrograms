%{

    #include <stdio.h>
    #include <stdlib.h>
    int identifier = 0, digit = 0, key = 0, op = 0;

%}

%token DIGIT ID KEY OP

%%

input:
 DIGIT input { digit++; }
|ID input { identifier++; }
|KEY input { key++; }
|OP input { op++; }

|DIGIT { digit++; }
|ID { identifier++; }
|KEY { key++; }
|OP { op++; }
;

%%

extern FILE *yyin;

int main() {
    FILE *file = fopen("InputFile.c", 'r');
    
    if(!file) {
        printf("\n Cannot open file \n");
        return -1;
    }

    yyin = file;

    do {
        yyparse();
    } while(!feof(yyin));

    printf("\n Numbers = %d \n Keywords = %d \n Identifiers = %d \n Operators = %d", digit, key, identifier, op);

    return 0;
}

void yyerror() {
    printf("\n Parse error \n");
    exit(-1);
}
