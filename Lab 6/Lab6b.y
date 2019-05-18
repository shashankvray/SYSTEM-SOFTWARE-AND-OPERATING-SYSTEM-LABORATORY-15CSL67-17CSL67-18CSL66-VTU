/* 6.b) Write YACC program to recognize valid identifier, operators and keywords in the          given text (C program) file. */
%{
 #include<stdio.h>
 #include<stdlib.h>
 int id=0,dig=0,key=0,op=0;
%}
%token DIG ID KEY OP

%%
input:
 DIG input{dig++;}
|ID input{id++;}
|KEY input{key++;}
|OP input{op++;}
|DIG {dig++;}
|ID {id++;}
|KEY {key++;}
|OP {op++;} ;
%%

extern int yylex();
extern int yyparse();
extern FILE *yyin;
int main()
{
 FILE *fp=fopen("eg.c","r");
 if(!fp)
 {
  printf("File not found\n");
  return -1;
 }
 yyin=fp;
 do{
    yyparse();
 }while(!feof(yyin));
 printf("Numbers = %d\n Operators = %d\n Identifiers = %d\n Keywords = %d\n",dig,op,id,key);
}

int yyerror()
{
 printf("Error \n");
 exit(-1);
}
int yywrap()
{ }
