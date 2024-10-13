%{
#include <stdio.h>
int word_count = 0;     /* To keep track of word count */
int total_size = 0;     /* To keep track of total size (number of characters) */
%}

%%
[a-zA-Z]+ { 
    word_count++; 
    total_size += yyleng;  /* yyleng contains the length of the matched word */
}
 
[ \t\n]+ ;   /* Ignore whitespace */
. { 
    total_size += yyleng;   /* Count non-letter characters in total size */
    printf("%c", yytext[0]);   /* Print non-letters as they are */
}
%%

int main() {
    yylex(); /* Start scanning input */
    printf("\nTotal number of words: %d\n", word_count);
    printf("Total size (in characters): %d\n", total_size);
    return 0;
}

int yywrap() {
    return 1;  /* End of input */
}

