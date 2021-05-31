%{

    #include <stdio.h>
    #include "y.tab.h"
    extern yylval;

%}

%%

[\t];
[+|-|*|/|=|<|>] {
    printf("\n Operator is %s", yytext);
    return OP;
}
[0-9]+ {
    yylval = atoi(yytext);
    printf("\n Number is %d", yylval);
    return DIGIT;
}
int|char|bool|float|void|for|do|while|if|else|return {
    printf("\n Keyword is %s", yytext);
    return KEY;
}
[a-zA-Z0-9]+ {
    printf("\n Identifier is %s", yytext);
    return ID;
}
.;

%%
