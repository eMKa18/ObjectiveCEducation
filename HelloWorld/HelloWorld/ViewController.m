//
//  ViewController.m
//  HelloWorld
//
//  Created by Monika Koschel on 07.05.2016.
//  Copyright © 2016 Monika Koschel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonTapped:(id)sender {
    self.helloLabel.text = @"It worked!";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
