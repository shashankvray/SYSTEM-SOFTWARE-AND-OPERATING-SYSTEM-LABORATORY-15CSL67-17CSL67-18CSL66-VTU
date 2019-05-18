/*1.a) Write a LEX program to recognize valid arithmetic expression. Identifiers in the expression
could be only integers and operators could be + and *. Count the identifiers & operators present
and print them separately.*/

%{
 int id=0,d=0,op=0,plus=0,min=0,mul=0,dv=0,top=-1,valid=1;
 char st[50];
%}

%%
[0-9]+ {d++;}
[_a-zA-Z]+ {id++;}
[+] {op++;plus++;}
[-] {op++;min++;}
[*] {op++;mul++;}
[/] {op++;dv++;}
\{ {st[++top]='{';}
\} {if(st[top--]!='{') valid=0;}
\[ {st[++top]='[';}
\] {if(st[top--]!='[') valid=0;}
\( {st[++top]='(';}
\) {if(st[top--]!='(') valid=0;}
%%

int main()
{
 printf("Enter Expression:\n");
 yylex();
 if(valid==1&&top==-1&&((d+id)==op+1||op==1))
 {
  printf("Valid Expression\n");
  printf("No. of Identifiers:%d\n",id);
  printf("No. of Digits:%d\n",d);
  printf("No. of Operators:%d\n",op);
  printf("Plus Operators(+):%d\n",plus);
  printf("Minus Operators(-):%d\n",min);
  printf("Multiplication Operators(*):%d\n",mul);
  printf("Division Operators:%d\n",dv);
 }
 else
     printf("Invalid Expression\n");
 return 0;
}
//Note: Press CTRL + D after entering the input to display the output.
