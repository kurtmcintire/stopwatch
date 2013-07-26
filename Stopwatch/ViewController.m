//
//  ViewController.m
//  Stopwatch
//
//  Created by Kurt McIntire on 7/26/13.
//  Copyright (c) 2013 KurtMcIntire. All rights reserved.
//

// Adding a comment to set up Git

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Whenever the app loads, the stopwatch is not active.
    boolActive = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)timerAction:(id)sender {
    
    // Check if stopwatch active
    
    if (boolActive == NO) {
       
        // If not active
        _timerMain = [NSTimer scheduledTimerWithTimeInterval:1.0/1.0 target:self selector:@selector(timerControl) userInfo:nil repeats:YES];
        
        // Set the bool to Active now that timerControl is called
        boolActive = YES;
        
        // Now that the stopwatch is running, change the button title to Stop
        [_startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        intTime = 0;
        NSLog(@"Stopwatch started");
        
    } else {
        
        // If active
        [_timerMain invalidate];
        
        boolActive = NO;
        
        [_startStopButton setTitle:@"Start" forState:UIControlStateNormal];
        
        NSLog(@"Stopped");
        
    }
}

-(void)timerControl {
    
    intTime += 1;
    
    _timerLabel.text = [NSString stringWithFormat:@"%i", intTime];
    NSLog(@"Stopwatch time = %i", intTime);
    
}

@end
