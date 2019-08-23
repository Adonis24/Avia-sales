//
//  TicketsViewController.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 27/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface TicketsViewController : UITableViewController
-(instancetype)initWithTickets:(NSArray *)tickets;
-(instancetype)initFavoriteTicketController;


@end

NS_ASSUME_NONNULL_END
