

D   [0-9]

NZ  [1-9]

L   [a-zA-Z_]

A   [a-zA-Z_0-9]

WS  [\t\v\n\f]

intconst [+\-]?{D}+

realconst [+\-]?{D}+\.{D}+(e[+\-]?{D}+)?

charconst  'ch'

stringconst "{ch}"

exponential [eE][-+]?

%option yylineno

%{  

#include <stdio.h> 

#include <stdlib.h> 

#include <string.h>   

int yywrap(); 



void printToken(char* type){

fprintf(yyout,"token Class=\"%s\" Token=\"%s\"\n", type,yytext);

}


%}

%%




"if"			{printToken("Keyword"); }

"else"		         {printToken("Keyword");}

"while"		         {printToken("Keyword");}

"return"		 {printToken("Keyword");}

"void"			 {printToken("keyword");}

"int"			 {printToken("int_lit");}

"float"		         {printToken("float_lit");}

"double"                 {printToken("double_lit");}



"++"			 {printToken("INC_OP");} 

"--"			 {printToken("DEC_OP");} 

"+"		         {printToken("PLUS_OP");}     

"-"			{printToken("MINUS_OP");}     

"*"		        {printToken("STAR_OP");}     

"/"		        {printToken("SLASH_OP");}     

"<"		        {printToken("LESS_THAN_OP");}     

"<="		      {printToken("LESS_THAN_EQUAL_OP");} 

">"		     {printToken("GREATER_THAN_OP");}     

">="		    {printToken("GREATER_THAN_EQUAL_OP");} 

"=="		    {printToken("EQUAL_OP");} 

"!="	            {printToken("NOT_EQUAL_OP");} 

"="		    {printToken("ASSIGNMENT_OP");}     



("[")		   {printToken("OPEN_SQUARE_BRACKET");}

("]")		   {printToken("CLOSE_SQUARE_BRACKET");}

("{")		   {printToken("OPEN_BRACE");}

("}")		   {printToken("CLOSE_BRACE");}

";"	           {printToken("SEMI_COLON");}

","		   {printToken("COMMA");}

("(")		   {printToken("OPEN_BRACKET");}

(")")	           {printToken("ClOSE_BRACKET");}



{L}{A}*		   {printToken("ID");}

{D}+		   {printToken("DIGIT");}



{WS}+		   {printToken("White_Space");}

(".")+	           {printToken("dot");}

{exponential}+     {printToken("exponent");}

{intconst}+       {printToken("int_const");}

{realconst}+      {printToken("real_const");}

{charconst}+      {printToken("char_const");}

{stringconst}+    {printToken("string_const");}

%%

#include<stdio.h>

int yywrap() {

    return 1;

}



int main(int argc,char *argv[])
{

if (argc > 1)

{

    FILE *fp;

    fp = fopen(argv[1], "r");

    if (!fp)

    {

        fprintf(stderr, "failed open");

        exit(1);

    }
   yyin = fp;

}

printf("Start Scaning\n");
printf("Enter Input:\n");

 
yylex();



return 0; 

} 



