//
//  NetWorkRequestDataModel.h
//  BaiLaoHuiActivity
//
//  Created by 思来氏 on 15/9/22.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol requestNetworkingDelegate <NSObject>

- (void)requestNetworkingSuccessWithReturnValue:(id)responseObject;
- (void)requestNetworkingFailWithReturnValue:(id)responseObject;
@end

@interface NetworkRequestEngine : NSObject
@property (weak, nonatomic) id<requestNetworkingDelegate> requestNetDelegate;






- (void)requestNetworkingSampleCompletionBlockWithUrlString:(NSString*)urlString;

-(void)requestWitPostUploadFileDataAndJsonWithURlString:(NSString*)urlString
                                          andParameters:(NSDictionary*)parameters
                                            andFileData:(NSData*)datas;

- (void)requestWithPostJsonWitURLString:(NSString*)urlString
                          andParameters:(NSDictionary*)parameters;
@end
