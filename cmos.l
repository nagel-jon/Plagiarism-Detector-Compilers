%{
//*****************************************************************************************
// File: cmos.l
// Purpose: To scan through a student submission and tokenize
ild instructions
// flex cmos.l
// g++ -o cmos lex.yy.x
// ./cmos < data_file.txt
// ****************************************************************************************

//declarations

#include <iostream>
using namespace std;
%}

#define MULTLINECOMMENT 1
#define SINGLECOMMENT 2
#define WHITESPACE 3
#define INTEGER 4
#define CHARACTER 5
#define IFSTATEMENT 6
#define ELSESTATEMENT 7
#define FORLOOP 8
#define WHILELOOP 9
#define RETURNSTATEMENT 10
#define LPAREN 11
#define RPAREN 12
#define LBRACE 14
#define RBRACE 15
#define SEMICOLON 16
#define LITERAL 17
#define IDENTIFIER 18
#define EQEQOPER 19
#define EQOPER 20
#define NOTEQOPER 21
#define PLUSPLUSOPER 22
#define PLUSOPER 23
#define MINUSMINUSOPER 24
#define MINUSOPER 25
#define DIVOPER 26
#define MULTOPER 27
#define INVALIDTKN 28


//declarations



%%
"/*"[\s\S]*?"*/"    {return MULTLINECOMMENT;}
"//".*              {return SINGLECOMMENT;}
[ \t\n]             {return WHITESPACE;}
"int"                { return INTEGER; }
"char"               { return CHARACTER; }
"if"                 { return IFSTATEMENT; }
"else"               { return ELSESTATEMENT; }
"for"                { return FORLOOP; }
"while"              { return WHILELOOP; }
"return"             { return RETURNSTATEMENT; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
"{"                  { return LBRACE; }
"}"                  { return RBRACE; }
";"                  { return SEMICOLON; }
[0-9]+               { return LITERAL; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; }
"=="                 { return EQEQOPER; }
"!="                 { return NOTEQOPER; }
"+"                  { return PLUSOPER }
"-"                  { return PLUSPLUSOPER; }
"*"                  { return MULTOPER; }
"/"                  { return DIVOPER; }
"="                  { return EQOPER; }
"++"                 { return PLUSPLUSOPER; }
"--"                 { return MINUSMINUSOPER; }
.                    { return INVALIDTKN; }
%%


int yywrap(){
	return true;
}

int main() {
    int token = 0;
    token = yylex();
    while(token){
        switch(token){
            case MULTLINECOMMENT:
                cout << "(Multiple Line Comment)" << endl;
                break;
            case SINGLECOMMENT:
                cout << "(Single Line Comment)" << endl;
                break;
            case WHITESPACE:
                cout << "(Whitespace)" << endl;
                break;
            case INTEGER:
                cout << "(Integer)" << endl;
                break;
            case CHARACTER:
                cout << "(Character)" << endl;
                break;
            case IFSTATEMENT:
                cout << "(If Statement)" << endl;
                break;
            case ELSESTATEMENT:
                cout << "(Else Statement)" << endl;
                break;
            case FORLOOP:
                cout << "(For Loop)" << endl;
                break;
            case WHILELOOP:
                cout << "(While Loop)" << endl;
                break;
            case RETURNSTATEMENT:
                cout << "(Return Statement)" << endl;
                break;
            case LPAREN:
                cout << "(Left Parenthesis)" << endl;
                break;
            case RPAREN:
                cout << "(Right Parenthesis)" << endl;
                break;
            case LBRACE:
                cout << "(Left Brace)" << endl;
                break;
            case RBRACE:
                cout << "(Right Brace)" << endl;
                break;
            case SEMICOLON:
                cout << "(Semicolon)" << endl;
                break;
            case LITERAL:
                cout << "(Literal)" << endl;
                break;
            case IDENTIFIER:
                cout << "(Identifier)" << endl;
                break;
            case EQEQOPER:
                cout << "(Equal to Equal Operator)" << endl;
                break;
            case EQOPER:
                cout << "(Equal Operator)" << endl;
                break;
            case NOTEQOPER:
                cout << "(Not Equal Operator)" << endl;
                break;
            case PLUSPLUSOPER:
                cout << "(Plus Plus Operator)" << endl;
                break;
            case PLUSOPER:
                cout << "(Plus Operator)" << endl;
                break;
            case MINUSMINUSOPER:
                cout << "(Minus Minus Operator)" << endl;
                break;
            case MINUSOPER:
                cout << "(Minus Operator)" << endl;
                break;
            case DIVOPER:
                cout << "(Divide Operator)" << endl;
                break;
            case MULTOPER:
                cout << "(Multiply Operator)" << endl;
                break;
            case INVALIDTKN:
                cout << "(Invalid Token)" << endl;
                break;
            default:
                cout << "(Unknown Token)" << endl;
                break;
        }
        token = yylex();
    }
}
            
