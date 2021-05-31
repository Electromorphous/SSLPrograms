%{

    #include <stdio.h>
    int ml = 0, sl = 0;

%}

%%

"/*"[a-zA-Z0-9' '\t\n]+"*/" { ml++; }
"//".* { sl++; }

%%

int main() {
    yyin = fopen("InputFile.c", "r");
    yyout = fopen("OutputFile.c", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    printf("\n Single line comments : %d \n", sl);
    printf("\n Multiline comments : %d \n", ml);
    return 0;
}
