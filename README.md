# MyCompiler


#### It compiles a source file written with the rules stated in the file `Informal Reference Manual for X.pdf` to produce MIPS assembly.


### How To Run



By running `script.sh`, it will use `myLexer.l` and `myParser.y` to generate the executable `generatorTC` (target code generator) and compile all the testcases (files named `sample*.in`) in the directory `TestCases`.

To compile your own input source file (suppose it is `filename.in`), type

`./generatorTC filename.in`

then it will produce the output file (named `filename.out.s`) containing MIPS assembly. Run the file with `spim` simulator to check the output. For this do the following:

1. Run spim
2. In spim console, type
	`load "filename.out.s"`
3. Type `run`


### Note
*	All the source files like `sample*.in` in the directory `TestCases` are written according to the manual `Informal Reference Manual for X.pdf`.

*	Subprogram (function) can take multiple values as arguments but return two values at most

*	Pointers or Arrays are NOT implemented

*	`:=print:=arg1,arg2,arg3,...` will show output as stdout. Besides the keyword `newline` given as an argument will yield a newline in stdout.

*	`arg:=Input_Integer:=` will take integer from stdin.
