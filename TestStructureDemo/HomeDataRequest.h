//
//  HomeDataRequest.h
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/6.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequestEngine.h"

@protocol homeDataDelegate <NSObject>

- (void)homeRequestDataSuccessWithReturn:(id)responseObject;
- (void)homeRequestDataFailWithReturn:(id)responseObject;
@end

@interface HomeDataRequest : NSObject<requestNetworkingDelegate>
@property (nonatomic, weak) id<homeDataDelegate> homeRequestDelegate;

- (id)initHomeRequestEngineWithMenuName:(NSString*)menuName;
@end

