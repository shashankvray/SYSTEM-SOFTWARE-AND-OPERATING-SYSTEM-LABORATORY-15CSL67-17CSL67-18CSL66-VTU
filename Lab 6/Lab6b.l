/*6.b) Write YACC program to recognize valid identifier, operators and keywords in the given text (C program) file. */
%{
 #include <stdio.h>
 #include "y.tab.h"
 extern yylval;
%}

%%
[ \t] ;
[+|-|*|/|=|<|>] {printf("Operator is %s\n",yytext);return OP;}
[0-9]+ {yylval = atoi(yytext); printf("Number is %d\n",yylval); return DIG;}
int|char|bool|float|void|for|do|while|if|else|return|void {printf("Keyword is %s\n",yytext);return KEY;}
[a-zA-Z0-9]+ {printf("Identifier is %s\n",yytext);return ID;}
. ;
%%
