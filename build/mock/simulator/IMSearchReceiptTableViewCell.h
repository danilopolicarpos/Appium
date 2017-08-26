//
//  IMSearchReceiptTableViewCell.h
//  IMBusca
//
//  Created by everis on 22/02/17.
//
//

#import <UIKit/UIKit.h>

@interface IMSearchReceiptTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel * date;
@property (nonatomic,weak) IBOutlet UILabel * descriptionLabel;
@property (nonatomic,weak) IBOutlet UILabel * familiarDescription;
@property (nonatomic,weak) IBOutlet UILabel * value;

@end
