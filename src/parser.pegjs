contract= article_list
article_list= article+
article= 'ARTICLE' _ ':' _ symbol _ '.' _ stmt_list _ 'PARAMETERS' _ ':' _
 parameters _ 'CONSTRUCTOR' _ ':' _ stmt_list chapters _
 / 'ARTICLE' _ ':' _ symbol _ '.' _ stmt_list chapters
 / 'ARTICLE' _ ':' _ symbol _ '.' _ chapters
chapters= chapter+
chapter= 'CHAPTER' _  ':' _ signature _ '.' _  stmt_list
signature= _ symbol _
 / _  symbol _  arguments _
arguments= argument+ _ filler _  argument+
argument= type
 / symbol _  typedef
filler= 'TO' / 'FROM'
parameters = commented_parameter _ '.' _ / _ parameter+ _ commented_parameter _ '.' _
commented_parameter= parameter+ _  / _ comment _ '.' _ parameter+ _
parameter= symbol _  ':' _ typedef
comment= 'COMMENT' _  ':' _ [a-zAZ0-9 ]* _
definition= symbol _  ':' _  typedef
provision= 'PROVIDED' _ ':' _ '('? _ boolexpr _')'? _'.'
typedef= 'MAP' __  type __  'TO' __  type _  / type _
type= _ 'id' _  / _  'amount' _
symbol=  _ sym:[a-zA-Z]+ _ {return sym.join("")}
stmt= _  '.' _
 / _  expr _ '.' _
 / _ definition _ '.' _
 / _ provision _
 / _ 'LOG' __ expr _ '.' _
 / _ VARIABLE __ '=' _ expr _ '.' _
 / _ lval __ '=' expr _ '.' _
 / _ 'WHILE' __ boolexpr _ ':' _ stmt _
 / _ 'IF' __ boolexpr _ ':' _ stmt _
 / _ 'IF' __ boolexpr _ ':' _ stmt __'ELSE' __ stmt _
 / _ '(' _ stmt_list _ ')'_
 / comment
stmt_list= stmt+

boolexpr= expr __ '<' __  expr _
 / expr __ '>'  __  expr _
 / expr __ 'GE' __ expr _
 / expr __ 'LE' __ expr _
 / expr __ 'NE' __ expr _
 / expr __ 'EQ' __ expr _


expr=
 expr1 _ /
 '-' _ expr1
 / expr1 __ 'ADDED' __ filler _ expr1 _
 / expr1 _ '+' _ expr1 _
 / expr1 _ '-' _ expr1 _
 / 'SUBTRACT' __ expr1 __ 'FROM' __ lval _
 / 'ADD' __ expr1 __ 'TO' __ lval _
 / expr1 _ '*' _ expr1 _
 / expr1 _ '/' _ expr1 _
 / '(' _ expr1 _ ')'_
 / lval

expr1= INTEGER / VARIABLE / type

lval= symbol _
 / symbol __ 'OF' __ symbol

INTEGER = i:('-')? _ [0-9]+ {return parseInt(i,10) }
VARIABLE =  symbol _

 comma = _ "," _
// optional whitespace
_  = [ \t\r\n]*

// mandatory whitespace
__ = [ \t\r\n]+
