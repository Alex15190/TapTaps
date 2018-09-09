//
//  ViewController.m
//  TapTaps
//
//  Created by Alex Chekodanov on 09.09.2018.
//  Copyright © 2018 MERA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *singleLabel;
@property (weak, nonatomic) IBOutlet UILabel *doubleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tripleLabel;
@property (weak, nonatomic) IBOutlet UILabel *quadrupleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
    
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap];
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UITapGestureRecognizer *tripleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tripleTap)];
    tripleTap.numberOfTapsRequired = 3;
    tripleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tripleTap];
    [doubleTap requireGestureRecognizerToFail:tripleTap];
    
    UITapGestureRecognizer *quadrupleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quadrupleTap)];
    quadrupleTap.numberOfTapsRequired = 4;
    quadrupleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:quadrupleTap];
    [tripleTap requireGestureRecognizerToFail:quadrupleTap];
}

- (void)singleTap
{
    self.singleLabel.text = @"Single Tap Detected";
    [self performSelector:@selector(clearLabel:) withObject:self.singleLabel afterDelay:1.6f];
    
}

- (void)doubleTap
{
    self.doubleLabel.text = @"Double Tap Detected";
    [self performSelector:@selector(clearLabel:) withObject:self.doubleLabel afterDelay:1.6f];
}

- (void)tripleTap
{
    self.tripleLabel.text = @"Triple Tap Detected";
    [self performSelector:@selector(clearLabel:) withObject:self.tripleLabel afterDelay:1.6f];
}

- (void)quadrupleTap
{
    self.quadrupleLabel.text = @"Quadruple Tap Detected";
    [self performSelector:@selector(clearLabel:) withObject:self.quadrupleLabel afterDelay:1.6f];
}

- (void)clearLabel:(UILabel *)label
{
    label.text = @"";
}

@end
