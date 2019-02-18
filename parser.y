
/* DEFINITIONS SECTION */
%{
#include <stdio.h>
%}

%token INTEGER
%token FLOATING_NUMBER

/* associtiviy for each operator, precedence is in INCREASING order */

%right '-' '+' 
%right '*' '/'
%right '^'

/* GRAMMAR RULES SECTION */
%%
program:
        program expr '\n' { printf("%d\n", $2); }
        |
        ;
expr:
    INTEGER {$$ = $1;}
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
