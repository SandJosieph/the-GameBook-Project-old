grammar Decoder;

decoder : 'Decoder' ;

codeBlock :  ;

//Variables//
variableDeclarations : 'variableDeclarations'
	| instance 
	| local 
	| global 
	;
		
instance : varNameValue ;
local : 'var' variableName (',' variableName)* ';' NL varNameValue+ ;
global : 'globalvar' variableName (',' variableName)* ';' NL varNameValue+ ;
	varNameValue : variableName '=' variableValue ';' NL ;

variableName : idWord ;
variableValue : idSpam ;
//EndVariable//

//KeyWords//
keyWords : 'keywords'
	| conditional
	| reactional 
	| additional
	| terminal
	;

conditional : 'conditional'
	| 'when' 
	| 'if' 
	| 'while' 
	| 'for' 
	;
reactional : 'reactional' 
	| 'do' 
	| 'repeat' 
	| 'with'
	;
additional : 'additional' 
	| 'else' 
	| 'and' 
	| 'or' 
	;
terminal : 'terminal' 
	| 'until' 
	| 'continue'
	| 'break' 
	| 'exit' 
	;
//EndKeyWords//

//Symbols//
operator : 'operator'
	| '=' //assign
	| '>' //greaterThan
	| '<' //lessThan
	| '!' //bang
	| '~' //tilde
	| '?' //question
	| ':' //colon
	| '==' //equal
	| '<=' //lessEqual
	| ( '=>' | '>=' ) //equalGreater
	| '!=' //notEqual
	| '&&' //and
	| '||' //or
	| '++' //increment 
	| '--' //decrement
	| '+'  //add	
	| '-'  //subtract
	| '*'  //multiply
	| '/'  //divide
	| '&'  //bitAnd
	| '|'  //bitOr
	| '^'  //caret
	| '%'  //modulo
		   //split
	| '+=' //addAssign
	| '-=' //subtractAssign
	| '*=' //multiplyAssign
	| '/=' //divideAssign
	| '&=' //andAssign
	| '|=' //orAssign
	| '^=' //xorAssign
	| '%=' //moduloAssign
	| '<<=' //lshiftAssign
	| ( '>>=' | '=>>' ) //rshiftAssign
	| ( '>>>=' | '=>>>' ) //urshiftAssign
	;

separator : 'separator'
	| '{' //LBrace
	| '(' //LParenth
	| '[' //LBracket
	| ']' //RBRacket
	| ')' //RParenth
	| '}' //RBrace

	| ';' //SemiColon
	| ',' //Comma
	| '.' //Dot
	;
	
AT : '@';
ELLIPSIS : '...';
//EndSymbols//

//Parser//
idSpam : BL3NUM+ ; // identificationSpam
codeSpam : ( separator | operator | idNum | idWord | idTitle | idFile )+ ;

idNum : ND ; // identificationNumber
idWord : LW ; // word
idName : LW BW+ ; // wordName
idTitle : BW+ ; // NameName
idFile : BL3NUM+ ; // file ID

BL3NUM : BL | LL | SD ;
//EndParser//

//Lexer//
BW : BL LL+ ; // BigWord
LW : LL+ ; // LittleWord

ND : Signed? SD+ ('.' SD+)? ; // NumberDigit. The "." is fixed at the center and the numbers expand out from there rather than float. When the number on the right hits "0" the number of the left increases by "1'
	Signed : 'm' ;

BL : [A-Z] ; // BigLetter
LL : [a-z] ; // LittleLetter
SD : [0-9] ; // SingleDigit

NL : ~[\r\n] ; // return newlines to parser (is end-statement signal)
WS : [ \t]+ -> skip ; // toss out whitespace

COMMENT : '/*' .*? '*/' -> channel(HIDDEN) ;
LINE_COMMENT : '//' ~[\r\n]* -> channel(HIDDEN) ;
//EndLexer//

iVars : 'clam chowder' ;

