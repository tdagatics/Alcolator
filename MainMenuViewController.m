//
//  MainMenuViewController.m
//  Alcolator
//
//  Created by Anthony Dagati on 9/1/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "MainMenuViewController.h"


@implementation MainMenuViewController : ViewController

-(void)loadView {
    // Allocate and initialize the all-encompassing view
    self.view = [[UIView alloc] init];
    
    UIButton *wineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *whiskeyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [wineButton addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    wineButton.frame = CGRectMake(14.0, 10.0, 74.0, 46.0);
    [whiskeyButton addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    whiskeyButton.frame = CGRectMake(28.0, 10, 74, 46);
    
    [self.view addSubview:wineButton];
    [self.view addSubview:whiskeyButton];
    
}

-(void) winePressed:(UIButton *)sender {
    // Allocate memory for one ViewController and create it using alloc
    // Initialize view controller using init
    // Create a variable called wineVC that points to our new controller's memory address
    // Look for a navigation controller, which is a property of UIViewController
    // that returns the nearest Navigation Controller, and pushes wineVC onto the
    // Navigation Stack
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
    }

    
-(void) whiskeyPressed:(UIButton *)sender {
    ViewController *whiskeyVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated: YES];
    
}
    
@end
