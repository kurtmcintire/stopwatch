//
//  CommuteViewController.h
//  Stopwatch
//
//  Created by Kurt McIntire on 7/31/13.
//  Copyright (c) 2013 KurtMcIntire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommuteViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end