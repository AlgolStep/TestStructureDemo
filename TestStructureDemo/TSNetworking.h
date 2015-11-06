//
//  TSNetworking.h
//  AFNetworkingDemo
//
//  Created by 思来氏 on 15-5-4.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSNetworking : NSObject

/**
 *  访问网络 成功后success里是个json
 *
 *  @param URL     服务器地址
 *  @param success 成功
 *  @param fail    失败
 */
+ (void)requestNetWorkingWith:(NSString*)URL
                      success:(void (^)(id responseObject))success
                         fail:(void (^)(id error))fail;



/**
 *  文件上传或文件和其他内容的表单上传
 *
 *  @param urlStr  服务器地址
 *  @param fileURL 文件的地址
 *  @param success POST成功之后调用success
 *  @param fail    POST失败调用fail
 */
+ (void)postUploadWithUrl:(NSString *)urlStr
                  fileUrl:(NSURL *)fileURL
                  success:(void (^)(id responseObject))success
                     fail:(void (^)())fail;

/**
 *  文件下载
 *
 *  @param urlStr  文件地址
 *  @param savePath 保存路径
 *  @param success 成功
 *  @param fail    失败
 */
+ (void)sessionDownloadWithUrl:(NSString *)urlStr
                    saveAtPath:(NSString*)savePath
                       success:(void (^)(NSURL *fileURL))success
                          fail:(void (^)())fail;

+ (void)postJSONWithUrl:(NSString *)urlStr
             parameters:(id)parameters
                success:(void (^)(id responseObject))success
                   fail:(void (^)())fail;



/**
 *  POST 网络请求
 *
 *  @param URL       URL
 *  @param parameter 参数
 *  @param success   成功
 *  @param fail      失败
 */
+ (void)requestNetWith:(NSString*)URL
          andParameter:(NSDictionary*)parameter
               success:(void (^)(id responseObject))success
                  fail:(void (^)(id error))fail;

/**
 *  POST 上传文件数据 和json数据
 *
 *  @param urlStr    URLString
 *  @param parameter 参数
 *  @param data      文件数据Data
 *  @param success   成功
 *  @param fail      失败
 */
+ (void)postUploadFileDataAndJsonWithUrl:(NSString*)urlStr
                            andParameter:(NSDictionary*)parameter
                             andFileData:(NSData*)data
                                 success:(void (^)(id responseObject))success
                                    fail:(void (^)(id error))fail;
@end
