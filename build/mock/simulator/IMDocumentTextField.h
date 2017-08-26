//
//  IMDocumentTextField.h
//  IMFormatsAndValidations
//
//  Created by Alexandre Garrefa on 6/29/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMFormatTypes.h"

@class IMDocumentTextField;

@protocol IMDocumentTextFieldDelegate <NSObject>

- (void)textField:(IMDocumentTextField *)textField didChangeDocValidationTypeTo:(DocumentValidationType)type;

@end


@interface IMDocumentTextField : UITextField <UITextFieldDelegate>

@property (nonatomic, assign) DocumentTextFieldType docType;

@property (nonatomic, assign) DocumentValidationType validationType;

@property (nonatomic, weak) NSObject<UITextFieldDelegate, IMDocumentTextFieldDelegate> *delegate;

@end
