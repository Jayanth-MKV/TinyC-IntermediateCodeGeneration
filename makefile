tinyC: lexical.o parser.o ast.o program.o symboltable.o Function.o IntermediateCode.o
	g++ -o tinyC lexical.o parser.o symboltable.o ast.o Function.o program.o IntermediateCode.o -ll -ly
parser.o: y.tab.c
	g++ -c y.tab.c -o parser.o
y.tab.c y.tab.h: tiny.y program.hh Function.hh symboltable.hh ast.hh
	yacc -d tiny.y
lexical.o: lex.yy.c 
	g++ -c lex.yy.c -o lexical.o
lex.yy.c: tiny.l  y.tab.h
	lex tiny.l
ast.o: ast.cpp
	g++ -c ast.cpp -o ast.o
program.o: program.cpp
	g++ -c program.cpp -o program.o
Function.o: Function.cpp
	g++ -c Function.cpp -o Function.o
symboltable.o: symboltable.cpp
	g++ -c symboltable.cpp -o symboltable.o
IntermediateCode.o: IntermediateCode.cpp
	g++ -c IntermediateCode.cpp -o IntermediateCode.o

clean: *.o
	rm *.o

