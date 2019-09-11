//
//  BaseView.m
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//


#import "BaseView.h"
//
@implementation BaseView

- (instancetype)init
{
    self = [super init];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self.configure];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        [self.configure];
    }
    return self;
}


-(bool) configure{
    return true;
}


@end
