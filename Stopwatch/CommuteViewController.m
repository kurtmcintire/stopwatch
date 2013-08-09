//
//  CommuteViewController.m
//  Stopwatch
//
//  Created by Kurt McIntire on 7/31/13.
//  Copyright (c) 2013 KurtMcIntire. All rights reserved.
//

#import "CommuteViewController.h"

@interface CommuteViewController ()

@property (nonatomic, strong) UIScrollView *outerScrollView;

@end

@implementation CommuteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadScrollerImages];
    
}

- (void)loadScrollerImages {
    const int NumPages = 3;
    self.scrollView.contentSize = CGSizeMake(NumPages * self.view.frame.size.width, 50);
    self.scrollView.pagingEnabled = YES;
    for (int i = 0; i < NumPages; i++) {
        NSString *imageName = [NSString stringWithFormat:@"scroller-image-%d.jpg", i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        CGRect frame = imageView.frame;
        frame.origin.x = i * self.view.frame.size.width;
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.outerScrollView) {
        CGRect frame = self.scrollView.frame;
        frame.origin.y = scrollView.contentOffset.y;
        self.scrollView.frame = frame;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arc4random() % 10 + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %d", section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %d:%d", indexPath.section, indexPath.row];
    return cell;
}

@end
