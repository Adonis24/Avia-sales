//
//  FavoriteTicket+CoreDataProperties.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 01/08/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//
//

#import "FavoriteTicket+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FavoriteTicket (CoreDataProperties)

+ (NSFetchRequest<FavoriteTicket *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *airline;
@property (nullable, nonatomic, copy) NSDate *created;
@property (nullable, nonatomic, copy) NSDate *departure;
@property (nullable, nonatomic, copy) NSDate *expires;
@property (nonatomic) int16_t flightNumber;
@property (nullable, nonatomic, copy) NSString *from;
@property (nonatomic) int64_t price;
@property (nullable, nonatomic, copy) NSDate *returnDate;
@property (nullable, nonatomic, copy) NSString *to;

@end

NS_ASSUME_NONNULL_END
