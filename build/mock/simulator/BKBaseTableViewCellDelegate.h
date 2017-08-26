//
//  BKBaseTableViewCellDelegate.h
//  Pods
//
//  Created by Thiago Lioy on 12/3/15.
//
//

#import <Foundation/Foundation.h>

@protocol BKBaseTableViewCellDelegate <NSObject>
+(CGFloat)cellHeight;

+(NSString *)cellIdentifier;
-(void)setup:(id)object;

@optional
+(void)registerForTableView:(UITableView*)tableview;
+(CGFloat)cellHeightWithPadding:(CGFloat)padding;
@end
