//
//  AppDelegate.h
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Mesto/Service/LocationService.h"
#import "../Mesto/Screen/Location/LocationViewController.h"
#import "../Mesto/Screen/General/NavigationController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
//- (int)newMethod:(ArgType *)arg;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LocationService *locationService;
@property (strong, nonatomic) UIStoryboard *storyboard;



@end

