//
//  IMSearchDataManager.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 14/10/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMSearchContextEnum.h"

@interface IMSearchDataManager : NSObject

@property (nonatomic) BOOL flagMenu;
@property (nonatomic) BOOL flagFaq;
@property (nonatomic) BOOL flagOverflowMessage;
@property (nonatomic) BOOL flagReceipts;
@property (nonatomic) BOOL flagSupport;
@property (nonatomic) IMSearchContext context;
@property (nonatomic,strong) NSString * account;
@property (nonatomic,strong) NSString * agency;
@property (nonatomic,strong) NSString * segment;
@property (nonatomic,strong) NSString * operatorCode;
@property (nonatomic,strong) NSArray * cards;
@property (nonatomic,strong) NSArray * menuItems;


+(IMSearchDataManager *)sharedSearchDataManager;

@end
