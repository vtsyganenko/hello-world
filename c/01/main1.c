#include <stdio.h>

typedef struct {
    int val1;
    float val2;
} Data;

static Data d = { 10, 22.4 };

Data* getData() {
    return &d;
}

// pointer to function which returns Data* and takes nothing
typedef Data *(*getter)(void);

int main(int argc, char *argv[])
{
    getter get_function;
    get_function = getData;

    Data* ptr = get_function();
    printf("val1 %d val2 %f \n", ptr->val1, ptr->val2);

    return 0;
}
