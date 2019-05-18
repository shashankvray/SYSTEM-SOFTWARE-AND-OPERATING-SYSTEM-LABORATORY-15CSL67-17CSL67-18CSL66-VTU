/*4. Design, develop and implement YACC/C program to demonstrate Shift Reduce Parsing technique for the 
grammar rules: E → E+T | T, T → T*F | F, F → (E) | id and parse the sentence: id + id * id. */ 
#include<stdio.h>
#include<string.h>
int k=0,z=0,i=0,j=0,c=0;
char a[16],ac[20],stk[15],act[10];
void check();
void main()
{
	printf("Grammar: \n E->E+T|T \n T->T*F|F \n F->(E)|id\n");
	printf("Enter the input string\n");
	scanf("%s",a);
	c=strlen(a);
	strcpy(act,"SHIFT->");
	printf("Stack \t Input \t\t Action\n");
	printf("$\t %s$",a); //Initial contents of the input buffer
	for(k=0,i=0;j<c;k++,i++,j++)
	{
		if(a[j]=='i' && a[j+1]=='d')
		{
			stk[i]=a[j];
			stk[i+1]=a[j+1];
			stk[i+2]='\0';
			a[j]=' ';
			a[j+1]=' ';
			printf("\n$%s\t%s$\t%s id",stk,a,act);
			check();
		}
		else
		{
			stk[i]=a[j];
			stk[i+1]='\0';
			a[j]=' ';
			printf("\n$%s\t%s$\t%s symbol",stk,a,act);
			check();
		}
	}printf("\n");
	getchar();
}

void check()
{
	strcpy(ac,"REDUCE");
	for(z=0;z<c;z++)
		if(stk[z]=='(' && stk[z+1]=='E'&& stk[z+2]==')')
		{
			stk[z]='F';
			stk[z+1]='\0';
			stk[z+2]='\0';
			printf("\n$%s\t%s$\t%s by F->(E)",stk,a,ac);
			i=i-2;
		}
	for(z=0;z<c;z++)
		if(stk[z]=='i' && stk[z+1]=='d')
		{
			stk[z]='F';
			stk[z+1]='\0';
			printf("\n$%s\t%s$\t%s by F->id",stk,a,ac);
			j++;
		}
	for(z=0;z<c;z++)
	{
		if(stk[z]=='T' && stk[z+1]=='*' && stk[z+2]=='F')
		{
			stk[z]='T';
			stk[z+1]='\0';
			stk[z+2]='\0';
			printf("\n$%s\t%s$\t%s by T->T*F",stk,a,ac);
			i=i-2;
		}
		else if(stk[z]=='F')
		{
			stk[z]='T';
			printf("\n$%s\t%s$\t%s by T->F",stk,a,ac);
		}
	}
	for(z=0;z<c;z++)
	{
		if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='T' && stk[z+3]=='*')
			break;
		if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='T')
			if(a[j+1]=='*')
				break;
			else
			{
				stk[z]='E';
				stk[z+1]='\0';
				stk[z+2]='\0';
				printf("\n$%s\t%s$\t%s by E->E+T",stk,a,ac);
				i=i-2;
			}
			else if(stk[z]=='T')
			{
                if(stk[z+1]=='*'|| a[j+1]=='*')
                        break;
				stk[z]='E';
				printf("\n$%s\t%s$\t%s by E->T",stk,a,ac);
			}
		}
}
