//
//  IMSearchBalanceTableViewCell.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 02/08/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMSearchBalanceTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet NSLayoutConstraint * cardHeight;
@property (nonatomic,weak) IBOutlet UILabel * balanceLabel;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView * activityIndicatorView;
@property (nonatomic,weak) IBOutlet UIButton * expandButton;
@property (nonatomic,weak) IBOutlet UIButton * actionButton;
@property (nonatomic,weak) IBOutlet UIButton * seeBalance;
@property (nonatomic,weak) IBOutlet UIView * card;

@end
