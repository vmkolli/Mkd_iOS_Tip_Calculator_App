//
//  SettingsViewController.m
//  MkdTipCalculator
//
//  Created by Vinayakumar Kolli on 1/17/15.
//  Copyright (c) 2015 Vinayakumar Kolli. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tipValue;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipValueSelector;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onDoneClick)];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float tipPercentage = [defaults floatForKey:@"tipPercentage"];
    
    if (tipPercentage <= 0) {
        tipPercentage = 15.0;
    }
    
    self.tipValue.text = [NSString stringWithFormat:@"%0.2f", tipPercentage];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) onDoneClick {
    float tipPercentage;
    tipPercentage = [self.tipValue.text floatValue];
    
    if (tipPercentage > 0) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setFloat:tipPercentage forKey:@"tipPercentage"];
        [defaults synchronize];
        
        [[self navigationController] popViewControllerAnimated:YES];
        
    } else {
        
        [[[UIAlertView alloc] initWithTitle:@"Invalid input"
                                    message:@"Percentage must be a decimal value"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
