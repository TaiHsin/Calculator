//
//  ViewController.m
//  Calculator
//
//  Created by Tsihsin Lee on 2019/1/17.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currentLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property NSDecimalNumber *memoryNumber;
@property BOOL flag;

@end

@implementation ViewController

- (NSString *)compose:(NSString *)origin input:(NSString *)input
{
    if ([origin isEqualToString:@"0"]) {
        if ([input isEqualToString:@"0"]) {
            return @"0";
        }
        else if ([input isEqualToString:@"."]) {
            return @"0.";
        }
        else if ([input isEqualToString:@"+-"]) {
            return @"-0";
        }
        else {
            return input;
        }
    }
    if ([origin isEqualToString:@"-0"]) {
        if ([input isEqualToString:@"0"]) {
            return @"-0";
        }
        else if ([input isEqualToString:@"."]) {
            return @"-0.";
        }
        else if ([input isEqualToString:@"+-"]) {
            return @"0";
        }
        else {
            return [NSString stringWithFormat:@"-%@", input];
        }
    }
    if ([origin length] >= 15) {
        return origin;
    }

    if ([input isEqualToString:@"."]) {
        if ([origin rangeOfString:@"."].location != NSNotFound) {
            return origin;
        }
        else {
            return [NSString stringWithFormat:@"%@.", origin];
        }
    }
    if ([input isEqualToString:@"+-"]) {
        if ([origin characterAtIndex:0]  == '-') {
            return [origin substringFromIndex:1];
        }
        else {
            return [NSString stringWithFormat:@"-%@", origin];
        }
    }
    
    return [NSString stringWithFormat:@"%@%@", origin, input];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetLabels];

    self.memoryNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt: 0];
}

- (IBAction)inputNumber:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.currentLabel.text;
    currentString = [self memoryFlagCheck: currentString];

    if ([currentString length] == 1 &&
        [[currentString substringFromIndex: 0] isEqualToString: @"0"]) {
        currentString = @"";
        
    } else if ([currentString isEqualToString: @"-0"]) {
        currentString = @"-";
    }
    
    self.currentLabel.text = [currentString stringByAppendingString: inputString];
    [self limitLabelLength];
}

- (IBAction)operatorCalculation:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.currentLabel.text;
    NSString *resultString = self.resultLabel.text;
    NSString *operator = self.operatorLabel.text;
    NSDecimalNumber *currentNumber = [NSDecimalNumber decimalNumberWithString: currentString];
    NSDecimalNumber *resultNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt: 0];
    
    if (![resultString isEqualToString: @" "]) {
        resultNumber = [NSDecimalNumber decimalNumberWithString: resultString];
    }

    resultString = [self calculateResult:operator
                              withResult:resultNumber
                             withCurrent:currentNumber];

    [self resetLabels];
    self.resultLabel.text = resultString;
    self.operatorLabel.text = inputString;
}

- (IBAction)mathSymbol:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.currentLabel.text;
    currentString = [self memoryFlagCheck: currentString];
    
    if ([inputString isEqualToString: @"."]) {
        NSRange range = [currentString rangeOfString: @"."];
        
        if (range.length == 0) {
            self.currentLabel.text = [currentString stringByAppendingString: inputString];
        }
        
    } else if ([inputString isEqualToString: @"+-"]) {
        NSRange range = [currentString rangeOfString: @"-"];
        
        if (range.length == 0) {
            self.currentLabel.text = [@"-" stringByAppendingString: currentString];
        
        } else {
            self.currentLabel.text = [currentString substringFromIndex: 1];
        }
        
    } else {
        [self resetLabels];
    }
}

- (IBAction)memoryExpression:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.currentLabel.text;
    
    // Refactor: another method
    
    NSDecimalNumber *currentNumber = [NSDecimalNumber decimalNumberWithString: currentString];
    self.flag = true;
    
    if ([inputString isEqualToString: @"M+"]) {
        self.memoryNumber = [self.memoryNumber decimalNumberByAdding: currentNumber];
        
    } else if ([inputString isEqualToString: @"M-"]) {
        self.memoryNumber = [self.memoryNumber decimalNumberBySubtracting: currentNumber];
        
    } else if ([inputString isEqualToString: @"MR"]) {
        NSString *memoryString = [NSString stringWithFormat: @"%@", self.memoryNumber];
        self.currentLabel.text = memoryString;
        
    } else {
        self.memoryNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt: 0];
    }
}

- (NSString *)calculateResult:(NSString *)operator
                   withResult:(NSDecimalNumber *)resultNumber
                  withCurrent:(NSDecimalNumber *)currentNumber {

    
    if ([operator isEqualToString: @"+"]) {
        resultNumber = [resultNumber decimalNumberByAdding: currentNumber];
        
    } else if ([operator isEqualToString: @"-"]) {
        resultNumber = [resultNumber decimalNumberBySubtracting: currentNumber];
        
    } else if ([operator isEqualToString: @"*"]) {
        resultNumber = [resultNumber decimalNumberByMultiplyingBy: currentNumber];
        
    } else if ([operator isEqualToString: @"/"]) {
        if ([currentNumber doubleValue] == 0) {
            return @"Error";
        }
        resultNumber = [resultNumber decimalNumberByDividingBy: currentNumber];
        
    } else if ([operator isEqualToString: @"="]) {
        resultNumber = resultNumber;
        
    } else {
        resultNumber = currentNumber;
    }
    
    NSString *result = [NSString stringWithFormat: @"%@", resultNumber];
    return result;
}

- (void)resetLabels {
    self.currentLabel.text = @"0";
    self.resultLabel.text = @" ";
    self.operatorLabel.text = @" ";
}

- (void)limitLabelLength {
    if ([self.currentLabel.text length] > 15) {
        self.currentLabel.text = [self.currentLabel.text substringToIndex: 15];
    }
}

- (NSString *)memoryFlagCheck: (NSString *)currentString {
    if (self.flag == true) {
        self.flag = false;
        currentString = @"0";
    }
    
    return currentString;
}

@end
