//
//  ViewController.h
//  Stopwatch
//
//  Created by Kurt McIntire on 7/26/13.
//  Copyright (c) 2013 KurtMcIntire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL boolActive;
    int intTime;

}

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;

@property NSTimeInterval *timeInterval;

@property (nonatomic, strong) NSTimer *timerMain;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;


-(void)timerControl;
- (IBAction)timerAction:(id)sender;
- (IBAction)resetAction:(id)sender;
- (IBAction)saveAction:(id)sender;


@end
