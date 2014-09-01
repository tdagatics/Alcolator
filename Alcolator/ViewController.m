//
//  ViewController.m
//  Alcolator
//
//  Created by Anthony Dagati on 8/30/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


//@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
//@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
//@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
//@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;


@end

@implementation ViewController

-(void)loadView {
    // Allocate and initialize the all-encompassing view
    self.view = [[UIView alloc] init];
    
    // Allocate and initialize each of our views and the gesture recognizer
    UITextField *textField = [[UITextField alloc] init];
    UISlider *slider = [[UISlider alloc] init];
    UILabel *label = [[UILabel alloc] init];
    //UIButton *button = [[UIButton alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    
    // Add each view and the gesture recognizer as the view's subviews
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addGestureRecognizer:tap];
    
    // Assign the views and gesture recognizer to our properties
    self.beerPercentTextField = textField;
    self.beerCountSlider = slider;
    self.resultLabel = label;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
}

- (void)viewDidLoad
{
    // Calls the supperclass's implementation
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set our primary view's background color to lightGrayColor
    self.view.backgroundColor = [UIColor blackColor];
    
    // Tells the text field that 'self', this instance of 'ViewController' should be treated as the textfield's delegate
    self.beerPercentTextField.backgroundColor = [UIColor whiteColor];
    self.beerPercentTextField.delegate = self;
    
    // Set the placeholder text
    self.beerPercentTextField.textColor = [UIColor lightGrayColor];
    self.beerPercentTextField.placeholder = NSLocalizedString(@"% Alcohol Content Per Beer", @"Beer percent placeholder text");
    

    // Tells 'self.beerCountSlider' that when its value changed, it should call '[self -sliderValueDidChange:]'.
    // This is equivalent to connecting the IBAction in our previous checkpoint
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];

    // Set the minimum and maximum number of beers
    self.beerCountSlider.minimumValue = 1;
    self.beerCountSlider.maximumValue = 10;
    
    // Tells 'self.calculateButton' that when a finger is lifted from the button while still inside its bounds, to call '[self -buttonPressed:]'
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Set the title of the button
    [self.calculateButton setTitle:NSLocalizedString(@"Calculate!", @"Calculate command") forState:UIControlStateNormal];
    
    // Tells the tap gesture recognizer to call '[self -tapGestureDidFire:]; when it detects a tap.
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];
    
    // Gets rid of the maximum number of lines on the label
    self.resultLabel.numberOfLines = 0;
    self.resultLabel.textColor = [UIColor whiteColor];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat viewWidth = 320;
    CGFloat beerTextFieldPadding = 90;
    CGFloat padding2 = 20;
    CGFloat itemWidth = viewWidth - padding2 - padding2;
    CGFloat itemHeight = 40;
    
    self.beerPercentTextField.frame = CGRectMake(padding2, beerTextFieldPadding, itemWidth, itemHeight);
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding2, bottomOfTextField + padding2, itemWidth, itemHeight);
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding2, bottomOfSlider + padding2, itemWidth, itemHeight * 4);
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding2, bottomOfLabel + padding2, itemWidth, itemHeight);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)textFieldDidChange:(UITextField *)sender {
- (void)textFieldDidChange:(UITextField *)sender {
    // Make sure the text is a number
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
    // The user typed 0, or something that's not a number, so respond nil and/or clear the field
        sender.text = nil;
    }
}

//- (IBAction)sliderValueDidChange:(UISlider *)sender {
- (void)sliderValueDidChange:(UISlider *)sender {

    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
}

//- (IBAction)buttonPressed:(UIButton *)sender {
- (void)buttonPressed:(UIButton *)sender {

    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers..
    
    int numberOfBeers = self.beerCountSlider.value;
    
    int ouncesInOneBeerGlass = 12; // assumes 12 oz. beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of wine...
    
    float ouncesInOneWineGlass = 5; // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13; // 13% is average
    
    float ouncesOfAlcholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcholPerWineGlass;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
        // generate the result text, and display it in the label
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.lf %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
        self.resultLabel.text = resultText;
    }


//- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
-(void)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}





@end
