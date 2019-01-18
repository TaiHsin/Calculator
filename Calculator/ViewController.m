//
//  ViewController.m
//  Calculator
//
//  Created by Tsihsin Lee on 2019/1/17.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *inputLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property NSDecimalNumber *memoryAddNumber;
@property NSDecimalNumber *memorySubNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetLabels];

    NSDecimalNumber *memoryAddNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt: 0];
    NSDecimalNumber *memorySubNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt: 0];
}

- (IBAction)inputNumber:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputLabel.text;

    if ([currentString length] == 1 &&
        [[currentString substringFromIndex: 0] isEqualToString: @"0"]) {
        currentString = @"";
        
    } else if ([currentString isEqualToString: @"-0"]) {
        currentString = @"-";
    }
    
    self.inputLabel.text = [currentString stringByAppendingString: inputString];
}

- (IBAction)operatorCalculation:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputLabel.text;
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
    NSString *currentString = self.inputLabel.text;
    
    if ([inputString isEqualToString: @"."]) {
        NSRange range = [currentString rangeOfString: @"."];
        
        if (range.length == 0) {
            self.inputLabel.text = [currentString stringByAppendingString: inputString];
        }
        
    } else if ([inputString isEqualToString: @"+-"]) {
        NSRange range = [currentString rangeOfString: @"-"];
        
        if (range.length == 0) {
            self.inputLabel.text = [@"-" stringByAppendingString: currentString];
        
        } else {
            self.inputLabel.text = [currentString substringFromIndex: 1];
        }
    }
}

- (IBAction)clearAll:(UIButton *)sender {
    [self resetLabels];
}

- (IBAction)clearMemory:(UIButton *)sender {

}

- (IBAction)memoryExpression:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputLabel.text;
    NSDecimalNumber *inputNumber = [NSDecimalNumber decimalNumberWithString: inputString];
    
    if ([inputString isEqualToString: @"M+"]) {
        self.memoryAddNumber = [self.memoryAddNumber decimalNumberByAdding: inputNumber];
        
    } else if ([inputString isEqualToString: @"M-"]) {
        self.memorySubNumber = [self.memorySubNumber decimalNumberBySubtracting: inputNumber];
        
    } else if ([inputString isEqualToString: @"MR"]) {
        
        
    }
}

- (NSString *)calculateResult:(NSString *)operator
                   withResult:(NSDecimalNumber *)resultNumber
                  withCurrent:(NSDecimalNumber *)currentNumber {
    NSString *result = [[NSString alloc] init];
    
    if ([operator isEqualToString: @"+"]) {
        resultNumber = [resultNumber decimalNumberByAdding: currentNumber];
        
    } else if ([operator isEqualToString: @"-"]) {
        resultNumber = [resultNumber decimalNumberBySubtracting: currentNumber];
        
    } else if ([operator isEqualToString: @"*"]) {
        resultNumber = [resultNumber decimalNumberByMultiplyingBy: currentNumber];
        
    } else if ([operator isEqualToString: @"/"]) {
        resultNumber = [resultNumber decimalNumberByDividingBy: currentNumber];
        
    } else if ([operator isEqualToString: @"="]) {
        resultNumber = resultNumber;
        
    } else {
        resultNumber = currentNumber;
    }
    
    result = [NSString stringWithFormat: @"%@", resultNumber];
    return result;
}

- (void)resetLabels {
    self.inputLabel.text = @"0";
    self.resultLabel.text = @" ";
    self.operatorLabel.text = @" ";
}

@end
