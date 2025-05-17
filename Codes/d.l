%{
#include <stdio.h>
%}

%%
"if" { printf("KEYWORD: %s\n", yytext); }
"else" { printf("KEYWORD: %s\n", yytext); }
"while" { printf("KEYWORD: %s\n", yytext); }

[0-9]+ { printf("NUMBER: %s\n", yytext); }

[a-zA-Z]+ { printf("WORD: %s\n", yytext); }

[ \t\n]+ ;
.	{ printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
	yylex();
}
int yywrap()
{
	return 1;
}