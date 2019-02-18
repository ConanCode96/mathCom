
/* DEFINITIONS SECTION */
%{
#include<math.h>
#include <stdio.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
%}

%token INTEGER
%token FLOATING_NUMBER

/* associtiviy for each operator, precedence is in INCREASING order */

%left '-' '+' 
%left '*' '/'
%right '^'

/* GRAMMAR RULES SECTION */
%%
program:
        program expr '\n' { printf("The result is = %.10g\n", $2); }
        |'\n' program
        |
        ;
expr:
    INTEGER {$$ = $1;}
    |FLOATING_NUMBER {$$ = $1;}
    |expr'+'expr {$$=$1 + $3;}
    |expr'-'expr {$$=$1 - $3;}
    |expr'*'expr {$$ = $1 * $3;}
    |expr'/'expr {$$ = $1 / $3;}
    |expr'^'expr {$$ = pow($1, $3);}
    |'('expr')' {$$ = $2;}
    ;

%%

/* SUBROUTINES SECTION */
int yyerror(char *s) 
{
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main(void) 
{
    yyparse();
    return 0;
}
