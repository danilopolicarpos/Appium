//
//  IMSearchFaqTableViewCell.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 25/08/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMSearchFaqTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet NSLayoutConstraint * faqTitleHeight;
@property (nonatomic,weak) IBOutlet UILabel * faqTitle;
@property (nonatomic,weak) IBOutlet UILabel * faqDescription;
@property (nonatomic,weak) IBOutlet UIView * faqView;

@end
