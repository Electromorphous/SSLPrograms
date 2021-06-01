/* Lex code to count number of 'a's in the input */

%{

int c = 0; /* Global Variable */

%}

/* Rules Section */
%%

a c++;
. ;

%%

int main()
{
    yylex();
    printf("\n The no of a's in the given string %d \n",c);
}
