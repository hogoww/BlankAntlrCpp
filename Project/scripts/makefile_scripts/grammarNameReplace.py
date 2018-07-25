#!/usr/bin/env python

import re;
import os;

grammar_name=raw_input("input your new grammar name :)\n")

def switchWordInFile(fileName,filePath,word,replacement):
    os.chdir(filePath)

    input_file=open("./"+fileName).read()
    output=open("./"+fileName+"~","w")

    output.write(re.sub(word,
                        replacement,
                        input_file))

    output.close()
    os.rename("./"+fileName+"~","./"+fileName)

    
switchWordInFile("Makefile",".","CPP14",grammar_name)
switchWordInFile("simpleMain.cpp",".","CPP14",grammar_name)

