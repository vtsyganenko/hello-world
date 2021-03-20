#import "calc.h"

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

-(void) printLastCalc
{
    NSLog (@"%g %c %g = %g", value1_, action_, value2_, [self calc]);
}

@end
