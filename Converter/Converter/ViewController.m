//
//  ViewController.m
//  Converter
//
//  Created by Monika Koschel on 07.05.2016.
//  Copyright © 2016 Monika Koschel. All rights reserved.
//

#import "ViewController.h"

double convertTo(int unit, double value) {
    double toFeetsConstant = 3.2808399;
    double toMilesConstant = 0.000621371192;
    double toYardsConstant = 1.0936133;
    
    double result;
    
    switch (unit) {
        case 0:
            result = value * toFeetsConstant;
            break;
        case 1:
            result = value * toMilesConstant;
            break;
        case 2:
            result = value * toYardsConstant;
            break;
        default:
            result = 0;
            break;
    }
    
    return result;
}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitsSegment;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation ViewController

int FEETS = 0;
int MILES = 1;
int YARDS = 2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//(void) convertTo: 

- (IBAction)convertTapped:(id)sender {
    
    NSMutableString *answer = [NSMutableString new];
    
    double input = [self.numberField.text doubleValue];
    double result;
    if (self.unitsSegment.selectedSegmentIndex == 0) {
        result = convertTo(FEETS, input);
    } else if(self.unitsSegment.selectedSegmentIndex == 1){
        result = convertTo(MILES, input);
    } else {
        result = convertTo(YARDS, input);
    }
    [answer appendString:[@(result) stringValue]];
    self.answerLabel.text = answer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
