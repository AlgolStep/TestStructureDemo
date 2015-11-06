//
//  TSNetworking.m
//  AFNetworkingDemo
//
//  Created by 思来氏 on 15-5-4.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "TSNetworking.h"
#import "AFNetworking.h"

@implementation TSNetworking

/**
 *  简单访问网络 成功后success
 *
 *  @param URL     服务器地址
 *  @param success 成功
 *  @param fail    失败
 */
+ (void)requestNetWorkingWith:(NSString*)URL
                      success:(void (^)(id responseObject))success
                         fail:(void (^)(id error))fail
{
    
    NSURL *url = [NSURL URLWithString:[URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *content = operation.responseString;
        NSData* data = [content dataUsingEncoding:NSUTF8StringEncoding];
        id tempDic = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        if (success&&tempDic!=nil) {
            success(tempDic);
        }else{
            success(content);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            NSLog(@"inner error %@",error);
            fail(error);
        }
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}


#pragma mark - POST 请求
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
                  fail:(void (^)(id error))fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *transString = [NSString stringWithString:[URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [manager POST:transString
       parameters:parameter
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSString *content = operation.responseString;
              NSData* data = [content dataUsingEncoding:NSUTF8StringEncoding];
              id tempDic = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
              
              if (success&&tempDic!=nil) {
                  success(tempDic);
              }else{
                  success(content);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (fail) {
                  fail(error);
              }
          }];
}

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
                                    fail:(void (^)(id error))fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    NSString *transString = [NSString stringWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
   
    [manager POST:transString
       parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
         
       
        [formData appendPartWithFileData :data name:@"uploadImage" fileName:@"upload.png" mimeType:@"image/jpeg"];
           
       } success:^(AFHTTPRequestOperation *operation, id responseObject){
           NSString *content = operation.responseString;
           NSData* data = [content dataUsingEncoding:NSUTF8StringEncoding];
           id tempDic = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
           if (success&&tempDic!=nil) {
               success(tempDic);
           }else{
               success(content);
           }

       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           if (fail) {
               fail(error);
           }
       }];

}


/**
 *  文件上传或表单上传
 *
 *  @param urlStr
 *  @param fileURL
 *  @param success
 *  @param fail
 */
+ (void)postUploadWithUrl:(NSString *)urlStr
                     fileUrl:(NSURL *)fileURL
                     success:(void (^)(id responseObject))success
                        fail:(void (^)())fail
{
    NSString *transString = [NSString stringWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
// AFHTTPResponseSerializer就是正常的HTTP请求响应结果:NSData
// 当请求的返回数据不是JSON,XML,PList,UIImage之外,使用AFHTTPResponseSerializer
// 实际上就是AFN没有对响应数据做任何处理的情况
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
// formData是遵守了AFMultipartFormData的对象
    [manager POST:transString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:fileURL name:@"uploadFile" error:NULL];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"错误 %@", error.localizedDescription);
        if (fail) {
            fail();
        }
    }];
}

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
                          fail:(void (^)())fail
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSString *urlString = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request
                                                             progress:nil
                                                          destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                                              // 指定下载文件保存的路径
                                                              //        NSLog(@"%@ %@", targetPath, response.suggestedFilename);
                                                              // 将下载文件保存在缓存路径中
                                                              NSString *saveTargetPath = nil;
                                                              if (savePath == nil) {
                                                                  saveTargetPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
                                                              }else{
                                                                  saveTargetPath = savePath;
                                                              }
                                                              
                                                              NSString *path = [saveTargetPath stringByAppendingPathComponent:response.suggestedFilename];
                                                              NSURL *fileURL = [NSURL fileURLWithPath:path];
                                                              if (success) {
                                                                  success(fileURL);
                                                              }
                                                              return fileURL;
                                                          } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                              //        NSLog(@"%@ %@", filePath, error);
                                                              if (fail) {
                                                                  fail();
                                                              }
                                                          }];
    
    [task resume];
}



+ (void)postJSONWithUrl:(NSString *)urlStr
             parameters:(id)parameters
                success:(void (^)(id responseObject))success
                   fail:(void (^)())fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:urlStr
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        if (fail) {
            fail();
        }
    }];
    
}

@end
