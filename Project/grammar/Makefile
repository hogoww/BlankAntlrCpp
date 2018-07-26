default_target: cg

all :
	@cd .. && make inane
.PHONY: all

cg : #'clean grammar"
	@cd .. &&  make grammar_test
	@make testall
.PHONY: cg

cf : #'currentFile'
	@cd .. && make grammar_test
	@make test
.PHONY: cf

test: #only testing part
	cd ../testCase/preproc/ && ./autoTest.sh define.cpp
.PHONY: test

testall: #test every file in script
	@echo '##############'
	@echo '#TESTING PART#'
	@echo '##############'
	cd ../testCase/preproc/ && ./autoTest.sh
.PHONY: testALL
