//
//  LocationService.m
//  Mesto
//
//  Created by x on 4/3/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "LocationService.h"

@implementation LocationService{
//    __strong void (^newLocation)(NSString *);
//    __strong void (^didChangeStatus)(Boolean);
    
}


- (instancetype)init
{
    self = [super init];
    __block LocationService *_that = self;
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
        self.manager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.manager startUpdatingLocation];
        
        
        
        _didChangeStatus = ^(Boolean success){
            NSLog(@"didChangeStatus: %hhu",success);
            
            if(success){
                [_that getLocation];
            }
        };
        
        
        _newLocation = ^(NSString *result){
//            NSLog(@"%@", result);
        };
    }
    
    
    
    return self;
}

- (void)requestLocationAuthorization{
    [self.manager requestWhenInUseAuthorization];
}

- (void)getLocation{
    [self.manager requestLocation];
}

- (CLAuthorizationStatus) status {
    CLAuthorizationStatus aa = CLLocationManager.authorizationStatus;
    return aa;
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
   
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"There was an error retrieving your location" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //button click event
    }];
    [alert addAction:ok];
    [alert presentedViewController];
    //[self presentViewController:alert animated:YES completion:nil];
    _newLocation(error.description);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *crnLoc = [locations lastObject];
//    NSLog(@"Current location: %@",crnLoc);
    NSString *strLoc = [NSString stringWithFormat:@"Location= lat: %f, lng: %f", crnLoc.coordinate.latitude, crnLoc.coordinate.longitude];
    _newLocation(strLoc);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    NSLog(@"%d", status);
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        _didChangeStatus(true);
    }
    else{
        _didChangeStatus(false);
    }
    
}




@end
