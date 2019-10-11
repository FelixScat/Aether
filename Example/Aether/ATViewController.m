//
//  ATViewController.m
//  Aether
//
//  Created by Felix on 10/08/2019.
//  Copyright (c) 2019 Felix. All rights reserved.
//

#import "ATViewController.h"

@interface ATViewController ()

@end

@implementation ATViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (IBAction)centerButtonAction:(id)sender {
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
