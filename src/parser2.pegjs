contract= article_list
article_list= article+
article= 'ARTICLE' ':' 'SYMBOL' '.' stmt_list 'PARAMETERS' ':'
 parameters 'CONSTRUCTOR' ':' stmt_list chapters
 / 'ARTICLE' ':' 'SYMBOL' '.' stmt_list chapters
 / 'ARTICLE' ':' 'SYMBOL' '.' chapters
chapters= chapter+
chapter= 'CHAPTER' ':' signature '.' stmt_list
signature= symbol
 / symbol arguments
arguments= argument+ filler argument+
argument= type
 / symbol typedef
filler= 'TO'
 / 'FROM'
parameters = commented_parameter '.' / parameter+ commented_parameter '.'
commented_parameter= parameter+ / comment '.' parameter+
parameter= symbol ':' typedef
comment= 'COMMENT'
definition= symbol ':' typedef
provision= 'PROVIDED' ':' boolexpr '.'
typedef= 'MAP' type 'TO' type / type
type= 'ID' / 'AMOUNT'
symbol= 'SYMBOL'
stmt= '.'
 / expr '.'
 / definition '.'
 / provision
 / 'LOG' expr '.'
 / 'VARIABLE' '=' expr '.'
 / lval '=' expr '.'
 / 'WHILE' expr ':' stmt
 / 'IF' expr ':' stmt
 / 'IF' expr ':' stmt 'ELSE' stmt
 / '(' stmt_list ')'
 / 'COMMENT'
stmt_list= stmt+
boolexpr= expr '<' expr
 / expr '>' expr
 / expr 'GE' expr
 / expr 'LE' expr
 / expr 'NE' expr
 / expr 'EQ' expr
 / '(' boolexpr ')'
expr= 'INTEGER'
 / 'VARIABLE'
 / type
 / '-' expr
 / 'SUBTRACT' expr 'FROM' lval
 / 'ADD' expr 'TO' lval
 / '(' expr ')'
 / lval


lval= symbol
 / symbol 'OF' symbol

