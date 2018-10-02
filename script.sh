#!/bin/bash
executable=generatorTC
bison -d myParser.y -o y.tab.c
flex myLexer.l
gcc y.tab.c lex.yy.c -o $executable
rm y.tab.* lex.yy.c
if [ -f ./$executable ]
then
    for((i=1;i<101;i++))
    do
        if [ -f "./TestCases/sample$i.in" ]
        then ./$executable "./TestCases/sample$i.in";
        fi
    done;
else echo "FAILURE!"
fi
