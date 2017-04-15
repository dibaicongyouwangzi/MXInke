  //
//  MXLocationManager.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface MXLocationManager()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locManager;
@property (nonatomic, copy) LocationBlock block;

@end

@implementation MXLocationManager

+ (instancetype)sharedManager {
    
    static MXLocationManager *_manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[MXLocationManager alloc] init];
    });
    return _manager;
}

- (instancetype)init {

    if (self = [super init]) {
        _locManager = [[CLLocationManager alloc] init];
        // 设置精确度
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // 设置定位精确到一百米
        _locManager.distanceFilter = 100;
        
        _locManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            MXLog(@"开启定位服务");
        } else {
            // 当前状态
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_locManager requestWhenInUseAuthorization];
            }
        }
    }
    return self;
}


- (void)getGps:(LocationBlock)block {
    self.block = block;
    // 发起开始定位请求
    [self.locManager startUpdatingLocation];
}



#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocationCoordinate2D coor = locations.lastObject.coordinate;
    NSString *lat = [NSString stringWithFormat:@"%@",@(coor.latitude)];
    NSString *lon = [NSString stringWithFormat:@"%@",@(coor.longitude)];
   
    [MXLocationManager sharedManager].lat = lat;
    [MXLocationManager sharedManager].lon = lon;
    
    self.block(lat, lon);
    
    [self.locManager stopUpdatingLocation];
}


@end
