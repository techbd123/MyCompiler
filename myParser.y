/*

*	Target Code Generation (Assembly) for MIPS 

** Subprogram (function) can take multiple values as arguments but return two values at most
** Calling subprogram recursively is allowed 
** Pointers or Arrays are NOT implemented
** floating points arithmetic are NOT implemented
** ':=print:=arg1,arg2,arg3,...' will show output as stdout. Besides the keyword 'newline' given as argument to will yield a newline in stdout.
** 'arg:=Input_Integer:=' will take integer from stdin.

*/


%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>
#define nl printf("\n")

FILE *fin,*fout;

extern int yylex();
extern char *yytext;

extern void yyerror(const char *a)
{
    printf("# %s\n",a);
    return ;
}

extern int yywrap() {return 1;}

int yyparse();

%}

%code requires
{
    #include <malloc.h>
    #define MAX 4096
    #define CHAR char *

    int errors;

    struct Info
    {
        char *value;
        int type;
    };
    typedef struct Info Info;

    struct Node
    {
        int symbolNum;
        Info info;
        char *evaluated;
        struct Node *left;
        struct Node *right;
    };
    typedef struct Node Node;

    struct NodeTable
    {
    	Node *node;
    };
    typedef struct NodeTable NodeTable;

    struct List2D
    {
        char **strings;
        int length;
        int *addr;
        int *type;
    };
    typedef struct List2D List2D;
}

%code
{
	NodeTable nodeTable[MAX+1];
	List2D varIDList;
    int symNum,nodeTableLength,indentationSize,labelNum,statementType[MAX],ifnextLabel[MAX],ifEndLabel[MAX],doLoopLabel[MAX],doLoopNext[MAX],len;

    Node *NewNode(int,Info,Node *,Node *);
    Info NewInfo(char *,int);
    void ShowNode(Node *);
    void ShowFinalAssignment(Node *,Node *,Node *);
    char *Evaluate(char *,char *,char *);
    Node *UpdateNodeTable(Node *,int *);
    void ShowConditionStart(int,int,int,int);
    void ShowConditionEnd(int,int);
    void ShowFunctionStart(Node *,Node *);
    void ShowFunctionEnd(Node *);
    void ShowReturn(Node *);
    void ShowEnd();
    void UpdateVarIDList(Node *);
}

%union
{
    Info info;
    Node *tree;
}

%token BOOLEAN
%token ID
%token REAL
%token INTEGER
%token OPERATOR
%token VARIABLE
%token STRING
%token EXPRESSION
%token ASSIGNMENT
%token IF
%token ENDIF
%token DO
%token ENDDO
%token SUBPROGRAM
%token RETURN

%type <tree> factor term sum relation negation conjunction disjunction expr exprs vars assignment selection iteration alt alts guard stmt stmts program subprogram subprogDecl heading body args returnStmt rets

%left '|'
%left '&'
%left '<' '=' '>'
%left '+' '-'
%left '*' '/'
%left UMINUS


%nonassoc SECOND
%nonassoc FIRST


%glr-parser
%expect 9
%expect-rr 8

%start program

%%

program		: stmts 				{ShowEnd();}
			;

stmts		: stmt 					
			| stmts';'stmt 			
			| stmts error stmt 		{yyerrok;yyclearin;errors++;}
			;

stmt		: %empty 				{}
			| assignment 			{symNum=0;nl;}
			| selection 			{nl;}
			| iteration 			{nl;}
			| subprogDecl			{nl;}
			;

selection	: ifstart alts ENDIF	{printf("L%d:\n",ifEndLabel[len-1]);ifEndLabel[len-1]=0;len--;}
			| error alts ENDIF 	    {yyerrok;yyclearin;errors++;}
			| error alts error  	{yyerrok;yyclearin;errors++;}	
			;

ifstart		: IF 					{len++;statementType[len-1]=IF;}
			;			

iteration	: loopstart alts ENDDO 	{doLoopLabel[len-1]=0;len--;}
			| error alts ENDDO		{yyerrok;yyclearin;errors++;}
			| error alts error 		{yyerrok;yyclearin;errors++;}
			;

loopstart	: DO 					{len++;statementType[len-1]=DO;printf("L%d:\n",++labelNum);indentationSize=2;}
			;

alts		: alt 					{}
			| alts ':'':'alt 		{}
			;

alt 		: guard'?'stmts 		{
										if(statementType[len-1]==IF)
										{
											if(!ifEndLabel[len-1])
											{
												ifEndLabel[len-1]=labelNum+1;
												labelNum++;
											}
											ShowConditionEnd(ifEndLabel[len-1],ifnextLabel[len-1]);								
										}
										else
										{
											/*statementType = DO*/
											ShowConditionEnd(doLoopLabel[len-1],doLoopNext[len-1]);
											doLoopLabel[len-1]=doLoopNext[len-1];
										}
									}	
			;

guard		: expr 					{
										if(statementType[len-1]==IF)
										{
											labelNum++;
											ifnextLabel[len-1]=labelNum+1;
											ShowConditionStart(statementType[len-1],$$->symbolNum,labelNum,ifnextLabel[len-1]);
											labelNum++;
										}
										else
										{
											/*statementeType = DO*/
											if(!doLoopLabel[len-1]) doLoopLabel[len-1]=labelNum;
											labelNum++;
											doLoopNext[len-1]=labelNum;
											ShowConditionStart(statementType[len-1],$$->symbolNum,labelNum,0);
										}
										indentationSize=2;
										symNum=0;
									}
			;


subprogDecl : heading body				{ShowFunctionEnd($1);}
			;


heading		: subprogram'('args')'		{$$=NewNode(0,NewInfo("subprogram",SUBPROGRAM),$1,$3);ShowFunctionStart($1,$3);}
			;

args 		: %empty					{$$=NULL;}
			| vars 						{$$=$1;}
			;

body		: '{'stmts returnStmt'}'	{}
			;

returnStmt	: RETURN rets 				{$$=$2;ShowReturn($$);}
			;

rets 		: %empty					{$$=NULL;}
			| exprs 					{$$=$1;}
			;

assignment  : vars':''='exprs 					{ShowFinalAssignment($1,NULL,$4);}
			| vars error exprs 					{yyerrok;yyclearin;errors++;}
			| vars':''='subprogram':''='exprs	{ShowFinalAssignment($1,$4,$7);}
			| vars':''='subprogram':''='		{ShowFinalAssignment($1,$4,NULL);}
			| ':''='subprogram':''='exprs		{ShowFinalAssignment(NULL,$3,$6);}
			| ':''='subprogram':''='			{ShowFinalAssignment(NULL,$3,NULL);}
			;

subprogram	: ID					{$$=NewNode(symNum,yylval.info,NULL,NULL);indentationSize=2;}
			;

vars    : ID                        {$$=NewNode(0,yylval.info,NULL,NULL);}
        | vars','ID                 {$$=NewNode(0,NewInfo(",",VARIABLE),$1,NewNode(0,yylval.info,NULL,NULL));}
        ;

exprs   : expr                      {$$=NewNode($1->symbolNum,NewInfo("",EXPRESSION),NULL,$1);}
        | exprs','expr              {$$=NewNode(0,NewInfo(",",EXPRESSION),$1,NewNode($3->symbolNum,NewInfo("",EXPRESSION),NULL,$3));}
        ;

expr    : disjunction               {$$=$1;if($$->info.type!=OPERATOR) $$->symbolNum++,symNum++,ShowNode($$);}
        ;

disjunction : conjunction               {$$=$1;}
            | disjunction'|'conjunction {$$=NewNode(++symNum,NewInfo("|",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            ;

conjunction : negation                  {$$=$1;}
            | conjunction'&'negation    {$$=NewNode(++symNum,NewInfo("&",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            ;

negation    : relation                  {$$=$1;}
            | '~'relation %prec UMINUS  {$$=NewNode(++symNum,NewInfo("~",OPERATOR),NULL,$2);$$=UpdateNodeTable($$,&symNum);}
            ;
            
relation    : sum                       {$$=$1;}
            | sum'<'sum                 {$$=NewNode(++symNum,NewInfo("<",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            | sum'='sum                 {$$=NewNode(++symNum,NewInfo("=",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            | sum'<''='sum              {$$=NewNode(++symNum,NewInfo("<=",OPERATOR),$1,$4);$$=UpdateNodeTable($$,&symNum);}
            | sum'~''='sum              {$$=NewNode(++symNum,NewInfo("~=",OPERATOR),$1,$4);$$=UpdateNodeTable($$,&symNum);}
            | sum'>''='sum              {$$=NewNode(++symNum,NewInfo(">=",OPERATOR),$1,$4);$$=UpdateNodeTable($$,&symNum);} 
            | sum'>'sum                 {$$=NewNode(++symNum,NewInfo(">",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            ;

sum         : term                  	{$$=$1;}
            | '-'term %prec UMINUS     	{$$=NewNode(++symNum,NewInfo("-",OPERATOR),NULL,$2);$$=UpdateNodeTable($$,&symNum);}
            | sum'+'term            	{$$=NewNode(++symNum,NewInfo("+",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            | sum'-'term            	{$$=NewNode(++symNum,NewInfo("-",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            ;

term        : factor                	{$$=$1;}
            | term'*'factor         	{$$=NewNode(++symNum,NewInfo("*",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            | term'/'factor         	{$$=NewNode(++symNum,NewInfo("/",OPERATOR),$1,$3);$$=UpdateNodeTable($$,&symNum);}
            ;

factor      : BOOLEAN   		        {$$=NewNode(symNum,yylval.info,NULL,NULL);}
            | INTEGER          			{$$=NewNode(symNum,yylval.info,NULL,NULL);}
            | REAL              		{$$=NewNode(symNum,yylval.info,NULL,NULL);}
            | ID             			{$$=NewNode(symNum,yylval.info,NULL,NULL);UpdateVarIDList($$);}
            | '('expr')'        		{$$=$2;}
            ;
%%


void makeIndent()
{
	printf("%*s",indentationSize,"");
	return ;
}

char *makeLabel(int a)
{
	char *s=(char *)malloc(sizeof(char)*15);
	sprintf(s,"L%d",a);
	return s;
}

char *makeString(int a)
{
	char *s=(char *)malloc(sizeof(char)*10);
	sprintf(s,"%d",a);
	return s;
}

Node *NewNode(int symbolNum,Info info,Node *left,Node *right)
{
    Node *newNode;
    newNode=(Node *)malloc(sizeof(Node));
    if(!newNode)
    {
        errors++;
        perror("malloc");
        return newNode;
    }
    char *leftEvaluated,*rightEvaluated;
    if(left) leftEvaluated=left->evaluated;else leftEvaluated="";
    if(right) rightEvaluated=right->evaluated;else rightEvaluated="";  
    newNode->symbolNum=symbolNum;
    newNode->info=info;
    newNode->left=left;
    newNode->right=right;
    newNode->evaluated=Evaluate(leftEvaluated,info.value,rightEvaluated);
    return newNode;
}

Info NewInfo(char *value,int type)
{
    Info info;
    info.value=value;
    info.type=type;
    return info;
}

char *Evaluate(char *operand1,char *operator,char *operand2)
{
	int i,len=strlen(operand1)+strlen(operator)+strlen(operand2)+2;
	char *s;
	s=(char *)malloc(sizeof(char)*len);
	if(!s)
	{
		errors++;
		perror("malloc");
		return s;
	}
	strcpy(s,"(");strcat(s,operand1);strcat(s,operator);strcat(s,operand2);strcat(s,")");
	return s;
}

Node *UpdateNodeTable(Node *node,int *symnum)
{
	if((*symnum)>MAX)
	{
		errors++;
		printf("The number of symbols has become maximum!\n");
		return 0;
	}
	int i;
	for(i=0;i<(*symnum);i++)
	{
		if(nodeTable[i].node)
		{
			if(!strcmp(nodeTable[i].node->evaluated,node->evaluated))
			{
				(*symnum)--;
				return nodeTable[i].node;
			}
		}
	}
	nodeTable[*symnum].node=node;
	ShowNode(node);
	return node;
}

void ShowStoreWord(char *reg1,int offset,char *reg2)
{
	/* reg1 ---> [offset+reg2]*/
	printf("sw %s %d(%s)\n",reg1,offset,reg2);
}

void ShowStoreWordToOperand(char *reg,char *operand)
{
	/* reg1 ---> operand */
	printf("sw %s %s\n",reg,operand);
}

void ShowLoadAddress(char *reg1,char *src)
{
	/* reg1 <--- &src */
	printf("la %s %s\n",reg1,src);
}

void ShowLoadAddresFromRegister(char *reg1,int offset,char *reg2)
{
	/* reg1 <--- offect+reg2 */
	printf("la %s %d(%s)\n",reg1,offset,reg2);	
}

void ShowLoadWord(char *reg1,int offset,char *reg2)
{
	/* reg1 <--- [offset+reg2] */
	printf("lw %s %d(%s)\n",reg1,offset,reg2);
	return ;
}

void ShowLoadWordFromOperand(char *reg,char *operand)
{
	/* reg1 <--- operand */
	printf("lw %s %s\n",reg,operand);
	return ;	
}

void ShowLoadImmediate(char *reg,char *imm)
{
	/* reg <--- imm*/
	printf("li %s %s\n",reg,imm);
	return ;
}

void ShowLoadImmediateFloatSingle(char *reg,char *imm)
{
	/* reg <--- imm*/
	printf("li.s %s %s\n",reg,imm);
	return ;
}

void ShowBranchEqual(char *reg,char *src,char *level)
{
	/* if reg = src goto level*/
	printf("beq %s %s %s\n",reg,src,level);
	return ;	
}

void ShowBranchNotEqual(char *reg,char *src,char *level)
{
	/* if reg ~= src goto level*/
	printf("bne %s %s %s\n",reg,src,level);
	return ;	
}

void ShowBranchLessThan(char *reg,char *src,char *level)
{
	/* if reg < src goto level*/
	printf("blt %s %s %s\n",reg,src,level);
	return ;	
}

void ShowBranchLessThanEqual(char *reg,char *src,char *level)
{
	/* if reg <= src goto level*/
	printf("ble %s %s %s\n",reg,src,level);
	return ;	
}

void ShowBranchGreaterThan(char *reg,char *src,char *level)
{
	/* if reg > src goto level*/
	printf("bgt %s %s %s\n",reg,src,level);
	return ;	
}

void ShowBranchGreaterThanEqual(char *reg,char *src,char *level)
{
	/* if reg >= src goto level*/
	printf("bge %s %s %s\n",reg,src,level);
	return ;	
}

void ShowBranchLevel(char *level)
{
	/*goto level*/
	printf("b %s\n",level);
	return ;	
}

void ShowJumpLink(char *level)
{
	/*jump and link to level and */
	printf("jal %s\n",level);
	return ;
}

void ShowJumpRegister(char *reg)
{
	/* jump to register address */
	printf("jr %s\n",reg);
	return ;
}

void ShowMove(char *reg1,char *reg2)
{
	/* reg1 <--- reg2 */
	printf("move %s %s\n",reg1,reg2);
	return ;
}

void ShowMoveFloatSingle(char *reg1,char *reg2)
{
	/* reg1 <--- reg2*/
	printf("mov.s %s %s\n",reg1,reg2);
	return ;
}

void ShowAdd(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 + reg3 */
	printf("add %s %s %s\n",reg1,reg2,reg3);
}

void ShowAddFloatSingle(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 + reg3 */
	printf("add.s %s %s %s\n",reg1,reg2,reg3);
}

void ShowAddImmediate(char *reg1,char *reg2,char *imm)
{
	/* reg1 <--- reg2 + imm */
	printf("addi %s %s %s\n",reg1,reg2,imm);
}

void ShowAddImmediateUnsigned(char *reg1,char *reg2,char *imm)
{
	/* reg1 <--- reg2 + imm */
	printf("addiu %s %s %s\n",reg1,reg2,imm);
}

void ShowSubtract(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 - reg3 */
	printf("sub %s %s %s\n",reg1,reg2,reg3);
}

void ShowMultiply(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 * reg3 */
	printf("mult %s %s\n",reg2,reg3);makeIndent();
	printf("mflo %s\n",reg1);
}

void ShowDivision(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 / reg3 */
	printf("div %s %s\n",reg2,reg3);makeIndent();
	printf("mflo %s\n",reg1);
}

void ShowSetLessThan(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 < reg3 */
	printf("slt %s %s %s\n",reg1,reg2,reg3);
}

void ShowSetLessThanEqual(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 <= reg3 */
	printf("sle %s %s %s\n",reg1,reg2,reg3);
}

void ShowSetGreaterThan(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 > reg3 */
	printf("sgt %s %s %s\n",reg1,reg2,reg3);
}

void ShowSetGreaterThanEqual(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 >= reg3 */
	printf("sge %s %s %s\n",reg1,reg2,reg3);
}

void ShowSetEqual(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 = reg3 */
	printf("seq %s %s %s\n",reg1,reg2,reg3);
}

void ShowSetNotEqual(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 ~= reg3 */
	printf("sne %s %s %s\n",reg1,reg2,reg3);
}

void ShowOR(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 | reg3 */
	printf("or %s %s %s\n",reg1,reg2,reg3);
}

void ShowAND(char *reg1,char *reg2,char *reg3)
{
	/* reg1 <--- reg2 & reg3 */
	printf("and %s %s %s\n",reg1,reg2,reg3);
}

void ShowNOT(char *reg1,char *reg2)
{
	/* reg1 <--- (~ reg2)  */
	printf("nor %s %s %s\n",reg1,reg2,"$zero");
}

void ShowNegation(char *reg1,char *reg2)
{
	/* reg1 <--- (- reg2)  */
	printf("neg %s %s\n",reg1,reg2);
}

void ShowPushStack(char *a)
{
	ShowStoreWord(a,0,"$sp");
	makeIndent();
	ShowAddImmediateUnsigned("$sp","$sp","-4");
	return ;
}

void ShowPopStack()
{
	ShowAddImmediateUnsigned("$sp","$sp","4");
	return ;
}


void ShowOperation(char *operator)
{
	/* 
		$a0 <--- $a0 operator $t1
				OR 
		$a0 <--- operator $a0
	*/
	if(!strcmp(operator,"+")) ShowAdd("$a0","$a0","$t1");
	else if(!strcmp(operator,"-")) ShowSubtract("$a0","$a0","$t1");
	else if(!strcmp(operator,"*")) ShowMultiply("$a0","$a0","$t1");
	else if(!strcmp(operator,"/")) ShowDivision("$a0","$a0","$t1");
	else if(!strcmp(operator,"&")) ShowAND("$a0","$a0","$t1");
	else if(!strcmp(operator,"|")) ShowOR("$a0","$a0","$t1");
	else if(!strcmp(operator,"=")) ShowSetEqual("$a0","$a0","$t1");
	else if(!strcmp(operator,"~=")) ShowSetNotEqual("$a0","$a0","$t1");
	else if(!strcmp(operator,"<")) ShowSetLessThan("$a0","$a0","$t1");
	else if(!strcmp(operator,"<=")) ShowSetLessThanEqual("$a0","$a0","$t1");
	else if(!strcmp(operator,">")) ShowSetGreaterThan("$a0","$a0","$t1");
	else if(!strcmp(operator,">=")) ShowSetGreaterThanEqual("$a0","$a0","$t1");
	else if(!strcmp(operator,"~")) ShowNOT("$a0","$a0");
	else if(!strcmp(operator,"-")) ShowNegation("$a0","$a0");
	return ;
}

void ShowLoad(char *reg,char *operand,int type)
{
	if(type==INTEGER) ShowLoadImmediate(reg,operand);
	else if(type==BOOLEAN)
	{
		if(!strcmp(operand,"true")) ShowLoadImmediate(reg,"1");else ShowLoadImmediate(reg,"0");
	}
	else if(type==REAL)
	{
		ShowLoadImmediateFloatSingle("$f1",operand);makeIndent();
		ShowMove(reg,"$f1");
	}
	else if(type==ID)
	{
		ShowLoadWordFromOperand(reg,operand);
	}
	else if(type==STRING)
	{
		ShowLoadAddress(reg,operand);
	}
	return ;
}

void ShowOperationEx1Ex2(char *operator,char *operand1,int type1,char *operand2,int type2)
{
	ShowLoad("$a0",operand1,type1);makeIndent();
	ShowLoad("$t1",operand2,type2);makeIndent();
	ShowOperation(operator);
	return ;
}

void ShowOperationIn1Ex1(char *operator,int addr,char *operand,int type)
{
	ShowLoadWord("$a0",4*addr,"$gp");makeIndent();
	ShowLoad("$t1",operand,type);makeIndent();
	ShowOperation(operator);
	return ;
}

void ShowOperationIn1In2(char *operator,int addr1,int addr2)
{
	ShowLoadWord("$a0",4*addr1,"$gp");makeIndent();
	ShowLoadWord("$t1",4*addr2,"$gp");makeIndent();
	ShowOperation(operator);
	return ;
}

void ShowOperationIn(char *operator,int addr)
{
	ShowLoadWord("$a0",4*addr,"$gp");makeIndent();
	ShowOperation(operator);
	return ;
}

void ShowOperationEx(char *operator,char *operand,int type)
{
	ShowLoad("$a0",operand,type);makeIndent();
	ShowOperation(operator);
	return ;
}

void ShowNode(Node *node)
{
	char *operator,*operand1,*operand2;
	int addr1,addr2,type1,type2;
	operand1=operand2=NULL;
	addr1=addr2=-1;
	makeIndent();
    if(node->info.type==OPERATOR)
    {
        //printf("t%d = ",node->symbolNum);
        if(node->left)
        {
            if(node->left->info.type==OPERATOR)
        	{
        		addr1=node->left->symbolNum;
            	//printf("t%d ", node->left->symbolNum);
        	}
        	else
			{
				operand1=node->left->info.value;
				type1=node->left->info.type;
				//printf("%s ",node->left->info.value);
			}
        }
        operator=node->info.value;
        //printf("%s ",node->info.value);
        if(node->right==NULL)
        {
            printf("\n# %s\n","Syntax Error");
            return ;
        }
        if(node->right->info.type==OPERATOR)
    	{
    		addr2=node->right->symbolNum;
    		//printf("t%d", node->right->symbolNum);
    	}
    	else
		{
			operand2=node->right->info.value;
			type2=node->right->info.type;
			//printf("%s",node->right->info.value);
		}
		if(addr1>-1)
		{
			if(addr2>-1) ShowOperationIn1In2(operator,addr1,addr2);else ShowOperationIn1Ex1(operator,addr1,operand2,type2);
		}
		else
		{
			if(addr2>-1)
			{
				if(operand1) ShowOperationIn1Ex1(operator,addr2,operand1,type1);else ShowOperationIn(operator,addr2);
			}
			else
			{
				if(operand1) ShowOperationEx1Ex2(operator,operand1,type1,operand2,type2);else ShowOperationEx(operator,operand2,type2);
			}
		}
		makeIndent();ShowStoreWord("$a0",4*node->symbolNum,"$gp");
    }
    else if(node->symbolNum>-1)
    {
    	if(!strcmp(node->info.value,"newline")) node->info.type=STRING;
    	ShowLoad("$a0",node->info.value,node->info.type);
    	makeIndent();ShowStoreWord("$a0",4*node->symbolNum,"$gp");
        //printf("t%d = %s",node->symbolNum,node->info.value);
    }
    else
    {
    	ShowLoad("$a0",node->info.value,node->info.type);
    	//printf("%s",node->info.value);
    }
    //	nl;	
    return ;
}

void UpdateVarIDList(Node *node)
{
	int i;
	if(varIDList.strings==NULL)
	{
		varIDList.strings=(char **)malloc(sizeof(char **)*MAX);
	}
	if(node->info.type==ID)
	{
		for(i=0;i<varIDList.length;i++) if(!strcmp(node->info.value,varIDList.strings[i])) return ;
	}
	varIDList.strings[varIDList.length++]=node->info.value;
	return ;
}

	
List2D CollectVariables(Node *variables)
{
    List2D list2d ;
    Node *node;int i;
    i=list2d.length=0;node=variables;
    while(node)
    {
        node=node->left;list2d.length++;
    }
    list2d.strings=(char **)malloc(sizeof(char *)*list2d.length);
    node=variables;
    while(node)
    {
        if(node->info.type==VARIABLE&&node->right!=NULL)
        {
            list2d.strings[list2d.length-i-1]=node->right->info.value;
            UpdateVarIDList(node->right);
        }
        else
        {
        	list2d.strings[list2d.length-i-1]=node->info.value;
        	UpdateVarIDList(node);
        }
        node=node->left;
        i++;
    }
    return list2d;
}

List2D CollectExpressions(Node *expressions)
{
    List2D list2d;
    Node *node;int i,addrNum,type;char *s;
    i=list2d.length=0;node=expressions;
    while(node)
    {
        node=node->left;list2d.length++;
    }
    list2d.strings=(char **)malloc(sizeof(char *)*list2d.length);
    list2d.addr=(int *)malloc(sizeof(int));
    list2d.type=(int *)malloc(sizeof(int));
    node=expressions;
    while(node)
    {
        s=(char *)malloc(sizeof(char)*10);
        if(!s)
        {
            errors++;
            perror("malloc");
            list2d.length=0;
            return list2d;
        }
        if(node->info.type==EXPRESSION&&node->right!=NULL)
    	{
        	addrNum=node->right->symbolNum;sprintf(s,"t%d",node->right->symbolNum);
        	if(node->right->right)
        	{
        		type=node->right->right->info.type;
        	}
        	else
        	{
        		type=node->right->info.type;	
        	}
        }
        list2d.strings[list2d.length-i-1]=s;
        list2d.addr[list2d.length-i-1]=addrNum;
        list2d.type[list2d.length-i-1]=type;
        node=node->left;
        i++;
    }
    return list2d;
}

void ShowFinalAssignment(Node *variables,Node *func,Node *expressions)
{
	List2D varList,exprList;int i;
	if(variables) varList=CollectVariables(variables);else varList.length=0;
    if(expressions) exprList=CollectExpressions(expressions);else exprList.length=0;
	if(func)
	{
		if(!strcmp(func->info.value,"print"));
		else
		{
			for(i=0;i<varIDList.length;i++)
			{
				if(!strcmp(varIDList.strings[i],"newline")) continue;
				makeIndent();ShowLoadWordFromOperand("$t2",varIDList.strings[i]);
				makeIndent();ShowPushStack("$t2");
			}
		}
		for(i=0;i<exprList.length;i++)
		{
			
			makeIndent();ShowLoadWord("$a0",4*exprList.addr[i],"$gp");
			makeIndent();
			if(!strcmp(func->info.value,"print"))
			{
				if(exprList.type[i]==STRING) ShowJumpLink("Print_String");
				else ShowJumpLink("Print_Integer");
			}
			else ShowPushStack("$a0");
			//printf("param %s\n",exprList.strings[i]);
		}
		if(!strcmp(func->info.value,"print"));
		else
		{
			makeIndent();ShowJumpLink(func->info.value);
			makeIndent();ShowAddImmediateUnsigned("$sp","$sp",makeString(4*exprList.length));
			//printf("call %s, %d, %d\n",func->info.value,exprList.length,varList.length);
			for(i=0;i<varIDList.length;i++)
			{
				if(!strcmp(varIDList.strings[varIDList.length-i-1],"newline")) continue;
				makeIndent();ShowLoadWord("$t2",4,"$sp");
				makeIndent();ShowStoreWordToOperand("$t2",varIDList.strings[varIDList.length-i-1]);
				makeIndent();ShowPopStack();
			}
			for(i=0;i<varList.length;i++)
			{
				makeIndent();
				char *s=strdup("$v");s=strcat(s,makeString(i));
				ShowStoreWordToOperand(s,varList.strings[i]);
				//printf("return %s\n",varList.strings[i]);
			}
		}
		return ;
	}
    if(varList.length!=exprList.length)
    {
        printf("\nInfo: The number of left hand variables is NOT same as the number of expressions!\n");
    }
    int len=varList.length;
    if(len>exprList.length) len=exprList.length;
    for(i=0;i<len;i++)
    {
    	makeIndent();ShowLoadWord("$a0",4*exprList.addr[i],"$gp");
    	makeIndent();ShowStoreWordToOperand("$a0",varList.strings[i]);
        //makeIndent();printf("%s = %s\n",varList.strings[i],exprList.strings[i]);
    }
    return ;
}

void ShowConditionStart(int type,int symnum,int label1,int label2)
{
	makeIndent();ShowLoadWord("$a0",4*symnum,"$gp");
	makeIndent();ShowLoadImmediate("$t1","0");makeIndent();
	if(type==IF)
	{
		//printf("if t%d goto L%d\n",symnum,label1);
		ShowBranchNotEqual("$a0","$t1",makeLabel(label1));makeIndent();
		//printf("goto L%d\n",label2);
		ShowBranchLevel(makeLabel(label2));
		printf("L%d:\n",label1);
		return ;
	}
	/*type =  DO*/
	//printf("ifF t%d goto L%d\n",symnum,label1);
	ShowBranchEqual("$a0","$t1",makeLabel(label1));
	return ;
}

void ShowConditionEnd(int label1,int label2)
{
	makeIndent();
	//printf("goto L%d\n",label1);
	ShowBranchLevel(makeLabel(label1));
	printf("L%d:\n",label2);
	return ;
}

void ShowFunctionStart(Node *functionName,Node *arguments)
{
	List2D varList;int i;
	if(arguments) varList=CollectVariables(arguments);else varList.length=0;
	printf("\t.text\n%s:\n",functionName->info.value);
	if(!strcmp(functionName->info.value,"main"))
	{
		return ;
	}
	makeIndent();ShowPushStack("$fp");
	makeIndent();ShowPushStack("$ra");nl;
	makeIndent();ShowLoadAddresFromRegister("$fp",8,"$sp");nl;	
	//printf("BeginSubprogram\n");
	for(i=0;i<varList.length;i++)
	{
		makeIndent();ShowLoadWordFromOperand("$t1",varList.strings[varList.length-i-1]);
		makeIndent();ShowPushStack("$t1");
		makeIndent();ShowLoadWord("$a0",4*(i+1),"$fp");
		makeIndent();ShowStoreWordToOperand("$a0",varList.strings[varList.length-i-1]);nl;
	}
	return ;
}

void ShowReturn(Node *expressions)
{
	if(expressions==NULL) return ;
	List2D exprList=CollectExpressions(expressions);
	int i;
	for(i=0;i<exprList.length;i++)
	{
		//printf("return %s\n",exprList.strings[i]);
		char *s=strdup("$v");s=strcat(s,makeString(i));
		makeIndent();ShowLoadWord(s,4*exprList.addr[i],"$gp");
	}
	return ;
}

void ShowFunctionEnd(Node *functionHeading)
{
	List2D varList;int i;
	Node *functionName=functionHeading->left;
	Node *arguments=functionHeading->right;
	if(arguments) varList=CollectVariables(arguments);else varList.length=0;
	if(!strcmp(functionName->info.value,"main"))
	{
		makeIndent();ShowBranchLevel("Exit");
		return ;
	}
	nl;
	for(i=0;i<varList.length;i++)	
	{
		makeIndent();ShowLoadWord("$a0",4,"$sp");
		makeIndent();ShowStoreWordToOperand("$a0",varList.strings[i]);
		makeIndent();ShowPopStack();nl;
	}
	makeIndent();ShowLoadWord("$ra",4,"$sp");
	makeIndent();ShowPopStack();
	makeIndent();ShowLoadWord("$fp",4,"$sp");
	makeIndent();ShowPopStack();	
	makeIndent();ShowJumpRegister("$ra");
	//printf("EndSubprogram\n");
	return ;
}

void ShowVarData()
{
	int i;
	printf("\t.data\n");
	for(i=0;i<varIDList.length;i++)
	{
		if(!strcmp(varIDList.strings[i],"newline"))
		{
			printf("%s:\t\t.asciiz \t\"\\n\"\n",varIDList.strings[i]);
			continue;
		}
		printf("%s:\t\t\t\t.word \t\t0\n",varIDList.strings[i]);
	}
	return ;
}

void ShowPrintIntegerFunction()
{
	printf("Print_Integer:\n");
	printf("# LOAD INTEGER VALUE IN $a0\n");
	//makeIndent();ShowLoadWord("$a0",4,"$sp");
	makeIndent();ShowLoadImmediate("$v0","1");
	makeIndent();printf("syscall\n");
	//makeIndent();ShowPopStack();
	makeIndent();ShowJumpRegister("$ra");
	return ;
}

void ShowPrintStringFunction()
{
	printf("Print_String:\n");
	printf("# LOAD STRING ADDRESS IN $a0\n");
	//makeIndent();ShowLoadWord("$a0",4,"$sp");
	makeIndent();ShowLoadImmediate("$v0","4");
	makeIndent();printf("syscall\n");
	//makeIndent();ShowPopStack();
	makeIndent();ShowJumpRegister("$ra");
	return ;
}

void ShowInputIntegerFunction()
{
	printf("Input_Integer:\n");
	makeIndent();ShowLoadImmediate("$v0","5");
	makeIndent();printf("syscall\n");
	printf("# INPUT INTEGER WILL BE PLACED IN $v0\n");
	makeIndent();ShowJumpRegister("$ra");
	return ;	
}

void ShowFinalExit()
{
	printf("Exit:\n");
	makeIndent();ShowLoadImmediate("$v0","10");
	makeIndent();printf("syscall\n");
	return ;
}

void ShowNecessaryFunctions()
{
	printf("####EXTRA####\n");nl;
	ShowPrintIntegerFunction();nl;
	ShowPrintStringFunction();nl;
	ShowInputIntegerFunction();nl;
	ShowFinalExit();nl;
	printf("####EXTRA####\n");nl;
	return ;
}

void ShowEnd()
{
	ShowNecessaryFunctions();
	ShowVarData();
	return;
}

void SetIOFiles(char *fileName)
{
    fin=freopen(fileName,"r",stdin);
    if(fin==NULL)
    {
        perror("Input File: freopen");
        exit(EXIT_FAILURE);
    }
    int len=strlen(fileName);
    if(len>3)
    {
        if(fileName[len-1]=='n'&&fileName[len-2]=='i'&&fileName[len-3]=='.') len-=2;
	}
    if(fileName[len-1]=='.') len--;
    fileName[len++]='.';fileName[len++]='o';fileName[len++]='u';fileName[len++]='t';fileName[len++]='.';fileName[len++]='s';fileName[len]=0;
    fout=freopen(fileName,"w",stdout);
    if(fout=NULL)
    {
        perror("Output File: freopen");
        exit(EXIT_FAILURE);
    }
    return ;
}

int main(int argc,char **args)
{
    if(argc==2) SetIOFiles(args[1]);
    else
    {
        fprintf(stderr,"Invalid Arguments!\n");
        exit(EXIT_FAILURE);
    }
    printf("### MIPS CODE ###\n");
    symNum=indentationSize=len=0;labelNum=-1;
    if(yyparse()||errors) printf("\n# PARSING FAILURE!\n");else printf("\n# PARSING SUCCESS!\n");
    fclose(fin);
    return 0;
}	
