//
//  IMSearchMenuItem.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 10/22/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "BKMBaseMantleObj.h"

@interface IMSearchMenuItem : BKMBaseMantleObj

@property (nonatomic, strong) NSString * nome;
@property (nonatomic, strong) NSString * chaveMobile;
@property (nonatomic, strong) NSString * icone;
@property (nonatomic, strong) NSArray * filhos;

@end
