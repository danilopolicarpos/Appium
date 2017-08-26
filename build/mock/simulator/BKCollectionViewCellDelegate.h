//
//  BKCollectionViewCellDelegate.h
//  Pods
//
//  Created by Thiago Lioy on 12/3/15.
//
//

#import <Foundation/Foundation.h>

@protocol BKCollectionViewCellDelegate <NSObject>
+(CGSize)cellSize;

+(NSString *)cellIdentifier;
-(void)setup:(id)object;

@optional
+(void)registerForCollectionView:(UICollectionView*)collectionview;
@end
