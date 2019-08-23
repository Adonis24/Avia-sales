//
//  ContentViewController.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 03/08/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentViewController : UIViewController
@property (nonatomic, strong) NSString *contentText;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic) int index;
@end

NS_ASSUME_NONNULL_END
