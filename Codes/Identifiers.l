%{
#include <stdio.h>
#include <string.h>

char *keywords[] = {"int", "float", "return", "if", "else", "while", "for", "do", "break", "continue", "void", "char", "double"};
int is_keyword(char *str) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(keywords[i], str) == 0)
            return 1;
    }
    return 0;
}
%}

ID      [a-zA-Z_][a-zA-Z0-9_]*

%%
{ID}    {
            if (!is_keyword(yytext))
                printf("Identifier\t: %s\n", yytext);
        }
.|\n    { /* Ignore others */ }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}