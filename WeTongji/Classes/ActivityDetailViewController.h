//
//  ActivityDetailViewController.h
//  WeTongji
//
//  Created by 紫川 王 on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTNavigationViewController.h"
#import "Activity.h"

@interface ActivityDetailViewController : WTNavigationViewController

- (id)initWithActivity:(Activity *)activity;

@end