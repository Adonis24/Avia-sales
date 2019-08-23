//
//  CoreDataHelper.m
//  AviaSearch
//
//  Created by Чернецова Юлия on 01/08/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import "CoreDataHelper.h"

@interface CoreDataHelper()
//@property(strong,nonatomic) NSPersistentStoreCoordinator *coordinator;
//@property(strong,nonatomic) NSManagedObjectContext *context;
//@property(strong,nonatomic) NSManagedObjectModel *model;
@property (nonatomic, strong) NSPersistentContainer *persistentContainer;
@end

@implementation CoreDataHelper
+(instancetype) sharedInstance{
    static CoreDataHelper *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreDataHelper alloc] init];
        [instance setup];
    });
    return instance;
}
-(void) setup{
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"air" withExtension:@"momd"];
//    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    self.coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
//    NSURL *docsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//    NSURL *dbContext = [docsURL URLByAppendingPathComponent:@"base.sqllite"];
//    NSPersistentStore *store = [_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dbContext options:nil error:nil];
//    if (!store) {
//        abort();
//    }
//    self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    _context.persistentStoreCoordinator = _coordinator;
    self.persistentContainer = [[NSPersistentContainer alloc] initWithName:@"FavoriteTicket"];
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error != nil) {
            NSLog(@"Failed to load Core Data stack: %@", error);
            abort();
        }
    }];

    
}
-(void) save{
    NSError *error;
    [_persistentContainer.viewContext save:&error];
    if (error){
        NSLog(@"%@", [error localizedDescription]);
    }
}
-(BOOL)isFavorete:(Ticket *)ticket{
    return [self favoriteFromTicket:ticket] != nil;
}
-(FavoriteTicket*) favoriteFromTicket:(Ticket *)ticket{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FavoriteTicket"];
    request.predicate = [NSPredicate predicateWithFormat:@"price == %ld AND airline == %@ AND from == %@ AND to == %@ AND departure == %@ AND expires == %@ AND flightNumber = %ld",(long)ticket.price.integerValue, ticket.airline, ticket.from, ticket.to, ticket.departure, ticket.expires, (long)ticket.flightNumber.integerValue];
    return [[_persistentContainer.viewContext  executeFetchRequest:request error:nil] firstObject];
}
-(NSArray *)favorites {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FavoriteTicket"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"created" ascending:NO]];
    return [self.persistentContainer.viewContext  executeFetchRequest:request error:nil];
}
-(void) addFavorites:(Ticket *)ticket{
    FavoriteTicket *favorite = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteTicket" inManagedObjectContext:_persistentContainer.viewContext ];
    favorite.price = ticket.price.intValue;
    favorite.airline = ticket.airline;
    favorite.departure = ticket.departure;
    favorite.expires = ticket.expires;
    favorite.flightNumber = ticket.flightNumber.intValue;
    favorite.returnDate = ticket.returnDate;
    favorite.to = ticket.to;
    favorite.from = ticket.from;
    favorite.created =  [NSDate date] ;
    [self save];
    
}


-(void) removeFromFavorites:(Ticket *)ticket{
    FavoriteTicket *favorite = [self favoriteFromTicket:ticket];
    [_persistentContainer.viewContext deleteObject:favorite];
    [self save];    
}
@end
