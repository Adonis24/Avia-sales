//
//  FavoriteTicket+CoreDataProperties.m
//  AviaSearch
//
//  Created by Чернецова Юлия on 01/08/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//
//

#import "FavoriteTicket+CoreDataProperties.h"

@implementation FavoriteTicket (CoreDataProperties)

+ (NSFetchRequest<FavoriteTicket *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FavoriteTicket"];
}

@dynamic airline;
@dynamic created;
@dynamic departure;
@dynamic expires;
@dynamic flightNumber;
@dynamic from;
@dynamic price;
@dynamic returnDate;
@dynamic to;

@end
