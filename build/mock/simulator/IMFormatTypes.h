//
//  IMFormatTypes.h
//  IMFormatsAndValidations
//
//  Created by Alexandre Garrefa on 6/29/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#ifndef IMFormatsAndValidations_IMFormatTypes_h
#define IMFormatsAndValidations_IMFormatTypes_h

typedef enum : NSUInteger {
    BoletoInvalidString = 0,
    BoletoWithErrorInBlock1,
    BoletoWithErrorInBlock2,
    BoletoWithErrorInBlock3,
    BoletoWithErrorInBlock4,
    BoletoIncompleteWithoutErrors,
    BoletoCompleteAndValid
} BoletoValidationType;

typedef enum : NSUInteger {
    DocumentInvalidString = 0,
    DocumentIncomplete,
    DocumentWithValidationError,
    DocumentCompleteAndValid
} DocumentValidationType;

typedef enum : NSUInteger {
    DocumentTypeCNPJ = 0,
    DocumentTypeCPF
} DocumentTextFieldType;

#endif
