%{
#include <stdio.h>
%}

%%
[a-zA-Z]+ {
    // This rule matches any sequence of letters (English words)
    // Check if the word contains "abc" and replace it with "ABC"
    char *word = yytext;
    char *ptr;
    
    // Loop through the word to find "abc" and replace with "ABC"
    while ((ptr = strstr(word, "abc")) != NULL) {
        // Print everything before "abc"
        fwrite(word, sizeof(char), ptr - word, stdout);
        // Print "ABC" instead of "abc"
        printf("ABC");
        // Move past the "abc" and continue scanning
        word = ptr + 3;
    }
    // Print the remaining part of the word (if no "abc" is found)
    printf("%s", word);
}

[ \t\n]+   { /* Ignore whitespace */ }

.          { printf("%c", yytext[0]); /* Print any non-letter character */ }
%%

int main() {
    yylex();  // Start the lexical analysis
    return 0;
}

int yywrap() {
    return 1;  // Indicates end of input
}

