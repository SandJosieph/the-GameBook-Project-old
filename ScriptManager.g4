grammar ScriptManager;
import Decoder;

scriptManager :;

actionLine : ( condition '::' )? actions ;
	condition : conditional ;
	actions : (( singleAction | actionList ) NL)+ ;
		singleAction : statement NL ;
		actionList : '{' singleAction+ '}' ;

statement : reactional codeBlock additions ';' ;
	additions : additional codeBlock | terminal ;