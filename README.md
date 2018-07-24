C++ project to create tools for C++ developpement.  

install:  
-build antlr inside build file. (following the antlr readme : [WHERE_ANTLR_IS]/antlr4/runtime/Cpp/README.md)  
-rename this directory to "antlr4_runtime"
-mv build/runtime/CMakeFiles/antlr4_shared.dir/antlr4_runtime (newly named that way) inside project root  
-go inside src, and make all :) (It's not the default target)  

To read easily the current output of the program, use autoindent.py  
Add [...]/Inane/src/scripts to your $PATH to use it  