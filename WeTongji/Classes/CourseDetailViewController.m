//
//  CourseDetailViewController.m
//  WeTongji
//
//  Created by 紫川 王 on 12-5-16.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "CourseViewController.h"

@interface CourseDetailViewController ()

@property (nonatomic, strong) CourseViewController *courseViewController;

@end

@implementation CourseDetailViewController

@synthesize courseViewController = _courseViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configureNavBar];
    [self configureCourseView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (id)initWithCourse:(Course *)course {
    self = [super init];
    if(self) {
        self.courseViewController = [[CourseViewController alloc] initWithCourse:course];
    }
    return self;
}

#pragma mark -
#pragma mark UI methods

- (void)configureNavBar {
    UILabel *titleLabel = [UILabel getNavBarTitleLabel:@"课程"];
    self.navigationItem.titleView = titleLabel;    
}

- (void)configureCourseView {
    [self.view insertSubview:self.courseViewController.view belowSubview:self.navBarShadowImageView];
}

@end
