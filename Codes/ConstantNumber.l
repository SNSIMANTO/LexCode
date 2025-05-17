%{
#include <stdio.h>
%}

DIGIT   [0-9]+

%%
{DIGIT}     { printf("Constant\t: %s\n", yytext); }
.|\n        { /* Ignore */ }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}