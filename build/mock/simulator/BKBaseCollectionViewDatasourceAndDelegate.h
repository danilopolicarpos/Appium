//
//  BKBaseCollectionViewDatasourceAndDelegate.h
//  Pods
//
//  Created by Thiago Lioy on 12/17/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol BKBaseCollectionViewDatasourceAndDelegateProtocol <NSObject>

@required
-(instancetype)initWithModelContainer:(id)modelContainer
                           controller:(UIViewController*)controller
                            collectionView:(UICollectionView*) collectionView;

@optional
-(void)additionalInitialSetup;
-(void)registerCells;
@end



@interface BKBaseCollectionViewDatasourceAndDelegate : NSObject <UICollectionViewDataSource,UICollectionViewDelegate,BKBaseCollectionViewDatasourceAndDelegateProtocol>
@property (weak, nonatomic)id modelContainer;
@property (weak, nonatomic)UIViewController *controller;
@property (weak, nonatomic)UICollectionView *collectionView;
@end
