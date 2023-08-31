%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

/* Definitions for Pascal tokens */
DIGIT [0-9]
LETTER [a-zA-Z]
IDENTIFIER {LETTER}({LETTER}|{DIGIT})*
INTEGER_LITERAL {DIGIT}+
FLOAT_LITERAL {DIGIT}+"."{DIGIT}+|"."{DIGIT}+
STRING_LITERAL \"([^\\\"]|\\.)*\"
CHAR_LITERAL \'[^']\'

INTEGER "integer"
REAL "real"
CHAR "char"
STRING "string"
BOOLEAN "boolean"

/* Operators */
PLUS "+"
MINUS "-"
MULTIPLY "*"
DIVIDE "/"
MOD "%"
ASSIGN ":="
EQUAL "="
NOT_EQUAL "<>"
LESS_THAN "<"
LESS_THAN_EQUAL "<="
GREATER_THAN ">"
GREATER_THAN_EQUAL ">="
AND "and"
OR "or"
NOT "not"

/* Keywords */
PROGRAM "program"
VAR "var"
BEGIN "begin"
END "end"
IF "if"
THEN "then"
ELSE "else"
WHILE "while"
FOR "for"
DO "do"
REPEAT "repeat"
UNTIL "until"
CASE "case"
OF "of"
FUNCTION "function"
PROCEDURE "procedure"
BOOLEAN_TRUE "true"
BOOLEAN_FALSE "false"
ARRAY "array"
CONST "const"
DIV "div"
DOWNTO "downto"
FILE "file"
GOTO "goto"
IN "in"
LABEL "label"
MODULO "mod"
NIL "nil"
PACKED "packed"
RECORD "record"
SET "set"
TO "to"
TYPE "type"
WITH "with"

/* Punctuation */
SEMICOLON ";"
COLON ":"
COMMA ","
OPEN_PAREN "("
CLOSE_PAREN ")"
OPEN_BRACE "{"
CLOSE_BRACE "}"

/* Comments */
LINE_COMMENT "//".*
BLOCK_COMMENT "(*"[^*)]*"*)"|"{"[^}]*"}" 


%%
{LINE_COMMENT}|{BLOCK_COMMENT} {
    // Ignore comments
}

{PROGRAM}            printf("TOKEN: PROGRAM\n");
{VAR}                printf("TOKEN: VAR\n");
{BEGIN}              printf("TOKEN: BEGIN\n");
{END}                printf("TOKEN: END\n");
{IF}                 printf("TOKEN: IF\n");
{THEN}               printf("TOKEN: THEN\n");
{ELSE}               printf("TOKEN: ELSE\n");
{WHILE}              printf("TOKEN: WHILE\n");
{FOR}                printf("TOKEN: FOR\n");
{DO}                 printf("TOKEN: DO\n");
{REPEAT}             printf("TOKEN: REPEAT\n");
{UNTIL}              printf("TOKEN: UNTIL\n");
{CASE}               printf("TOKEN: CASE\n");
{OF}                 printf("TOKEN: OF\n");
{FUNCTION}           printf("TOKEN: FUNCTION\n");
{PROCEDURE}          printf("TOKEN: PROCEDURE\n");
{BOOLEAN_TRUE}       printf("TOKEN: BOOLEAN_TRUE\n");
{BOOLEAN_FALSE}      printf("TOKEN: BOOLEAN_FALSE\n");
{ARRAY}              printf("TOKEN: ARRAY\n");
{CONST}              printf("TOKEN: CONST\n");
{DIV}                printf("TOKEN: DIV\n");
{DOWNTO}             printf("TOKEN: DOWNTO\n");
{FILE}               printf("TOKEN: FILE\n");
{GOTO}               printf("TOKEN: GOTO\n");
{IN}                 printf("TOKEN: IN\n");
{LABEL}              printf("TOKEN: LABEL\n");
{MODULO}             printf("TOKEN: MODULO\n");
{NIL}                printf("TOKEN: NIL\n");
{PACKED}             printf("TOKEN: PACKED\n");
{RECORD}             printf("TOKEN: RECORD\n");
{SET}                printf("TOKEN: SET\n");
{TO}                 printf("TOKEN: TO\n");
{TYPE}               printf("TOKEN: TYPE\n");
{WITH}               printf("TOKEN: WITH\n");

{INTEGER}            printf("DATA_TYPE: INTEGER\n");
{REAL}               printf("DATA_TYPE: REAL\n");
{CHAR}               printf("DATA_TYPE: CHAR\n");
{STRING}             printf("DATA_TYPE: STRING\n");
{BOOLEAN}            printf("DATA_TYPE: BOOLEAN\n");
{INVOKE_FUNCTION}    printf("INVOKE: %s\n",yytext);


{INTEGER_LITERAL} {
    printf("INTEGER_LITERAL: %s\n", yytext);
}

{FLOAT_LITERAL} {
    printf("FLOAT_LITERAL: %s\n", yytext);
}

{STRING_LITERAL} {
    printf("STRING_LITERAL: %s\n", yytext);
}

{CHAR_LITERAL} {
    printf("CHAR_LITERAL: %s\n", yytext);
}
{ASSIGN} printf("ASSIGNMENT_OPERATOR: %s\n",yytext);

{PLUS}|{MINUS}|{MULTIPLY}|{DIVIDE}|{MOD} {
    printf("OPERATOR: %s\n", yytext);
}

{EQUAL}|{NOT_EQUAL}|{LESS_THAN}|{LESS_THAN_EQUAL}|{GREATER_THAN}|{GREATER_THAN_EQUAL} {
    printf("COMPARISON_OPERATOR: %s\n", yytext);
}


{SEMICOLON}|{COLON}|{COMMA}|{OPEN_PAREN}|{CLOSE_PAREN}|{OPEN_BRACE}|{CLOSE_BRACE} {
    printf("PUNCTUATION: %s\n", yytext);
}


[ \t\r\n] {
    // Ignore whitespace and newline characters
}

. {
    printf("UNRECOGNIZED: %s\n", yytext);
}
%%

int main() {
    yylex();
    return 0;
}

