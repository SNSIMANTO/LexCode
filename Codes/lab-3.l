%{
#include<stdio.h>
int lines = 0, words = 0, small_letters=0, capital_letters=0, digit=0, special_char=0, total =0;
%}
%%
\n {lines++; words++;}
[\t ' '] words++;
[A-Z] capital_letters++;
[a-z] small_letters++;
[0-9] digit++;
. special_char++;
%%
int main(void) {
	yyin = fopen("input.txt", "r");
    yylex();
    total = small_letters+capital_letters+digit+special_char;
    printf(" This file contains ...");
    printf("\n\t%d lines", lines);
    printf("\n\t%d words", words);
    printf("\n\t%d small letters", small_letters);
    printf("\n\t%d capital letters", capital_letters);
    printf("\n\t%d digits", digit);
    printf("\n\t%d special character", special_char);
    printf("\n\t%d total", total);

}
int yywrap()
{
	return 1;
}