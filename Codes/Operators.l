%{
#include <stdio.h>
%}

OPERATOR (\+|\-|\*|\/|\=|\+=|\-=|\/=|==|!=|<=|>=|<|>)

%%
{OPERATOR}  { printf("Operator\t: %s\n", yytext); }
.|\n        { /* Ignore */ }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}