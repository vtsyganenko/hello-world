#include <stdint.h>
#include <stdlib.h> // malloc.h for MacOS
#include <stdio.h>

char mostCommonCharacterInString(const char* str, uint16_t len) {
    char result = 0;

    if(str == NULL) {
        printf("mostCommonCharacterInString: ERROR str is NULL \n");
        return result;
    }

    if(len == 0) {
        printf("mostCommonCharacterInString: ERROR len == 0 \n");
        return result;
    }

    char* symbols = (char*)calloc(len, sizeof(char));
    if(symbols == NULL) {
        printf("mostCommonCharacterInString: ERROR unable to allocate char[%d]\n", len);
        return result;
    }

    uint16_t* numbers = (uint16_t*)calloc(len, sizeof(uint16_t));
    if(numbers == NULL) {
        free(symbols);
        printf("mostCommonCharacterInString: ERROR unable to allocate uint16_t[%d]\n", len);
        return result;
    }

    uint16_t uniqueSymbolsCount = 0;
    symbols[uniqueSymbolsCount] = str[0];
    numbers[uniqueSymbolsCount] = 1;
    uniqueSymbolsCount++;

    for(uint16_t i=1; i<len; ++i) {
        char newSymbol = str[i];

        int8_t found = -1;
        for(uint16_t j=0; j<uniqueSymbolsCount; ++j) {
            if(newSymbol == symbols[j]) {
                found = j;
                break;
            }
        }

        if(found >= 0) {
            numbers[found] += 1;
        }
        else {
            symbols[uniqueSymbolsCount] = newSymbol;
            numbers[uniqueSymbolsCount] = 1;
            uniqueSymbolsCount++;
        }
    }

    // debug
    for(uint16_t i=0; i<uniqueSymbolsCount; ++i) {
        printf("[%c] = %d \n", symbols[i], numbers[i]);
    }
    
    // find first max
    uint16_t max_index = 0;
    for(uint16_t i=0; i<uniqueSymbolsCount; ++i) {
        if(numbers[i] > numbers[max_index]) {
            max_index = i;
        }
    }
    
    result = symbols[max_index];

    free(symbols);
    free(numbers);
    
    return result;
}

void test_wrapper(const char* string, uint16_t length) {
    printf("for string [%s], most common character is [%c]\n\n", string, mostCommonCharacterInString(string, length));
}

int main(int argc, const char* argv[]) {

    test_wrapper(NULL, 1);

    test_wrapper("", 1);

    test_wrapper("str", 0);

    test_wrapper(" ", 1);

    test_wrapper("abcdce", 6);

    test_wrapper("aaaa", 4);

    test_wrapper("abcabc", 6);

    test_wrapper("asd asd asa", 11);

    test_wrapper("abc5abc5abc5abc55abc5abc5", 26);

    return 0;
}
