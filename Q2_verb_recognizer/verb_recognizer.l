%{
#include <stdio.h>
%}

%%
is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go { 
    printf("Verb recognized: %s\n", yytext); 
}
. { /* Ignore all other characters */ }
%%

int main() {
    yylex(); /* Start scanning input */
    return 0;
}

int yywrap() {
    return 1; /* End of input */
}

