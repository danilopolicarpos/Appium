//
//  IMSearchViewController.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 6/15/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMSearchDelegate.h"

@interface IMSearchViewController : UIViewController<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) id<IMSearchDelegate> delegate;

@end
