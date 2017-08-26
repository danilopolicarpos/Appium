//
//  IMSearchStoryboardUtil.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 26/09/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "IMSearchContextEnum.h"
#import "IMSearchViewController.h"

@interface IMSearchStoryboardUtil : NSObject

+(IMSearchViewController *)searchViewControllerWithAgency:(NSString *)agency withAccount:(NSString *)account withSegment:(NSString *)segment withOperatorCode:(NSString *)operatorCode withMenuItems:(NSArray *)menuItems withMenuEnabled:(BOOL)flagMenu withFaqEnabled:(BOOL)flagFaq withOverflowMessageEnabled:(BOOL)flagOverflowMessage withReceiptsEnabled:(BOOL)flagReceipts withSupportEnabled:(BOOL)flagSupport withCards:(NSArray *)cards withContext:(IMSearchContext)context;

@end
