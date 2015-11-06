//
//  HomeDataRequest.m
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/6.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import "HomeDataRequest.h"

typedef NS_ENUM(NSInteger, RequestType){
    homeRequestType = 1001,
    pullLoadRequestType,
    pushLoadRequestType
};
@implementation HomeDataRequest

static NetworkRequestEngine *networkRequestEngine = nil;

+(NetworkRequestEngine*)initNetWorkEngine{
    if (!networkRequestEngine) {
        networkRequestEngine = [[NetworkRequestEngine alloc] init];
        
    }
    return networkRequestEngine;
}

- (id)initHomeRequestEngineWithMenuName:(NSString*)menuName{
    self = [super init];
    if (self) {
        [self homeRequestFromNetworkWithMenuName:menuName];
    }
    return self;
}


-(void)homeRequestFromNetworkWithMenuName:(NSString*)menuName{
    [HomeDataRequest initNetWorkEngine];
    networkRequestEngine.requestNetDelegate = self;
    NSString *url = [NSString stringWithFormat:@"%@key=%@&menu=%@&rn=%d&pn=%d",homeRequestURL,projectKey,menuName,15,1];
    [networkRequestEngine requestNetworkingSampleCompletionBlockWithUrlString:url];
}


#pragma mark - Delegate
- (void)requestNetworkingFailWithReturnValue:(id)responseObject{
    
}


- (void)requestNetworkingSuccessWithReturnValue:(id)responseObject{
    NSDictionary *tempDic = responseObject;
    NSInteger status = [[tempDic objectForKey:@"resultcode"] integerValue];
    if (status == 200) {
        NSDictionary *listDictionary = [tempDic objectForKey:@"result"];
        [self.homeRequestDelegate homeRequestDataSuccessWithReturn:listDictionary];
    }
}
@end
