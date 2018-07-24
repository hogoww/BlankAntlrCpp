#!/usr/bin/env python

import re
import os
import sys
import readline

def help_display():
    print("""
Usage """+os.path.basename(__file__)+""" <filepath/filename>
      somecommand | """+os.path.basename(__file__)+"""

This script will take an ANTLR AST (from a file or standart input) and will indent it in a new file.
    """)


if (sys.stdin.isatty() and len(sys.argv)==1) or (len(sys.argv)>1 and sys.argv[1]=="-h"):
    help_display()
else:
    filename=""
    if len(sys.argv)==2:
        filename=sys.argv[1]
        input_file=open(filename)
        input_content=input_file.read()
        input_file.close()
        filename+=".i"
    else:
        filename="indentast.i"
        input_content=""
        for line in sys.stdin:
            input_content+=line
            

    output=open(filename,"w")
        
    input_content=re.sub("\(",
                         "\n(",
                         input_content)

    output.write(input_content)
    output.close()
    
    os.popen("indent.emacs "+os.getcwd()+"/"+filename+" 2>>/dev/null")
    os.popen("rm "+filename+"~")
    os.popen("emacs "+filename)

    #uncomment next block if you want to replace the spaces in front of the parenthesis.


    # input_file=open(arg)
    # input_content=input_file.read()
    # input_file.close()

    # input_content=re.sub("\t",
    #                      "     ",
    #                      input_content)

    # input_content=re.split("\n",input_content)
    # input_content=input_content=list(filter(lambda a: a!='',input_content))

    # replacing_char='|'
    # print(input_content)
    # output=open(arg,"w")
    # for i in range(len(input_content)):
    #     line=list(input_content[i])
    #     for j in range(len(line)):
    #         if line[j]==' ':
    #             line[j]=replacing_char
    #         else:
    #             break

    #     output.write("".join(line)+"\n")
    # output.close()



