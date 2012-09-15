//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Kris Fields on 8/9/12.
//  Copyright (c) 2012 Kris Fields. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
    if (_operandStack == nil){
        _operandStack = [[NSMutableArray alloc]init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand {
    NSLog(@"BRAIN:pushOperand, operand = %f", operand);
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
    NSLog(@"BRAIN:pushOperand, operandStack = %@", _operandStack);
}
- (double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}
- (double)performOperation:(NSString *)operation {
    
    double result = 0;
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"-"]){
        result = [self popOperand] - [self popOperand];
    } else if ([operation isEqualToString:@"*"]){
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"/"]){
        result = [self popOperand] / [self popOperand];
    }
    
    [self pushOperand:result];
    return result;
}
@end
