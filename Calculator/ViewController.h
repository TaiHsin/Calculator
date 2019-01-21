//
//  ViewController.h
//  Calculator
//
//  Created by Tsihsin Lee on 2019/1/17.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (NSString *)compose:(NSString *)origin input:(NSString *)input;

@property (weak, nonatomic) IBOutlet UILabel *operator;



@end

