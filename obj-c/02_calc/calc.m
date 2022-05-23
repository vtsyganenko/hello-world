#import "calc.h"

@implementation Calc
{    
    char action_;
}

// this generates the next methods:
// setter setValue1(...) and getter value1()
// setter setValue2(...) and getter value2()
@synthesize value1, value2;

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

-(char) getActionChar
{
    return action_;
}

-(float) calc
{
    float res = 0.0;
    switch(action_){
    case '+': res = value1 + value2; break;
    case '-': res = value1 - value2; break;
    case '*': res = value1 * value2; break;
    case '/': res = value1 / value2; break;
    default:
        break;
    }
    return res;
}

@end
