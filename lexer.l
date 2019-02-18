
    /* DEFINITONS SECTION */

%{
#include <stdio.h>
#include "parser.tab.h"
%}

    /* substitutions */

DIGIT [0-9]
FLOAT {DIGIT}+\.{DIGIT}*([eE][-+]?{DIGIT}+)?


    /* RULES Section */

%%  /*delimiters of the sections*
    
{DIGIT}+ {
            yylval = strtol(yytext);
            ECHO;
            return INTEGER;
        }

{FLOAT} {
            yylval = strtod(yytext);
            ECHO;
            return FLOATING_NUMBER;
        }

[-+*^\n]    {
            yylval = *yytext; /* one character */
            return *yytext;
        }

[ \t]   ; /* skip whitespaces */

.       yyerror("invalid character");


%%  /*delimiters of the sections*



    /* C-code Section */

int yywrap(void) {return 1;}