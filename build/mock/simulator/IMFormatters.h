//
//  IMValidators.h
//  sdk-ios-core
//
//  Created by Alexandre Garrefa on 6/17/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IMFormatters : NSObject

#pragma mark - Number Formatters

+ (NSNumberFormatter *)im_numberFormatter;

#pragma mark - Currency Formatters

+ (NSNumberFormatter *)im_currencyFormatter;

+ (NSNumberFormatter *)im_currencyAPIFormatter;

#pragma mark - Date Formatters

+ (NSDateFormatter *)im_dateFormatter;

+ (NSDateFormatter *)im_dateFormatterWithFormatAPI;

+ (NSDateFormatter *)im_dateFormatterWithFormat2D2M4Y;

+ (NSDateFormatter *)im_dateFormatterWithFormat3M2Y;

+ (NSDateFormatter *)im_dateFormatterWithFormat2D2M;

+ (NSDateFormatter *)im_dateFormatterWithFormatCalabash;

+ (NSDateFormatter *)im_dateFormatterWithFormat:(NSString *)format;

@end
