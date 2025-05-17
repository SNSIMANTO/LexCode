%{
#include <stdio.h>
%}

COMMENT     (\/\/[^\n]|\/\([^]|\+[^/])\*+\/)

%%
{COMMENT}   { printf("Comment\t: %s\n", yytext); }
.|\n        { /* Ignore other characters */ }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}