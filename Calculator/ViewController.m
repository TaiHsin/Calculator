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
//@property NSString *operator;

@end

@implementation ViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultLabel.text = @" ";
    self.inputLabel.text = @"0";
    self.operatorLabel.text = @" ";
    
}

- (IBAction)inputNumber:(UIButton *)sender {
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputLabel.text;
    
    if ([currentString length] == 1 && [[currentString substringFromIndex: 0] isEqualToString: @"0"]) {
        currentString = @"";
    }
    
    self.inputLabel.text = [currentString stringByAppendingString: inputString];
}

- (IBAction)mathSymbolExpression:(UIButton *)sender {
    
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputLabel.text;
    NSString *resultString = self.resultLabel.text;
    NSString *operator = self.operatorLabel.text;
    NSDecimalNumber *currentNumber = [NSDecimalNumber decimalNumberWithString: currentString];
    NSDecimalNumber *resultNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt: 0];
    
    if (![resultString isEqualToString: @" "]) {
        resultNumber = [NSDecimalNumber decimalNumberWithString: resultString];
    }

    if ([inputString isEqualToString: @"+"]) {
        resultString = [self calculateResult:operator
                                  withResult:resultNumber
                                 withCurrent:currentNumber];

        self.resultLabel.text = resultString;
        self.operatorLabel.text = inputString;
        self.inputLabel.text = @"0";

    } else if ([inputString isEqualToString: @"-"]) {
        resultString = [self calculateResult:operator
                                  withResult:resultNumber
                                 withCurrent:currentNumber];

        self.resultLabel.text = resultString;
        self.operatorLabel.text = inputString;
        self.inputLabel.text = @"0";

    } else if ([inputString isEqualToString: @"*"]) {
        resultString = [self calculateResult:operator
                                  withResult:resultNumber
                                 withCurrent:currentNumber];

        self.resultLabel.text = resultString;
        self.operatorLabel.text = inputString;
        self.inputLabel.text = @"0";

    } else if ([inputString isEqualToString: @"/"]) {

        resultString = [self calculateResult:operator
                                  withResult:resultNumber
                                 withCurrent:currentNumber];

        self.resultLabel.text = resultString;
        self.operatorLabel.text = inputString;
        self.inputLabel.text = @"0";

    } else {
        resultString = [self calculateResult:operator
                                  withResult:resultNumber
                                 withCurrent:currentNumber];

        self.resultLabel.text = resultString;
        self.operatorLabel.text = inputString;
        self.inputLabel.text = @"0";
    }
}

- (IBAction)clearAll:(UIButton *)sender {
    self.inputLabel.text = @"0";
    self.resultLabel.text = @" ";
    self.operatorLabel.text = @" ";
}

- (IBAction)clearMemory:(UIButton *)sender {
}


@end
