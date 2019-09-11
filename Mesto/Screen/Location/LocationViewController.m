//
//  LocationViewController.m
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "LocationViewController.h"
#import "../../../Mesto/Screen/General/NavigationController.h"
#import "../../../Mesto/Screen/List/RestaurantsTableViewController.h"


@interface LocationViewController ()

@end

@implementation LocationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationView.didTapAllow = ^(void){
        NSLog(@"tap allow");
        [self.locationService requestLocationAuthorization];
    };
    
    self.locationService.didChangeStatus = ^(Boolean status) {
        if(status){
            NSLog(@"***** NAVIGATION CONTROLLER *****");
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle];
            NavigationController *nav = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantNavigationController"];
            [self presentViewController:nav animated:YES completion:nil];
        }
    };
}

@end
