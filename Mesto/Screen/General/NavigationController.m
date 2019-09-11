//
//  NavigationController.m
//  Peddy
//
//  Created by Rick van der Linde on 03/12/16.
//  Copyright © 2016 Rick van der Linde. All rights reserved.
//

#import "NavigationController.h"


@interface NavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>
@end

@implementation NavigationController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDelegate:self];
    [self.interactivePopGestureRecognizer setDelegate:self];
}

#pragma mark - Gesture recognizer delegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return (self.viewControllers.count > 1);
}

#pragma mark - Overrides

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.enabled = NO;
    [super pushViewController:viewController animated:animated];
}

#pragma mark - Navigation controller delegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.enabled = YES;
}

@end
