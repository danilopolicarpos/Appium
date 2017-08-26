//
//  IMSearchForeverPresentMessage.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 10/02/17.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "BKMBaseMantleObj.h"

@interface IMSearchOverflowMessage : BKMBaseMantleObj

@property (nonatomic,strong) NSString * nome;
@property (nonatomic,strong) NSString * imagem;
@property (nonatomic,strong) NSString * texto;

@end
