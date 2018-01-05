//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Monika Koschel on 10.05.2016.
//  Copyright © 2016 Monika Koschel. All rights reserved.
//

#import "ViewController.h"
#import <CurrencyRequest/CRCurrencyRequest.h>
#import <CurrencyRequest/CRCurrencyResults.h>
#import <CurrencyRequest/CRCurrencyRequestDelegate.h>


@interface ViewController () <CRCurrencyRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dollarsField;

@property (weak, nonatomic) IBOutlet UIButton *convertButton;

@property (weak, nonatomic) IBOutlet UILabel *gbpLabel;

@property (weak, nonatomic) IBOutlet UILabel *plnLabel;

@property (weak, nonatomic) IBOutlet UILabel *mxnLabel;

@property (nonatomic) CRCurrencyRequest *request;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)convertCurrency:(id)sender {
    self.convertButton.enabled = NO;
    self.request = [[CRCurrencyRequest alloc] init];
    self.request.delegate = self;
    [self.request start];
}

- (void) currencyRequest:(CRCurrencyRequest *) req retrievedCurrencies:(CRCurrencyResults *)currencies {
    double gbpValue = currencies.GBP;
    double plnValue = currencies.PLN;
    double mxnValue = currencies.MXN;
    
    double inputValue = [self.dollarsField.text floatValue];
    
    double gbpResult = gbpValue * inputValue;
    double plnResult = plnValue * inputValue;
    double mxnResult = mxnValue * inputValue;
    
    NSString *gbp = [NSString stringWithFormat:@"%.2f", gbpResult];
    NSString *pln = [NSString stringWithFormat:@"%.2f", plnResult];
    NSString *mxn = [NSString stringWithFormat:@"%.2f", mxnResult];
    
    self.gbpLabel.text = gbp;
    self.plnLabel.text = pln;
    self.mxnLabel.text = mxn;
    
    self.convertButton.enabled = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
