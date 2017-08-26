//
//  IMSearchEnvironmentUtil.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 7/21/16.
//  Copyright (c) 2016 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMSearchEnvironmentUtil : NSObject

+(BOOL)isPersonnalite;
+(BOOL)isEnterprise;
+(NSBundle *)assetsBundle;
+(UIFont *)itauFont;

@end
