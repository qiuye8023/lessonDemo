//
//  BaseService.m
//  lessonTest
//
//  Created by sky on 14-5-22.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

-(void)addParam:(id)paramValue byKey:(NSString *)key{
    if(!params_){
        params_=[NSMutableDictionary new];
    }
    [params_ setObject:paramValue forKey:key];
}

-(void)requestWithCompletionHandler:(void (^)(NSString *, NSURLResponse *, NSError *))completionHandler{
    //合成路径
    NSMutableString *urlStr=[NSMutableString string];
    if(_url){
        if([_url hasPrefix:@"http"]){
            [urlStr appendString:_url];
        }else{
            [urlStr appendFormat:@"http://%@",_url];
        }
    }
    if(_action){
        [urlStr appendFormat:@"/%@",_action];
    }
    if(_method){
        [urlStr appendFormat:@"!%@",_method];
    }
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    //添加参数
    if(params_){
        NSMutableArray *paramArr=[NSMutableArray new];
        for(NSString *key in [params_ allKeys]){
            id value=[params_ objectForKey:key];
            NSString *param=[key stringByAppendingFormat:@"=%@",value];
            [paramArr addObject:param];
        }
        NSString *paramStr=[paramArr componentsJoinedByString:@"&"];
        NSData *paramData=[paramStr dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:paramData];
    }
    //发送请求
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *responseStr=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        completionHandler(responseStr,response,error);
    }];
    [dataTask resume];
}

@end
