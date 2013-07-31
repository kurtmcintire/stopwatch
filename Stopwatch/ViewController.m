//
//  ViewController.m
//  Stopwatch
//
//  Created by Kurt McIntire on 7/26/13.
//  Copyright (c) 2013 KurtMcIntire. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SWObject.h"

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
    intTime = 0;
    
    self.dateArray = [[NSMutableArray alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"View Appeared");
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
        [_dateArray addObject:_startDate];
        NSLog(@"%@", _startDate);
        
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
        
        // If active
        [_timerMain invalidate];
        
        boolActive = NO;
        
        [_startStopButton setTitle:@"Start" forState:UIControlStateNormal];
        
        NSLog(@"Stopwatch stopped");
        
        _stopDate = [NSDate date];
        
        [_dateArray addObject:_stopDate];
    
        NSLog(@"%@", _stopDate);
        
        _resetButton.hidden = FALSE;
    }
}

-(void)timerControl {
    
    intTime += 1.0;
    
    double seconds = fmod(intTime / 10.0, 60.0);
    double minutes = fmod(trunc(intTime / 600.0), 60.0);
    double hours = trunc(intTime / 36000.0);
    
    _timerLabel.text = [NSString stringWithFormat:@"%02.0f:%02.0f:%04.1f", hours, minutes, seconds];
    
}

- (IBAction)resetAction:(id)sender {
    
    intTime = 0;
    double seconds = fmod(intTime, 60.0);
    double minutes = fmod(trunc(intTime / 60.0), 60.0);
    double hours = trunc(intTime / 3600.0);

    _timerLabel.text = [NSString stringWithFormat:@"%02.0f:%02.0f:%04.1f", hours, minutes, seconds];
}

- (IBAction)saveAction:(id)sender {
    
    // Error if clock running?
    // Is an if statement/exception needed here?
    
    NSLog(@"Saving time");
    NSLog(@"Displaying start/stop log: %@", _dateArray);
    
    NSLog(@"Calculating commute duration...");
    
    // Calculates commute time for one start stop interval
//    NSCalendar *gregorian = [[NSCalendar alloc]
//                             initWithCalendarIdentifier:NSGregorianCalendar];
//    
//    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit| NSSecondCalendarUnit;
//    
//    NSDateComponents *components = [gregorian components:unitFlags
//                                                fromDate:_startDate
//                                                  toDate:_stopDate options:0];
//    
//    NSLog(@"Commute Time: %i hours, %i minutes , %i seconds", components.hour, components.minute, components.second);
    
}

@end
