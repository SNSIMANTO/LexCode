%{
#include <stdio.h>
#include <string.h>

char *keywords[] = {"int", "float", "return", "if", "else", "while", "for", "do", "break", "continue", "void", "char", "double"};
int is_keyword(char *str) {
    for(int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if(strcmp(keywords[i], str) == 0)
            return 1;
    }
    return 0;
}
%}

DIGIT       [0-9]
ID          [a-zA-Z_][a-zA-Z0-9_]*
OPERATOR    (\+|\-|\*|\/|\=|\+=|\-=|\/=|==|!=|<=|>=|<|>)
SEPARATOR   [\(\)\{\}\[\],;]
COMMENT     (\/\/[^\n]*|\/\*([^*]|\*+[^*/])*\*+\/)

%%

{COMMENT}       { printf("Comment\t\t: %s\n", yytext); }
{ID}            {
                    if (is_keyword(yytext))
                        printf("Keyword\t\t: %s\n", yytext);
                    else
                        printf("Identifier\t: %s\n", yytext);
                }
{DIGIT}+        { printf("Constant\t: %s\n", yytext); }
{OPERATOR}      { printf("Operator\t: %s\n", yytext); }
{SEPARATOR}     { printf("Separator\t: %s\n", yytext); }
[ \t\n]+        { /* skip whitespace */ }
.               { printf("Unknown\t\t: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    printf("Enter a line of code:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
