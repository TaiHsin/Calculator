//
//  ViewController.m
//  Calculator
//
//  Created by Tsihsin Lee on 2019/1/17.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultTextField;
@property (weak, nonatomic) IBOutlet UILabel *symbolsLabel;

//@property NSString *inputString;

//@property NSMutableString *inputString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultTextField.text = @" ";
    self.inputTextField.text = @"0";
    
}

- (IBAction)inputNumber:(UIButton *)sender {
    
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputTextField.text;
    
    
    if ([currentString length] == 1 && [[currentString substringFromIndex: 0] isEqualToString: @"0"]) {
        
        currentString = @"";
    }
    
    self.inputTextField.text = [currentString stringByAppendingString: inputString];
}

- (IBAction)mathSymbolExpression:(UIButton *)sender {
    
    NSString *inputString = [[sender titleLabel] text];
    NSString *currentString = self.inputTextField.text;
    NSString *resultString = self.resultTextField.text;
    NSDecimalNumber *currentNumber = [NSDecimalNumber decimalNumberWithString: currentString];
//    NSDecimalNumber *resultNumber = [[NSDecimalNumber alloc] init];
    NSDecimalNumber *resultNumber = [NSDecimalNumber numberWithInt: 0];
    
    if (![resultString isEqualToString: @" "]) {
        
        resultNumber = [NSDecimalNumber decimalNumberWithString: resultString];
    }
    
    if ([inputString isEqualToString: @"+"]) {
        
        [resultNumber decimalNumberByAdding: currentNumber];
        resultString = [NSString stringWithFormat: @"%@", resultNumber];
        self.resultTextField.text = resultString;
    }
}

- (IBAction)clearAll:(UIButton *)sender {

    self.inputTextField.text = @"0";
}

- (IBAction)clearMemory:(UIButton *)sender {
}


@end
