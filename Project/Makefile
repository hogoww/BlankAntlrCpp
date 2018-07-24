ANTLR_HEADER_PATH=../antlr4_runtime_src/
ANTLR_SOURCE_PATH=../antlr4_runtime/
ANTLR_EXE=../../antlr-4.7-complete.jar #path from grammar_path for this file only
TEST_DIRECTORY=./tests

GRAMMAR_PATH=grammar/
GRAMMAR_OBJECT_PATH=grammar/obj/
GRAMMAR_NAME=CPP14
GRAMMAR_FILE_NAME=$(GRAMMAR_NAME).g

CC=g++
PROJECT_OPTIONS=-std=c++14 -Wall
GRAMMAR_OPTIONS=-std=c++14

ANTLR_HEADERS=-I $(ANTLR_HEADER_PATH)
ANTLR_HEADERS_SURDIR=-I ../$(ANTLR_HEADER_PATH)
GRAMMAR_HEADER_SURDIR=-I ../$(GRAMMAR_PATH)
ANTLR_RUNTIME_OBJECT=$(ANTLR_SOURCE_PATH)*.o $(ANTLR_SOURCE_PATH)tree/*.o $(ANTLR_SOURCE_PATH)tree/xpath/*.o $(ANTLR_SOURCE_PATH)tree/pattern/*.o $(ANTLR_SOURCE_PATH)misc/*.o $(ANTLR_SOURCE_PATH)dfa/*.o $(ANTLR_SOURCE_PATH)atn/*.o $(ANTLR_SOURCE_PATH)support/*.o

PROJECT_RUNTIME_OBJECTS=$(PROJECT_OBJECTS)*.o


PROJECT_SOURCES=src/
PROJECT_OBJECTS=obj/


default_target: inane
.PHONY : default_target

inane_sources:
	cd $(PROJECT_SOURCES) &&\
	 $(CC) $(GRAMMAR_HEADER_SURDIR) $(PROJECT_RUNTIMER_PROJECT) $(ANTLR_HEADERS_SURDIR) $(PROJECT_OPTIONS) -c *.cpp &&\
	 mv *.o ../$(PROJECT_OBJECTS)
.PHONY : inane_sources

#build only the Inane project
inane:
	@echo "--------------------------"
	@echo "|Generating Inane Project|"
	@echo "--------------------------"
	@make inane_sources
	@rm $(GRAMMAR_PATH)main.o $(GRAMMAR_PATH)simpleMain.o 2>>/dev/null || true #doesn't let that lines error stop compilation. It's not supposed to exist on the first build.
	$(CC) $(ANTLR_HEADERS) -I $(PROJECT_PROJECT) $(GRAMMAR_PATH) $(PROJECT_OPTIONS) -c main.cpp
#	@mv main.o $(GRAMMAR_PATH)
	@make linking
.PHONY : inane

linking:
	$(CC) $(ANTLR_HEADERS) $(ANTLR_RUNTIME_OBJECT) $(PROJECT_RUNTIME_OBJECTS) $(GRAMMAR_OBJECT_PATH)*.o $(PROJECT_OPTIONS) main.o -o main
.PHONY:linking

#"clean grammar", build the grammar with the antlr tool.
cg: 
	@echo "--------------------------"
	@echo "|Generating clean grammar|"
	@echo "--------------------------"
	@make clean_grammar_directory
	cd $(GRAMMAR_PATH) && java -jar $(ANTLR_EXE) -Dlanguage=Cpp $(GRAMMAR_FILE_NAME)
#	$(GRAMMAR_PATH)/parseur_correction.py
	@make gc
.PHONY : cg

#"Grammar compilation"
gc:
	@echo "------------------------"
	@echo "|compiling that grammar|"
	@echo "------------------------"
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)Parser.cpp
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)Lexer.cpp
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)BaseListener.cpp$
	cd $(GRAMMAR_PATH) && $(CC) $(ANTLR_HEADERS_SURDIR) $(GRAMMAR_OPTIONS) -c $(GRAMMAR_NAME)Listener.cpp
	mv $(GRAMMAR_PATH)CPP14*.o $(GRAMMAR_PATH)obj/ 
.PHONY : gc

#"clean compilation"
cc:
	@make clean
	@make all
.PHONY : cc

clean:
	@echo "----------------------"
	@echo "|Cleaning directories|"
	@echo "----------------------"	
	@cd $(PROJECT_OBJECTS) && rm -rf *.o || true
	@make clean_grammar_directory || true
	@cd $(PROJECT_SOURCES) && rm -f *~ \#* || true
	@rm -f *~ \#* || true
.PHONY : clean

clean_grammar_directory:
	@cd $(GRAMMAR_PATH) && rm -f *.cpp *.h *.o *.tokens *~ \#* 2>>/dev/null || true
	@cd $(GRAMMAR_OBJECT_PATH) && rm -f *.o || true
.PHONY : clean_grammar_directory

#little main to do only checks on how grammar behaves
grammar_test:
	@echo "------------------------------"
	@echo "|Building simple grammar_test|"
	@echo "------------------------------"
	@make cg
	$(CC) $(ANTLR_HEADERS) $(PROJECT_OPTIONS) -c simpleMain.cpp
#	@mv simpleMain.o $(GRAMMAR_PATH)
	$(CC) $(ANTLR_HEADERS) $(ANTLR_RUNTIME_OBJECT) $(PROJECT_RUNTIME_OBJECTS) $(GRAMMAR_OBJECT_PATH)*.o $(PROJECT_OPTIONS) simpleMain.o -o simpleMain
#	$(CC) $(ANTLR_HEADERS) $(ANTLR_RUNTIME_OBJECT) $(GRAMMAR_PATH)*.o $(PROJECT_OPTIONS) -o simpleMain

.PHONY: grammar_test

all:
	@make cg
	@make inane
.PHONY : all

new_grammar: #should add some kind of verifications
	@rm -rf $(PROJECT_OBJECTS)* 2>>/dev/null || true
	@rm -rf $(PROJECT_SOURCES)* 2>>/dev/null || true
	@rm -f $(GRAMMAR_PATH)* 2>>/dev/null || true
	@rm -f $(GRAMMAR_OBJECT_PATH)* 2>>/dev/null || true
	@rm -rf $(TEST_DIRECTORY)
	@rm -f *.cpp *.h *.o *~ || true
.PHONY : new_grammar
