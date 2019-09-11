//
//  RestaurantTableViewCell.m
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "RestaurantTableViewCell.h"

@implementation RestaurantTableViewCell
{
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configure:(Restaurant *)restaurantModel{
    NSLog(@"CONFIGURE with model: %@", restaurantModel.name);
    NSLog(@"CONFIGURE with model: %@", restaurantModel.distance);
    
    self.restaurantNameLabel.text = restaurantModel.name;
    self.locationLabel.text = [NSString stringWithFormat:@"%@", restaurantModel.distance];
    
    NSData *data = [NSData dataWithContentsOfURL:restaurantModel.urlImage];
    @autoreleasepool {
        UIImage *img = [UIImage.new initWithData:data] ;
        [self.restaurantImageView setImage:img];
    }
}

@end
