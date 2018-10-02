/*

*	Lexical Analyzer

*/


%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

void yyerror(char *);

%}

%%	
[ \t\n]                                                        					{/*Ignoring whitespaces, tab characters*/;}
"true"                                                          				{yylval.info.value=strdup(yytext);yylval.info.type=BOOLEAN;return BOOLEAN;}
"false"                                                         				{yylval.info.value=strdup(yytext);yylval.info.type=BOOLEAN;return BOOLEAN;}
"if"																			{return IF;}
"fi"																			{return ENDIF;}
"do"																			{return DO;}
"od"																			{return ENDDO;}
"return"																		{return RETURN;}
[_a-zA-Z][_a-zA-Z0-9]*                                            				{yylval.info.value=strdup(yytext);yylval.info.type=ID;return ID;}
([0-9]+)[.]([0-9]+)                                             				{yylval.info.value=strdup(yytext);yylval.info.type=REAL;return REAL;}
[0-9]+                                                          				{yylval.info.value=strdup(yytext);yylval.info.type=INTEGER;return INTEGER;}
"+"|"-"|"*"|"/"|"="|"<"|">"|"~"|":"|"("|")"|","|";"|"|"|"&"|"?"|"{"|"}"|"`"		{return yytext[0];}	
.                                                               				{yyerror("# syntax error");errors++;}
%%
