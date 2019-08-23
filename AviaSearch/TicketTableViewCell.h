//
//  TicketTableViewCell.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 22/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import "DataManager.h"
#import "APIManager.h"
#import "Ticket.h"
#import "FavoriteTicket+CoreDataClass.h"


@interface TicketTableViewCell : UITableViewCell
    @property (nonatomic, strong) Ticket *ticket;
    @property (nonatomic, strong) FavoriteTicket *favoriteTicket;
    @property (nonatomic, strong) UIImageView *airlineLogoView;
@end

