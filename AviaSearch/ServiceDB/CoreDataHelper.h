//
//  CoreDataHelper.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 01/08/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Ticket.h"
#import "FavoriteTicket+CoreDataClass.h"
#import "DataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataHelper : NSObject
+(instancetype)sharedInstance;
-(BOOL)isFavorete:(Ticket*)ticket;
-(NSArray*)favorites;
-(void)addFavorites:(Ticket*)ticket;
-(void)removeFromFavorites:(Ticket*)ticket;
@end

NS_ASSUME_NONNULL_END
