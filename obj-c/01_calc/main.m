#import <Foundation/Foundation.h>

@interface Calc : NSObject
-(void) setValue: (float) value1 secondValue: (float) value2;
-(void) setActionChar: (char) c;
-(float) calc;
@end

@implementation Calc
{
    float value1_;
    float value2_;
    char action_;
}

-(void) setValue: (float) value1 secondValue: (float) value2
{
    value1_ = value1;
    value2_ = value2;
}

-(void) setActionChar: (char) c
{
    switch(c){
        case '+':
        case '-':
        case '*':
        case '/':
            // its ok
            action_ = c;
            break;
        default:
            NSLog (@"Wrong action character! Use + - * /");
        }
}

-(float) calc
{
    float res = 0.0;
    switch(action_){
    case '+': res = value1_ + value2_; break;
    case '-': res = value1_ - value2_; break;
    case '*': res = value1_ * value2_; break;
    case '/': res = value1_ / value2_; break;
    default:
        break;
    }
    return res;
}
@end

int main(int argc, const char* argv[])
{
    @autoreleasepool{
        
        float v1 = 0.0;
        float v2 = 0.0;
        char action = 0;
        Calc* clc = [[Calc alloc] init];
                
        NSLog (@"Input value 1:");
        scanf("%f", &v1);

        NSLog (@"Input action character:");
        scanf(" %c", &action);

        NSLog (@"Input value 2:");
        scanf("%f", &v2);
        
        [clc setValue: v1 secondValue: v2];
        [clc setActionChar: action];
        NSLog (@"%g %c %g = %g", v1, action, v2, [clc calc]);
    }
    return 0;
}
