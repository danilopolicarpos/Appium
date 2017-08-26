//
//  BKBaseTableViewDatasourceAndDelegate.h
//  Pods
//
//  Created by Thiago Lioy on 12/17/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BKBaseTableViewDatasourceAndDelegateProtocol <NSObject>

@required
-(instancetype)initWithModelContainer:(id)modelContainer
                           controller:(UIViewController*)controller
                            tableView:(UITableView*) tableView;

@optional
-(void)additionalInitialSetup;
-(void)registerCells;
@end


@interface BKBaseTableViewDatasourceAndDelegate : NSObject <UITableViewDataSource,UITableViewDelegate,BKBaseTableViewDatasourceAndDelegateProtocol>
@property (weak, nonatomic)id modelContainer;
@property (weak, nonatomic)UIViewController *controller;
@property (weak, nonatomic)UITableView *tableView;
@end
