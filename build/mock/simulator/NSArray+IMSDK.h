//
//  NSArray+IMSDK.h
//  sdk-ios-core
//
//  Created by Alexandre Garrefa on 6/18/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (IMSDK)

- (NSInteger)im_mod11WithSeqToMultiply:(NSArray *)seq;

- (NSString *)im_stringValue;

- (NSArray *)im_sequenceFrom:(NSInteger)from to:(NSInteger)to;

- (NSArray *)im_sequenceFrom:(NSInteger)from to:(NSInteger)to startAt:(NSInteger)start;

- (NSInteger)im_mod10;

- (NSInteger)im_mod11;

- (NSArray *)im_inverted;

- (NSString *)im_stringWithMod10FromComponents;

- (NSString *)im_stringWithMod11FromComponents;

@end
