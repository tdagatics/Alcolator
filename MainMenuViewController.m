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
    
    UIButton *wineButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *whiskeyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];


    // Add each view and the gesture recognizer as the view's subviews
    [self.view addSubview:wineButton];
    [self.view addSubview:whiskeyButton];
    [self.view addGestureRecognizer:tap];
    
}

- (void)viewDidLoad
{
    // Calls the supperclass's implementation
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set our primary view's background color to blueColor
    self.title = NSLocalizedString(@"Main Menu", @"main menu"); // Set viewController's title
    self.view.backgroundColor = [UIColor orangeColor];
    
    // Tells 'self.wineButton' that when a finger is lifted from the button while still inside its bounds, to call '[self -winePressed:]'
    [self.wineButton addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];

    // Tells 'self.whiskeyButton' that when a finger is lifted from the button while still inside its bounds, to call '[self -whiskeyPressed:]'
    [self.whiskeyButton addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];

    // Set the title of the wineButton
    [self.wineButton setTitle:NSLocalizedString(@"Wine", @"Wine button") forState:UIControlStateNormal];

    // Set the title of the whiskeyButton
    [self.whiskeyButton setTitle:NSLocalizedString(@"Whiskey", @"Whiskey button") forState:UIControlStateNormal];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat viewWidth = 320;
    CGFloat x = 90;
    CGFloat y = 20;
    CGFloat itemWidth = viewWidth - y - y;
    CGFloat itemHeight = 40;
    
    self.wineButton.frame = CGRectMake(x, y, itemWidth, itemHeight);
    self.whiskeyButton.frame = CGRectMake(x, y+y, itemWidth, itemHeight);
    
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
