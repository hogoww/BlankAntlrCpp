#!/bin/bash

#prog options
PROG_PATH="../../simpleMain"
GREP_OPT="--color=auto -i -E"

#Add files to test here, in single quote, separated by a space.
ALL_FILES=('test1.cpp' 'test2.cpp' 'test3.cpp' 
'test4.cpp' 'test5.cpp' 'test6.cpp' 
'test7.cpp' 'test8.cpp' 'test9.cpp' 
'test10.cpp' 'test11.cpp' 'test12.cpp' 
'test13.cpp' 'test14.cpp' 'test15.cpp'
'test16.cpp' 'test17.cpp' 'test18.cpp'
'test19.cpp' 'test20.cpp' 'test21.cpp'
'test22.cpp' 'test23.cpp' 'test24.cpp'
'test25.cpp' 'test26.cpp' 'test33.cpp'
)
ALL_FAILING_FILES=( 'test27.cpp' 'test28.cpp' 'test29.cpp'
'test30.cpp' 'test31.cpp' 'test32.cpp'
)

#macros
MUST_PASS=0
MUST_FAIL=1

#counters for recap
PASS_SUCCESS=0
FAIL_SUCCESS=0
PASS_FAIL=0
FAIL_FAIL=0
FILE_DOESNT_EXIST=0

TestThatFile(){
    #$1 => file to test
    #$2 => MUST_PASS | MUST_FAIL

    output="$1 ..."

    #add patterns separated by a pipe (|) after the newline
    progErrors="$($PROG_PATH $1 2>&1 | grep $GREP_OPT \
'mismatched\ input|token\ recognition\ error|no\ viable\ alternative|extraneous\ input' \
)" 


    if [ -a $1 ];
    then
	if [ "$progErrors" ];
	then #some errors were caught
	    if [ $2 -eq $MUST_PASS ];
	    then
		output="$output failed the test! :/"
		PASS_FAIL=$((PASS_FAIL+1))
	    else
		output="$output succesfully failed !"
		FAIL_SUCCESS=$((FAIL_SUCCESS+1))
	    fi
	else
	    if [ $2 -eq $MUST_PASS ];
	    then
		output="$output succesfully passed the test!"
		PASS_SUCCESS=$((PASS_SUCCESS+1))
	    else
		output="$output didn't get any errors, and was tagged to fail :/"
		FAIL_FAIL=$((FAIL_FAIL+1))
	    fi
	fi
	echo ''
	echo '--------------------------------------'
	echo $output
	if [ "$progErrors" ];
	then
	    echo '--------------------------------------'
	    echo $progErrors
	fi
	echo '--------------------------------------'

	#uncomment next line to see if grep didn't forget any error
	#echo "$($PROG_PATH $1)"
    else
	echo '--------------------------------------'
	echo "file $1 doesn't seem to exist in this directory:"
	pwd
	FILE_DOESNT_EXIST=$((FILE_DOESNT_EXIST + 1))
	echo '--------------------------------------'
    fi

}


if [ $# -eq 0 ];#by default runs all the test in the ALL_XX variable
then
    if [ "$ALL_FILES" ];
    then
	for file in ${ALL_FILES[@]}
	do
	    TestThatFile $file $MUST_PASS
	done
    fi
    
    if [ "$ALL_FAILING_FILES" ];
    then
	for file in ${ALL_FAILING_FILES[@]}
	do
	    TestThatFile $file $MUST_FAIL
	done
    fi

    echo "######################################"

    echo "Recap:"

    file=""
    if [ $PASS_SUCCESS -eq 1 ];
    then
	file="file"
    else
	file="files"
    fi
    echo "$PASS_SUCCESS $file passed as expected."

    verb=""
    file=""
    if [ $FAIL_SUCCESS -eq 1 ];
    then
	verb="was"
	file="file"
    else
	verb="were"
	file="files"
    fi
    echo "$FAIL_SUCCESS $file failed as expected."

    if [ ! $PASS_FAIL -eq 0 ];
    then
	verb=""
	file=""
	if [ $PASS_FAIL -eq 1 ];
	then
	    verb="was"
	    file="file"
	else
	    verb="were"
	    file="files"
	fi
    echo "$PASS_FAIL $file failed where they $verb expected to succeed."
    fi

    if [ ! $FAIL_FAIL -eq 0 ];
    then
	verb=""
	file=""
	if [ $FAIL_FAIL -eq 1 ];
	then
	    verb="was"
	    file="file"
	else
	    verb="were"
	    file="files"
	fi
	echo "$FAIL_FAIL $file passed where they $verb expected to fail."
    fi

    if [ ! $FILE_DOESNT_EXIST -eq 0 ];
    then
	verb=""
	file=""
	if [ $FILE_DOESNT_EXIST -eq 1 ];
	then
	    verb="wasn't"
	    file="file"
	else
	    verb="weren't"
	    file="files"
	fi
	echo "$FILE_DOESNT_EXIST $file $verb found."
    fi

    
else #otherwise run the first arg only (for now) with "must pass" tag
    TestThatFile $1 0
fi
