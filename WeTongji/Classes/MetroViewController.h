//
//  MetroViewController.h
//  WeTongji
//
//  Created by 紫川 王 on 12-3-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetroViewController : UIViewController <UIScrollViewDelegate> {
    CGFloat _lastScrollContentOffsetY;
    BOOL _isScrollingDownward;
    BOOL _willScrollViewDecelerate;
    BOOL _scrollViewStartTouch;
}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIImageView *scrollBackgroundView;


@end
