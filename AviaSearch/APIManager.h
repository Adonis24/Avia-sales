//
//  APIManager.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 22/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "Ticket.h"
#import "DataManager.h"
#import "APIManager.h"
#define API_TOKEN @"c9dfff2cb345963c772b06d71fba53bd"
#define API_URL_IP_ADDRESS @"https://api.ipify.org/?format=json"
#define API_URL_CHEAP @"https://api.travelpayouts.com/v1/prices/cheap"
#define API_URL_CITY_FROM_IP @"https://www.travelpayouts.com/whereami?ip="
#define API_URL_MAP_PRICE @"http://map.aviasales.ru/prices.json?origin_iata="

//extern const NSString *api_tolen;
//extern const NSString * api_url_ip_address;//API_URL_IP_ADDRESS 
//extern const NSString * API_URL_CHEAP @"https://api.travelpayouts.com/v1/prices/cheap"
//extern const NSString * API_URL_CITY_FROM_IP @"https://www.travelpayouts.com/whereami?ip="

NS_ASSUME_NONNULL_BEGIN
typedef struct SearchRequest {
    __unsafe_unretained NSString *origin;
    __unsafe_unretained NSString *destionation;
    __unsafe_unretained NSDate *departDate;
    __unsafe_unretained NSDate *returnDate;
} SearchRequest;
@interface APIManager : NSObject
+ (instancetype)sharedInstance;
- (void) cityForCurrentIP:(void (^)(City *city))completion;
- (void) ticketsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSArray *ticket)) complition;
- (void) mapPricesFor:(City *)city withCompletion:(void (^)(NSArray *prices)) complition;
@end

NS_ASSUME_NONNULL_END