grammar CPP14
    
/*PARSER*/

//entry rule
translationunit
    :
    someRule EOF
    ;

someRule
    :
    Lexer_rule
    ;

/*LEXER*/

Lexer_rule
    :
    "something"
    ;
    