//
//  DataManager.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 21/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "City.h"
#import "Airport.h"
#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"
#define kLocationServiceDidUpdateCurrentLocation @"LocationServiceDidUpdateCurrentLocation"
NS_ASSUME_NONNULL_BEGIN

typedef enum DataSourceType {
    DataSourceTypeCountry,
    DataSourceTypeCity,
    DataSourceTypeAirport
} DataSourceType;

@interface DataManager : NSObject

+ (instancetype)sharedInstance;
- (void)loadData;
- (City *) cityForIATA:(NSString *)iata;
- (City *) cityForLocation:(CLLocation *)location;
    
@property (nonatomic, strong, readonly) NSArray *countries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

@end
NS_ASSUME_NONNULL_END
