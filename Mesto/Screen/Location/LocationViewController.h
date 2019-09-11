//
//  LocationViewController.h
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "ViewController.h"
#import "LocationView.h"
#import "../../../Mesto/Service/LocationService.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationViewController : ViewController
@property (weak, nonatomic) IBOutlet LocationView *locationView;
@property (weak, nonatomic) LocationService *locationService;
@end

NS_ASSUME_NONNULL_END
