//
//  ProgressView.h
//  AviaSearch
//
//  Created by Чернецова Юлия on 03/08/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ProgressView : UIView
+(instancetype) sharedInstance;
-(void) show: (void (^) (void)) completion;
-(void) dismiss: (void (^) (void)) completion;
@end

NS_ASSUME_NONNULL_END
