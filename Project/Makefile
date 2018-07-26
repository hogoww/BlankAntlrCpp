#ANTLR paths
ANTLR_HEADER_PATH=../antlr4_runtime_src/
ANTLR_SOURCE_PATH=../antlr4_runtime/
ANTLR_EXE=../../antlr-4.7-complete.jar #path from grammar_path for this file only

#Grammar stuff
GRAMMAR_NAME=CPP14
GRAMMAR_FILE_NAME=$(GRAMMAR_NAME).g4
GRAMMAR_PATH=grammar/
GRAMMAR_OBJECT_PATH=grammar/obj/

#Compilation stuff
CC=g++
PROJECT_OPTIONS=-std=c++14 -Wall
GRAMMAR_OPTIONS=-std=c++14
MAIN_NAME=main
SIMPLEMAIN_NAME=simpleMain

ANTLR_HEADERS=-I $(ANTLR_HEADER_PATH)
ANTLR_HEADERS_SURDIR=-I ../$(ANTLR_HEADER_PATH)
GRAMMAR_HEADER_SURDIR=-I ../$(GRAMMAR_PATH)
ANTLR_RUNTIME_OBJECT=$(ANTLR_SOURCE_PATH)*.o $(ANTLR_SOURCE_PATH)tree/*.o $(ANTLR_SOURCE_PATH)tree/xpath/*.o $(ANTLR_SOURCE_PATH)tree/pattern/*.o $(ANTLR_SOURCE_PATH)misc/*.o $(ANTLR_SOURCE_PATH)dfa/*.o $(ANTLR_SOURCE_PATH)atn/*.o $(ANTLR_SOURCE_PATH)support/*.o

PROJECT_RUNTIME_OBJECTS=$(PROJECT_OBJECTS)*.o

#projects directories paths
PROJECT_SOURCES=src/
PROJECT_OBJECTS=obj/
TEST_DIRECTORY=tests/

default_target: project #generaly more usefull in the developpement process
.PHONY : default_target

#############################################
#Build the external files to be linked later#
#############################################
project_sources_compilation:
	cd $(PROJECT_SOURCES) &&\
	 $(CC) $(GRAMMAR_HEADER_SURDIR) $(PROJECT_RUNTIMER_PROJECT) $(ANTLR_HEADERS_SURDIR) $(PROJECT_OPTIONS) -c *.cpp &&\
	 mv *.o ../$(PROJECT_OBJECTS)
.PHONY : project_sources_compilation

#############################
#Build only the project part#
#############################
project:
	@echo "---------------------"
	@echo "|Generating Project |"
	@echo "---------------------"
	@make project_sources_compilation
	@rm $(GRAMMAR_PATH)$(MAIN_NAME).o $(GRAMMAR_PATH)$(SIMPLEMAIN_NAME).o 2>>/dev/null || true #doesn't let that lines error stop compilation. It's not supposed to exist on the first build.
	$(CC) $(ANTLR_HEADERS) -I $(PROJECT_PROJECT) $(GRAMMAR_PATH) $(PROJECT_OPTIONS) -c $(MAIN_NAME).cpp
	@make linking
	@echo ""
	@echo "Compilation of the project finished!"
.PHONY : project

linking:
	$(CC) $(ANTLR_HEADERS) $(ANTLR_RUNTIME_OBJECT) $(PROJECT_RUNTIME_OBJECTS) $(GRAMMAR_OBJECT_PATH)*.o $(PROJECT_OPTIONS) $(MAIN_NAME).o -o $(MAIN_NAME)
	@echo ""
	@echo "Compilation of the project finished!"
.PHONY:linking

#######################################
#clean the grammar before compiling it#
#######################################

#"clean grammar"
cg: 
	@echo "--------------------------"
	@echo "|Generating clean grammar|"
	@echo "--------------------------"
	@make clean_grammar_directory
	cd $(GRAMMAR_PATH) && java -jar $(ANTLR_EXE) -Dlanguage=Cpp $(GRAMMAR_FILE_NAME)
#	$(GRAMMAR_PATH)/parseur_correction.py
	@make gc
.PHONY : cg


##########################
#Grammar Compilation Unit#
##########################

#"Grammar compilation"
gc:
	@echo "------------------------"
	@echo "|compiling that grammar|"
	@echo "------------------------"
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)Parser.cpp
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)Lexer.cpp
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)BaseListener.cpp$
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)Listener.cpp
	mv $(GRAMMAR_PATH)$(GRAMMAR_NAME)*.o $(GRAMMAR_PATH)obj/ 
.PHONY : gc

###################################################################
#Clean working directory and redo every compilation unit necessary#
###################################################################

#"clean compilation"
cc:
	@make clean
	@make all
.PHONY : cc

##############################################################
#Clean the working directories of objects and temporary files#
##############################################################

#"clean working directories"
clean:
	@echo "----------------------"
	@echo "|Cleaning directories|"
	@echo "----------------------"	
	@cd $(PROJECT_OBJECTS) && rm -rf *.o || true
	@make clean_grammar_directory || true
	@cd $(PROJECT_SOURCES) && rm -f *~ \#* || true
	@rm -f *~ \#* || true
.PHONY : clean

############################################################################
#remove everything but the grammar file and makefile from grammar directory#
############################################################################

clean_grammar_directory:
	@cd $(GRAMMAR_PATH) && rm -f *.cpp *.h *.o *.tokens *~ \#* 2>>/dev/null || true
	@cd $(GRAMMAR_OBJECT_PATH) && rm -f *.o || true
.PHONY : clean_grammar_directory

###############################################
#clean grammar build, and link with basic main#
###############################################
grammar_test:
	@echo "------------------------------"
	@echo "|Building simple grammar_test|"
	@echo "------------------------------"
	@make cg
	$(CC) $(ANTLR_HEADERS) $(PROJECT_OPTIONS) -c $(SIMPLEMAIN_NAME).cpp
	$(CC) $(ANTLR_HEADERS) $(ANTLR_RUNTIME_OBJECT) $(PROJECT_RUNTIME_OBJECTS) $(GRAMMAR_OBJECT_PATH)*.o $(PROJECT_OPTIONS) $(SIMPLEMAIN_NAME).o -o $(SIMPLEMAIN_NAME)
.PHONY: grammar_test


##############################################################
#          Used the first time the project's build           #
#Clean up everything, and recompile every part of the project#
##############################################################
all:
	@make cg
	@make project
.PHONY : all


#####################################################
#Rule used to initialize directory for a new grammar#
#   /!\   DO NOT USE ON WORKING DIRECTORY    /!\    #
#####################################################
new_grammar: #should add some kind of verifications

	@rm -rf $(PROJECT_OBJECTS)* 2>>/dev/null || true
	@cd $(PROJECT_OBJECTS) && echo "file used so the repositories keep existing empty on git" >> bogus.txt

	@rm -rf $(PROJECT_SOURCES)* 2>>/dev/null || true
	@cd $(PROJECT_SOURCES) && echo "file used so the repositories keep existing empty on git" >> bogus.txt

	@rm -f $(GRAMMAR_PATH)* 2>>/dev/null || true
	@cd $(GRAMMAR_PATH) && echo "file used so the repositories keep existing empty on git" >> bogus.txt

	@rm -f $(GRAMMAR_OBJECT_PATH)* 2>>/dev/null || true
	@cd $(GRAMMAR_OBJECT_PATH) && echo "file used so the repositories keep existing empty on git" >> bogus.txt

	@rm -rf $(TEST_DIRECTORY)* 2>>/dev/null || true
	@cd $(TEST_DIRECTORY) && echo "file used so the repositories keep existing empty on git" >> bogus.txt

	@rm -f *.cpp *.h *.o *~ || true

	@cp ../ressources/simpleMain.cpp .

	@cp ../ressources/integer_declaration.g4 ./grammar

	@cp ../ressources/MakefileGrammar ./grammar
	@mv ./grammar/MakefileGrammar ./grammar/Makefile

	@cp ../ressources/MakefileSrc ./src
	@mv ./src/MakefileSrc ./src/Makefile

	@./scripts/makefile_scripts/grammarNameReplace.py

	@mv simpleMain.cpp $(SIMPLEMAIN_NAME) #switch name after simpleMain is modified by the script

	@echo "Grammar squeletton available in ./grammar"
.PHONY : new_grammar
