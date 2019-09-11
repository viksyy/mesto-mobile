//
//  RestaurantsTableViewController.h
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantTableViewCell.h"

@interface RestaurantsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet RestaurantTableViewCell *restaurantTableViewCell;
@end
