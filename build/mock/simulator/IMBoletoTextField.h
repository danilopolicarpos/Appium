//
//  IMBoletoTextField.h
//  IMFormatsAndValidations
//
//  Created by Alexandre Garrefa on 6/29/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMFormatTypes.h"

@class IMBoletoTextField;

@protocol IMBoletoTextFieldDelegate <NSObject>

- (void)textField:(IMBoletoTextField *)textField didChangeBoletoValidationTypeTo:(BoletoValidationType)type;

@end


@interface IMBoletoTextField : UITextField <UITextFieldDelegate>

@property (nonatomic, assign) BoletoValidationType validationType;

@property (nonatomic, weak) NSObject<UITextFieldDelegate, IMBoletoTextFieldDelegate> *delegate;

- (void)setBarcodeRead:(NSString *)barcode;

@end
