
// declare type - case 1
struct DataA {
    int val1;
    float val2;
};

// declare type - case 2
typedef struct _DataB {
    int val1;
    float val2;
} DataB;

// variable ! (unnamed struct)
struct {
    int val1;
    float val2;
} DataC;

// declare type - case 3
typedef struct {
    int val1;
    float val2;
} DataD;

int main(int argc, char *argv[]) 
{
    struct DataA d1;
    d1.val1 = 10;
    d1.val2 = 0.1;

    DataB d2;
    d2.val1 = 11;
    d2.val2 = 0.2;
    // and 
    struct _DataB d3;
    d3.val1 = 12;
    d3.val2 = 0.3;
    
    DataC.val1 = 13;
    DataC.val2 = 0.4;

    DataD d4;
    d4.val1 = 14;
    d4.val2 = 0.5;

    return 0;
}
