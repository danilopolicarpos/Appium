//
//  IMSearchWithIconTableViewCell.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 6/15/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKBaseTableViewCell.h"

@interface IMSearchWithIconTableViewCell : BKBaseTableViewCell

@property (nonatomic,weak) IBOutlet UILabel * title;
@property (nonatomic,weak) IBOutlet UIImageView * icon;

@end
