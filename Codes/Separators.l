%{
#include <stdio.h>
%}

SEPARATOR [👦👦\{\}👦👦,;]

%%
{SEPARATOR} { printf("Separator\t: %s\n", yytext); }
.|\n        { /* Ignore */ }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}