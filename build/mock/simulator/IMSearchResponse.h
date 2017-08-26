//
//  IMSearchResponse.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 10/10/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "BKMBaseMantleObj.h"

@interface IMSearchResponse : BKMBaseMantleObj

@property (nonatomic) BOOL exibeTermo;
@property (nonatomic,strong) NSString * classificacao;
@property (nonatomic,strong) NSArray * cards;
@property (nonatomic,strong) NSArray * comprovantes;
@property (nonatomic,strong) NSArray * menus;
@property (nonatomic,strong) NSArray * faqs;
@property (nonatomic,strong) NSArray * transbordos;

@end
