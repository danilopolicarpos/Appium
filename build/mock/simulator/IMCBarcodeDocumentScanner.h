//
//  IMCBarcodeDocumentScanner.h
//  IMCBarcodeDocumentScanner
//
//  Created by Paulo Pamio on 27/04/15.
//  Copyright (c) 2015 itau. All rights reserved.
//

// Adicionar libiconv.dylib em Linked Frameworks and Libraries

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface IMCBarcodeDocumentScanner : NSObject

/**
 @param url A URL que aponta para o PDF.
 
 @return Um objeto CGPDFDocumentRef do PDF apontado pela NSURL passada.
 @warning Necessário linkar lib: libiconv.dylib ao projeto
 */
+ (nullable CGPDFDocumentRef) CGPDFDocumentRefDaUrl:(nonnull NSURL *)url NS_SWIFT_NAME(cgPDFDocumentRef(url:));

+ (nullable NSString *)barcodeWithFileURL:(nonnull NSURL *)url password:(nullable NSString *)password NS_SWIFT_NAME(barcode(url:password:));

+ (nullable NSString *)barcodeWithFileURL:(nonnull NSURL *)url NS_SWIFT_NAME(barcode(url:));

+ (nullable NSString *)barcodeWithImage:(nonnull UIImage *)image NS_SWIFT_NAME(barcode(image:));

/**
 @param pdf O objeto CGPDFDocumentRef do qual será lido o código de barras.
 @param password Uma string contendo a senha do PDF se o mesmo está encriptado.
 
 @return Uma string com o código de barras lido.
 
 @warning Necessário linkar lib: libiconv.dylib ao projeto
 */
+ (nullable NSString *)barcodeFromCGPDFDocumentRef:(nonnull CGPDFDocumentRef)pdf
                                      withPassWord:(nullable NSString*)password  NS_SWIFT_NAME(barcode(pdfDocumentRef:password:));

@end