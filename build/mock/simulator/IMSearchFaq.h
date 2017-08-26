//
//  IMSearchFaq.h
//  IMBusca
//
//  Created by Victor Bozelli Alvarez on 5/19/16.
//  Copyright © 2016 Itau. All rights reserved.
//

#import "IMSearchFaqLink.h"
#import "IMSearchFaqChannelAvailable.h"

@interface IMSearchFaq : BKMBaseMantleObj

@property (nonatomic,strong) NSString * id;
@property (nonatomic,strong) NSString * assunto;
@property (nonatomic,strong) NSString * pergunta;
@property (nonatomic,strong) NSString * produto;
@property (nonatomic,strong) NSString * resposta;
@property (nonatomic,strong) NSArray * links;
@property (nonatomic,strong) NSArray * canais_disponiveis;

@end
