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

/* Primitive data types */
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
BLOCK_COMMENT "(/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/)"

%%
{PROGRAM}|{VAR}|{BEGIN}|{END}|{IF}|{THEN}|{ELSE}|{WHILE}|{FOR}|{DO}|{REPEAT}|{UNTIL}|{CASE}|{OF}|{FUNCTION}|{PROCEDURE}|{BOOLEAN_TRUE}|{BOOLEAN_FALSE} {
    printf("KEYWORD: %s\n", yytext);
}
{INTEGER}|{REAL}|{CHAR}|{STRING}|{BOOLEAN} {
    printf("DATA_TYPE: %s\n", yytext);
}

{IDENTIFIER} {
    printf("IDENTIFIER: %s\n", yytext);
}

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


{PLUS}|{MINUS}|{MULTIPLY}|{DIVIDE}|{MOD} {
    printf("OPERATOR: %s\n", yytext);
}

{ASSIGN}|{EQUAL}|{NOT_EQUAL}|{LESS_THAN}|{LESS_THAN_EQUAL}|{GREATER_THAN}|{GREATER_THAN_EQUAL} {
    printf("COMPARISON_OPERATOR: %s\n", yytext);
}


{LINE_COMMENT}|{BLOCK_COMMENT} {
    // Ignore comments
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
