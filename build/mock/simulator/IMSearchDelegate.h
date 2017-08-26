//
//  IMSearchDelegate.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 30/09/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "IMSearchMenuItem.h"
#import "IMSearchReceipt.h"
#import "IMSearchFaq.h"

typedef void (^FetchBalanceSuccess)(NSNumber * balance);

@protocol IMSearchDelegate <NSObject>

@required
-(void)didSelectReceipt:(IMSearchReceipt *)receipt;
-(void)didSelectShowBalance;
-(void)didSelectSupport;
-(void)didSelectMenu:(IMSearchMenuItem *)menu;
-(void)didSelectFAQ:(IMSearchFaq *)faq;
-(void)showBalanceCard:(FetchBalanceSuccess)sucess;

@end
