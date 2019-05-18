/*2. Develop, Implement and execute a program using YACC tool to recognize all strings ending with
b preceded by n a’s using the grammar a n b (note: input n value). */
%{
 #include "y.tab.h"
%}

%%
a {return A;}
b {return B;}
[_c-zC-Z] {return 0;}
[\n] {return '\n';}
%%

int yywrap(void) {}
