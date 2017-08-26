//
//  IMSearchSupportTableFooterView.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 16/09/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMSearchSupportTableFooterView : UIView

@property (nonatomic,weak) IBOutlet UILabel * feedbackLabel;
@property (nonatomic,weak) IBOutlet UILabel * thanksLabel;
@property (nonatomic,weak) IBOutlet UILabel * doubtLabel;
@property (nonatomic,weak) IBOutlet UILabel * supportLabel;
@property (nonatomic,weak) IBOutlet UIButton * yesButton;
@property (nonatomic,weak) IBOutlet UIButton * noButton;
@property (nonatomic,weak) IBOutlet UIControl * supportView;

@end
