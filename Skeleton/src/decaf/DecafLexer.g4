/*
 * Skeleton code for your Lexer, provided by Emma Norling, 
 * 		extended by Miles Schofield
 *
 */
lexer grammar DecafLexer;

// These rules match
// all of the reserved words for Decaf (case sensitive) 
CLASS : 'class';
BOOLEAN : 'boolean';
BREAK : 'break';
CALLOUT : 'callout'; 
CONTINUE : 'continue';
ELSE : 'else';
FOR : 'for';
IF : 'if';
RETURN : 'return';
VOID : 'void'; 
INT : 'int';

// These rules deal with individual characters 
// that have special meaning in Decaf
LCURLY : '{';
RCURLY : '}';
SEMICOLON : ';';
LSQRBRK : '[';
RSQRBRK : ']';
COMMA : ',';
LPAREN : '(';
RPAREN : ')';
UNDERSCORE: '_';
ASSIGNOPERATOR : '=';
ARITHPLUS: '+';
ARITHMINUS: '-'; 
EXCLMRK: '!'; 
ARITHMOD: '%';
ARITHDIV: '/';
ARITHMULT: '*'; 
GRTTHAN: '>';
LESTHAN: '<';
GRTEQUAL: '>=';
LESEQUAL: '<='; 
EQUALOP: '=='; 
NOTEQUAL: '!='; 
AND: '&&';
OR: '||'; 

// This rule says a boolean can hold the values of true or false, and nothing else. 
BOOL_LITERAL : (TRUE | FALSE);

// This rule shows that ID must start with a letter or underscore, then
// any combination of digits, letters or underscores. 
ID : (ALPHA|'_') (ALPHA_NUM|'_')*;


// This rule simply ignores any space, tab or newline characters, 
// as well as comments and new page. 
WS_ : (' ' | '\t' | '\n' | SL_COMMENT | '\f' )+ -> skip;


// This rule ignores comments (everything from a '//' to the end of the line)
SL_COMMENT : '//' (~'\n')* '\n' -> skip;

// These two rules completely describe characters and strings, 
// and make use of the ESC and NOTESC fragments described below
// Character literals are composed of a char in single quotes
CHAR_LITERAL : '\'' (ESC|NOTESC) '\'';
STRING_LITERAL : '"' (ESC|NOTESC)+ '"';

// This rule says an  integer of either decimal or hex type
// negatives are handled in the PARSER by UNARY MINUS expr rules 
// a negative lexer token is not used 
INT_LITERAL : (DECIMAL_LITERAL|HEX_LITERAL);

// A rule that is marked as a fragment will NOT have a token created for it
fragment
HEX_LITERAL : '0x' HEX_DIGIT+; 

// ESC matches single quotes, double quotes, backslash, double backslashes, as well
// the escape character for two character sequences such as newline, new tab and comment
// preceded by double backslashes 
fragment 
ESC :  '\\' ('"'|'n'|'t'|'\''|'\\');

// NOTESC matches single quotes, double quotes, backslash, double backslashes, as well
// the escape character for two character sequences such as newline, new tab and comment
fragment
NOTESC : ~('"'|'\n'|'\t'|'\''|'\\');

fragment
ALPHA_NUM : (ALPHA | DIGIT) ;

fragment 
ALPHA : ([a-z]|[A-Z]); 

fragment 
DIGIT : [0-9];

fragment 
HEX_DIGIT : (DIGIT|[a-f]|[A-F]);

fragment 
DECIMAL_LITERAL : DIGIT+ ;

fragment
FALSE : 'false';

fragment
TRUE : 'true';