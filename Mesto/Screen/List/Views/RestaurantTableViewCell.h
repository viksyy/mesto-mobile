//
//  RestaurantTableViewCell.h
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/Restaurant.h"

@interface RestaurantTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (weak, nonatomic) IBOutlet UIImageView *markerImageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
-(void) configure:(Restaurant *)restaurantModel;


@end
