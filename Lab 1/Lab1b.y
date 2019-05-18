/*1.b) Write YACC program to evaluate arithmetic expression 
       involving operators: +, -, *, and /.*/
%{
  #include<stdio.h>
  #include<stdlib.h>
%}

%token NUM
%left '+''-'
%left '*''/'

%%

start:exp {printf("%d\n",$$);}
exp:exp'+'exp { $$ = $1+$3; }
|exp'-'exp { $$ = $1-$3; }
|exp'*'exp { $$ = $1*$3; }
|exp'/'exp
{
 if($3==0)
 {
  yyerror();
  exit(0);
 }
 else
 {
  $$ = $1/$3;
 }
}
|'('exp')' { $$=$2; }
|NUM { $$=$1; }
;
%%

int main()
{
 printf("Enter the Expression:\n");
 yyparse();
 return 0;
}
int yywrap() { return 0; }
int yyerror()
{
 printf("Error\n");
 return -1;
}
