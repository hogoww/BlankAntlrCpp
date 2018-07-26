#!/usr/bin/env python

import re;
import os;

grammar_name=raw_input("input your new grammar name :)\n")

#general function for reusable use
def switchWordInFile(fileName,filePath,word,replacement):
    os.chdir(filePath)

    input_file=open("./"+fileName).read()
    output=open("./"+fileName+"~","w")

    output.write(re.sub(word,
                        replacement,
                        input_file))

    output.close()
    os.rename("./"+fileName+"~","./"+fileName)


def createBasicGrammarFile(grammar_name):
    output_file=open("./grammar/"+grammar_name+".g4","w")
    output_file.write("grammar "+grammar_name+"""
    
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
    """)
    output_file.close()

    
switchWordInFile("Makefile",".","CPP14",grammar_name)
switchWordInFile("simpleMain.cpp",".","CPP14",grammar_name)

createBasicGrammarFile(grammar_name)
