//
//  Restaurant.h
//  Mesto
//
//  Created by x on 4/5/19.
//  Copyright © 2019 x. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *distance;
@property (strong, nonatomic) NSURL *urlImage;

@end
