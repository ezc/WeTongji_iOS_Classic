//
//  WTMainTableViewController.h
//  WeTongji
//
//  Created by 紫川 王 on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTTabelViewController.h"

@interface WTMainTableViewController : WTTabelViewController 

@property (nonatomic, strong) NSMutableArray *dataSourceIndexArray;
@property (nonatomic, strong) NSMutableDictionary *dataSourceDictionary;

//methods to overwrite
- (void)configureDataSource;

@end
