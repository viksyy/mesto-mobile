//
//  LocationService.h
//  Mesto
//
//  Created by x on 4/3/19.
//  Copyright © 2019 x. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface LocationService : NSObject<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *manager;
@property (nonatomic, strong) void (^newLocation)(NSString *);
@property (nonatomic, strong) void (^didChangeStatus)(Boolean);

-(void) requestLocationAuthorization;
-(void) getLocation;
- (CLAuthorizationStatus) status;
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error;
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations;
-(void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;

@end

NS_ASSUME_NONNULL_END
