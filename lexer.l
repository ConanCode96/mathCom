
    /* DEFINITONS SECTION */

%{
#ifndef YYSTYPE
#define YYSTYPE double
#endif
#include <stdio.h>
#include "parser.tab.h"
%}

    /* substitutions */

DEC_DIGIT [0-9]
HEX_DIGIT [0-9a-fA-F]
FLOAT {DEC_DIGIT}+\.{DEC_DIGIT}*([eE][-+]?{DEC_DIGIT}+)?


    /* RULES Section */

%%  /*delimiters of the sections*
    
0[xX]{HEX_DIGIT}+|{DEC_DIGIT}+ {
            long int x = strtol(yytext, NULL, 0);
            yylval = x;
            fprintf(stderr, "read token %d\n", x);
            return INTEGER;
        }

{FLOAT} {
            yylval = strtod(yytext, NULL);
            fprintf(stderr, "read token %.10g\n", yylval);
            return FLOATING_NUMBER;
        }

[-+*/^\n]    {
            yylval = *yytext; /* one character */
            fprintf(stderr, "read token %c\n", *yytext);
            return *yytext;
        }

[( )\t]   {
            fprintf(stderr, "read token %c\n", *yytext);
        }; /* skip whitespaces */

"exit"  {
        printf("The developer loves YOU <3, BYE!! ^_^");
        return 0;
        };


.       yyerror("invalid character");


%%  /*delimiters of the sections*



    /* C-code Section */

int yywrap(void) {return 1;}