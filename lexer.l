
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
            yylval = strtol(yytext, NULL, 0);
            printf("read token ");
            ECHO;
            puts("");
            return INTEGER;
        }

{FLOAT} {
            yylval = strtod(yytext, 0);
            printf("read token ");
            ECHO;
            puts("");
            return FLOATING_NUMBER;
        }

[-+*/^\n]    {
            yylval = *yytext; /* one character */
            printf("read token ");
            ECHO;
            puts("");
            return *yytext;
        }

[( )\t]   {
            printf("read token ");
            ECHO;
            puts("");
        }; /* skip whitespaces */

.       yyerror("invalid character");


%%  /*delimiters of the sections*



    /* C-code Section */

int yywrap(void) {return 1;}