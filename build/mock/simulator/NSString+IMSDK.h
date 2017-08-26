//
//  NSString+IMSDK.h
//  sdk-ios-core
//
//  Created by Alexandre Garrefa on 6/17/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMFormatTypes.h"


@interface NSString (IMSDK)

#pragma mark - Validators

- (DocumentValidationType)im_cpfIsValid;

- (DocumentValidationType)im_cnpjIsValid;

- (BoletoValidationType)im_boletoIsValid;

#pragma mark - Formatters

- (NSString *)im_cpfFormatted;

- (NSString *)im_cnpjFormatted;

- (NSString *)im_contaFormatted;

- (NSString *)im_currencyFormatted;

- (NSString *)im_boletoFormatted;

- (NSString *)im_boletoFormattedFromBarcodeReader;

#pragma mark - Public Utils

- (NSString *)im_unformatted;

- (NSArray *)im_components;

@end
