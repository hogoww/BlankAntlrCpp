Easier Blank project setup for ANTLR grammar developpement in C++

install:  
-build antlr inside build file. (following the antlr readme : [WHERE_ANTLR_IS]/antlr4/runtime/Cpp/README.md)  
-rename this directory to "antlr4_runtime"
-mv build/runtime/CMakeFiles/antlr4_shared.dir/antlr4_runtime (newly named that way) inside project root  
-go inside src, and "make all" :) (It's NOT the default target)  

To read easily the current output of the program, use autoindent.py  
Add [...]/Project/src/scripts to your variable $PATH to use it  