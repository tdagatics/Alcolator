//
//  ViewController.h
//  Alcolator
//
//  Created by Anthony Dagati on 8/30/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController < UITextFieldDelegate > // Compiler directive

@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UISlider *beerCountSlider;
@property (weak, nonatomic) UILabel *resultLabel;

-(void)buttonPressed:(UIButton *)sender;


@end
