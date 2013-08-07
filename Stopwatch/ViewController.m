//
//  ViewController.m
//  Stopwatch
//
//  Created by Kurt McIntire on 7/26/13.
//  Copyright (c) 2013 KurtMcIntire. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Whenever the app loads, the stopwatch is not active.
    boolActive = NO;
    _resetButton.hidden = TRUE;
    
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
        
        NSLog(@"Stopwatch started");
        
        _startDate = [NSDate date];
        
        _timerMain = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self
                                                                    selector:@selector(timerControl)
                                                                    userInfo:nil
                                                                     repeats:YES];
        
        // Set the bool to Active now that timerControl is called
        boolActive = YES;
        
        // Now that the stopwatch is running, change the button title to Stop
        [_startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        _resetButton.hidden = TRUE;
        
    } else {
        
//        [self timerControl];
        [_timerMain invalidate];
        _timerMain = nil;
        _totalTimeInterval = _timeInterval;

        
        // If active
        
        boolActive = NO;
        
        [_startStopButton setTitle:@"Start" forState:UIControlStateNormal];
        
        NSLog(@"Stopwatch stopped");
        NSLog(@"%@", _timeString);
        
        _resetButton.hidden = FALSE;
    }
    
    
    
    
}

-(void)timerControl {
    
    // Create date from the elapsed time
    NSDate *currentDate = [NSDate date];
    _timeInterval = [currentDate timeIntervalSinceDate:_startDate];
    _timeInterval += _totalTimeInterval;
    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:_timeInterval];
 
    
    // Create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss.S"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    // Format the elapsed time and set it to the label
    _timeString = [dateFormatter stringFromDate:timerDate];
    _timerLabel.text = _timeString;
    
}

- (IBAction)resetAction:(id)sender {

    _startDate = [NSDate date];
    _timerLabel.text = @"00:00:00.0";
     _totalTimeInterval = 0;

}

- (IBAction)saveAction:(id)sender {
    
    // Error if clock running?
    // Is an if statement/exception needed here?
 
    NSLog(@"Commute Time: %@", _timerLabel.text);

}

@end
