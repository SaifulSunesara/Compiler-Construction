# Compiler-Construction

Introduction:
The compiler proposed here is for a close variant of Pascal known as Pascal-P. Rather than producing code for any particular machine, it produces code, that has come to be called 'P-code', for a hypothetical stack-based computer that is in many ways ideal for Pascal compilation. A Lex file will be created (.l), a YACC file for a grammar (parser), a symbol table file that holds our insert() and lookup() methods for the symbol records, as well as a code generation.
 
Tokens in C:-
Tokens in C is the most important element to be used in creating a program in C. We can define the token as the smallest individual element in C. For `example, we cannot create a sentence without using words; similarly, we cannot create a program in C without using tokens in C. Therefore, we can say that tokens in C is the building block or the basic component for creating a program in C language.
Classification of Token’s in C:-
•	Keywords:- const,break,do,continue,struct,int,if,typedef ,etc
•	Identifiers:- a-z , A-Z , 0-9 (_).etc
•	Constants:- 
Integer constant :-10, 11, 34, etc.
Floating-point constant	45.6, 67.8, 11.2, etc.
Octal constant	011, 088, 022, etc.
Hexadecimal constant	0x1a, 0x4b, 0x6b, etc.
Character constant	'a', 'b', 'c', etc.
String constant	"java", "c++", ".net", etc.
•	Strings:- char a[8] = "Compiler";
•	Special symbols:-[],(),~,*,.,{},,etc.
•	Operators:- ->,++/–,+/-,!~,(type),*,&,sizeof etc.	


Context Free Grammer:-

Mini PASCAL Grammar,  

program ::= program id ( identifier_list ) ;
  	    declarations
	    subprogram_declarations
	    compound_statement
	    .

identifier_list ::= id
	| identifier_list , id
declarations ::= declarations var identifier_list : type ;
	| lambda


type ::= standard_type
	| array [ num .. num ] of type


standard_type ::= integer
	| real
        | string


subprogram_declarations ::=
	subprogram_declarations subprogram_declaration ;
	| lambda


subprogram_declaration ::=
	subprogram_head 
	declarations 			
        compound_statement

subprogram_head ::= function id arguments : standard_type ;
	| procedure id arguments ;


arguments ::= ( parameter_list )
	| lambda


parameter_list ::= identifier_list : type
	| parameter_list ; identifier_list : type


compound_statement ::= begin
		       optional_statements
		       end


optional_statements ::= statement_list
	| lambda


statement_list ::= statement
	| statement_list ; statement


statement ::= variable := expression
	| procedure_statement
	| compound_statement
	| if expression then statement else statement
	| while expression do statement


variable ::= id tail

tail     ::= [ expression ] tail
	| lambda 


procedure_statement ::= id
	| id ( expression_list )


expression_list ::= expression
	| expression_list , expression


expression ::= simple_expression
	| simple_expression relop simple_expression


simple_expression ::= term
	| simple_expression addop term


term ::= factor
	| term mulop factor


factor ::= id tail
	| id ( expression_list )
	| num
	| ( expression )
	| not factor


addop ::= + | -


mulop ::= * | /

relop ::= <
	| >
	| =
	| <=
	| >=
	| !=

%% end of grammar


Objective:-
The overall objective is to design a Mini Pascal Compiler in c using flex/bison which will take input of any Keywords ,Identifiers ,Strings,  Operators, Constants, Special Characters in C and will tell which Token Class the it belongs.
Software used:- Ubuntu 18.04 for VMware, Flex,YACC 
 
