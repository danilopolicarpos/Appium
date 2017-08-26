//
//  IMBarcodeReaderViewController
//  IMBarcoreReader
//
//  Created by Alexandre Garrefa on 07/07/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import <RSBarcodes/RSBarcodes.h>

@class IMBarcodeReaderViewController;

@protocol IMBarcodeReaderDelegate <NSObject>

@required

- (void)didCancelReadingForBarcodeReader:(IMBarcodeReaderViewController *)reader;

- (void)barcodeReader:(IMBarcodeReaderViewController *)reader didFinishReadingBarcode:(NSString *)barcode;

@end

@interface IMBarcodeReaderViewController : RSScannerViewController

@property (nonatomic, weak) NSObject <IMBarcodeReaderDelegate> *delegate;

// Alert messages for when the reading is taking a long time
@property (nonatomic, strong) NSString *timeoutAlertTitle;
@property (nonatomic, strong) NSString *timeoutAlertMessage;
@property (nonatomic, strong) NSString *timeoutAlertTryAgainMessage;
@property (nonatomic, strong) NSString *timeoutAlertTryCancelMessage;
@property (nonatomic, strong) UIColor *lazerColor;

@property (nonatomic, assign) NSTimeInterval timeout;

- (void)toggleFashLight;

+ (BOOL)isRearCameraDeviceAvailable;
+ (BOOL)isFlashAvailableForRearCamera;

@end
