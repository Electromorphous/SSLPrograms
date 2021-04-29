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
    printf("\n %d \n",yylex());
    printf("    The no of a's in the given string %d \n",c);
}
