//
//  NetWorkRequestDataModel.m
//  BaiLaoHuiActivity
//
//  Created by 思来氏 on 15/9/22.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import "NetworkRequestEngine.h"

@implementation NetworkRequestEngine
/**
 *  使用AFHTTPRequestOperation 进行简单的URL拼接 访问接口
 *
 *  @param urlString 字符串类型的接口地址
 */
- (void)requestNetworkingSampleCompletionBlockWithUrlString:(NSString*)urlString{
    [TSNetworking requestNetWorkingWith:urlString
                                success:^(id responseObject) {
                                    [self.requestNetDelegate requestNetworkingSuccessWithReturnValue:responseObject];
    }
                                   fail:^(id error){
                                       [self.requestNetDelegate requestNetworkingFailWithReturnValue:error];
        
    }];
}

/**
 *  POST 请求上传json 和 文件
 *
 *  @param urlString  urlString
 *  @param parameters 参数
 *  @param datas      文件Data
 */
-(void)requestWitPostUploadFileDataAndJsonWithURlString:(NSString*)urlString
                                          andParameters:(NSDictionary*)parameters
                                            andFileData:(NSData*)datas{
    [TSNetworking postUploadFileDataAndJsonWithUrl:urlString
                                      andParameter:parameters
                                       andFileData:datas
                                           success:^(id responseObject) {
                                               [self.requestNetDelegate requestNetworkingSuccessWithReturnValue:responseObject];
                                           }
                                              fail:^(id error) {
                                                  [self.requestNetDelegate requestNetworkingFailWithReturnValue:error];
                                              }];
}

/**
 *  POST 请求上传Json数据
 *
 *  @param urlString  urlString
 *  @param parameters 参数
 */
- (void)requestWithPostJsonWitURLString:(NSString*)urlString
                          andParameters:(NSDictionary*)parameters{
    [TSNetworking requestNetWith:urlString
                    andParameter:parameters
                         success:^(id responseObject) {
                             [self.requestNetDelegate requestNetworkingSuccessWithReturnValue:responseObject];
                         } fail:^(id error) {
                             [self.requestNetDelegate requestNetworkingFailWithReturnValue:error];
                         }];
    
}
@end
