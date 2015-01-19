//
//  ViewController.m
//  MkdTipCalculator
//
//  Created by Vinayakumar Kolli on 1/17/15.
//  Copyright (c) 2015 Vinayakumar Kolli. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountValueField;
@property (weak, nonatomic) IBOutlet UILabel *tipValueField;
@property (weak, nonatomic) IBOutlet UILabel *totalValueField;
@property (weak, nonatomic) IBOutlet UILabel *currentTipPercentage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageValue;
@property (weak, nonatomic) IBOutlet UILabel *SettingsLink;
- (IBAction)tapEvent:(id)sender;
- (IBAction)onSettingsClick;
- (void)updateAmounts;
- (IBAction)tipPercentageChange:(id)sender;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Mkd Calculator";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsClick)];
    [self updateAmounts];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapEvent:(id)sender {
    [self.view endEditing:YES];
    [self updateAmounts];
}

- (void)onSettingsClick {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
    
}

- (void)updateAmounts {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *stringValue = [defaults objectForKey:@"tipPercentage"];
    float storedTipPercentage = [stringValue floatValue];
    self.currentTipPercentage.text = [NSString stringWithFormat:@"%0.2f %", storedTipPercentage];
   
    float amountToBePaid = [self.amountValueField.text floatValue];
    
    float tipAmount = amountToBePaid * storedTipPercentage;
    
    float totalAmountToBePaid = amountToBePaid + tipAmount;
    
    self.tipValueField.text = [NSString stringWithFormat:@"$%0.3f", tipAmount];
    self.totalValueField.text = [NSString stringWithFormat:@"$%0.3f", totalAmountToBePaid];
    

}

- (IBAction)tipPercentageChange:(id)sender {
    NSArray *tipOptions = @[@(0.15),@(0.20),@(0.25)];
    
    float amountToBePaid = [self.amountValueField.text floatValue];
    
    float tipAmount = amountToBePaid * [tipOptions[self.tipPercentageValue.selectedSegmentIndex] floatValue];
    
    
    float totalAmountToBePaid = amountToBePaid + tipAmount;
    
    self.tipValueField.text = [NSString stringWithFormat:@"$%0.3f", tipAmount];
    self.totalValueField.text = [NSString stringWithFormat:@"$%0.3f", totalAmountToBePaid];
    
}
@end
