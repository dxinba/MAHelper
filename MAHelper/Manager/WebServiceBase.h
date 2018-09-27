////
////  WebServiceBase.h
////
////  Created by JackySong on 2016/10/28.
////  Copyright © 2016年 YJYX. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//#import <AFNetworking/AFNetworking.h>
//#import <YYKit/NSObject+YYModel.h>
//
//
//@interface WebServiceBase : NSObject {
//    AFHTTPSessionManager *manager;
//}
//
//NS_ASSUME_NONNULL_BEGIN
//
//SINGLETON_FOR_HEADER(WebServiceBase)
//
//
//#pragma mark - 请求
//- (void)GET:(NSString *)URLPathString
// parameters:(id _Nullable)parameters
//    success:(void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
//    failure:(void (^)(NSURLSessionDataTask *task, NSError * _Nullable error))failure;
//
//- (void)POST:(NSString *)URLPathString
//  parameters:(id _Nullable)parameters
//     success:(void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
//     failure:(void (^)(NSURLSessionDataTask *task, NSError * _Nullable error))failure;
//
//- (void)PUT:(NSString *)URLPathString
// parameters:(id _Nullable)parameters
//    success:(void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
//    failure:(void (^)(NSURLSessionDataTask *task, NSError * _Nullable error))failure;
//
//
//#pragma mark - 解析
//- (NSInteger)getReturnCodeFromResponse:(id _Nullable)responseObject;
//- (NSString *_Nullable)getReturnMessageFromResponse:(id _Nullable)responseObject;
//- (NSDictionary *_Nullable)getDictionaryFromResponse:(id _Nullable)responseObject; //一般用于取Json顶级字典
//- (NSDictionary *_Nullable)getDictionaryFromResponse:(id _Nullable)responseObject key:(NSString * )key; //一般用于取Json第二级的字典
//- (NSArray *_Nullable)getArrayFromResponse:(id _Nullable)responseObject; //一般用于取Json顶级数组
//- (NSArray *_Nullable)getArrayFromResponse:(id _Nullable)responseObject key:(NSString * )key; //一般用于取Json第二级数组
//- (id _Nullable)getObjectFromResponse:(id _Nullable)responseObject key:(NSString * )key; //一般用于取Json顶级字段
//
//#pragma mark - 错误处理
//- (NSError * _Nullable)getServiceErrorFromResponse:(id _Nullable)responseObject;
//- (NSError *)getUnknownrror;
//- (NSError *)getParsingError;
//- (NSError *)getSessionExpiredError;
//
//
//NS_ASSUME_NONNULL_END
//
//@end
//
//
//
