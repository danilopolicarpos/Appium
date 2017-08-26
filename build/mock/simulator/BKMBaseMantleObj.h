//
//  BKMBaseMantleObj.h
//  Pods
//
//  Created by Thiago Lioy on 12/17/15.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface BKMBaseMantleObj : MTLModel<MTLJSONSerializing>

+ (NSDictionary *)JSONKeyPathsByPropertyKey;
+(instancetype)parse:(NSDictionary*)dc error:(NSError**)error;
-(NSDictionary*)asDictError:(NSError**)error;

@end

@interface BKMBaseMantleObj (Collections)

+(NSArray*)asArrayOfDictFromModelArray:(NSArray*)objects error:(NSError**)error;
+(NSArray*)parseArray:(NSArray*)objs error:(NSError**)error;

@end
