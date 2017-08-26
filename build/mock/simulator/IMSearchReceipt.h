//
//  IMSearchReceipt.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 22/02/17.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "BKMBaseMantleObj.h"

@interface IMSearchReceipt : BKMBaseMantleObj

@property (nonatomic,strong) NSString * dataMov;
@property (nonatomic,strong) NSString * dataProc;
@property (nonatomic,strong) NSString * descricao;
@property (nonatomic,strong) NSString * histor;
@property (nonatomic,strong) NSString * valor;

@end
