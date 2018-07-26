grammar integer_declaration;

//regles de parseurs
entry_rule
:
	integer_declaration* EOF
;

integer_declaration
:
	Integer_type Identifier SemiColon
;

//Lexer rules, they generate tokens that'll be atoms in the parser
Integer_type
:
	'int'
;

Identifier//trivial example, and incomplete
:
	[a-zA-Z]+
;

SemiColon
:
	';'
;
