//
//  FavoriteOutlineViewController.m
//  WeTongji
//
//  Created by 紫川 王 on 12-5-4.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import "FavoriteOutlineViewController.h"
#import "Activity+Addition.h"
#import "WTClient.h"

@interface FavoriteOutlineViewController ()

@end

@implementation FavoriteOutlineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"ChannelOutlineTableViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark -
#pragma mark CoreDataTableViewController methods to overwrite

- (void)configureRequest:(NSFetchRequest *)request
{
    [request setEntity:[NSEntityDescription entityForName:@"Activity" inManagedObjectContext:self.managedObjectContext]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF IN %@", self.currentUser.favor];
    [request setPredicate:predicate];
    NSSortDescriptor *sortByUpdate = [[NSSortDescriptor alloc] initWithKey:@"favorite_update_date" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObjects:sortByUpdate, nil];
    [request setSortDescriptors:descriptors]; 
    request.fetchBatchSize = 20;
}

#pragma mark -
#pragma mark EGORefresh Method

- (void)refresh {
    self.nextPage = 0;
    [self loadMoreData];
}

- (void)clearData
{
    [self.currentUser removeFavor:self.currentUser.favor];
}

- (void)loadMoreData {
    WTClient *client = [WTClient client];
    [client setCompletionBlock:^(WTClient *client) {
        if(!client.hasError) {
            if(self.nextPage == 0)
                [self clearData];
            NSArray *array = [client.responseData objectForKey:@"Activities"];
            for(NSDictionary *activityDict in array) {
                Activity *activity = [Activity insertActivity:activityDict inManagedObjectContext:self.managedObjectContext];
                [self.currentUser addFavorObject:activity];
                activity.favorite_update_date = [NSDate date];
            }
            
            self.nextPage = [[NSString stringWithFormat:@"%@", [client.responseData objectForKey:@"NextPager"]] intValue];
            [self configureTableViewFooter];
        }
        [self doneLoadingTableViewData];
    }];
    [client getFavotiteList:self.nextPage];
}

@end
