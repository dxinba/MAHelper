//
////  WebServiceBase.h
////
////  Created by JackySong on 2016/10/28.
////  Copyright © 2016年 YJYX. All rights reserved.
////
//
//#import "WebServiceBase.h"
//#import <CommonCrypto/CommonDigest.h>
//#import "URLMacros.h"
//@implementation WebServiceBase
//
//SINGLETON_FOR_CLASS(WebServiceBase);
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        manager = [AFHTTPSessionManager manager];
//        manager.requestSerializer.timeoutInterval = 30;
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", @"text/plain",nil];
//            }
//    return self;
//}
//
//#pragma mark - 请求
//- (void)GET:(NSString *)URLPathString
// parameters:(id)parameters
//    success:(void (^)(NSURLSessionDataTask *task, id  responseObject))success
//    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
//    NSMutableDictionary *mParameters = [self commonParmeters];
//    [mParameters addEntriesFromDictionary:parameters];
//    [manager GET:URLPathString parameters:mParameters progress:^(NSProgress *  downloadProgress) {
//    } success:^(NSURLSessionDataTask *task, id   responseObject) {
//        success(task,responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        failure(task,error);
//    }];
//
//}
//
//- (void)POST:(NSString *)URLPathString
//  parameters:(id)parameters
//     success:(void (^)(NSURLSessionDataTask *task, id  responseObject))success
//     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
//     NSMutableDictionary *mParameters = [self commonParmeters];
//      [mParameters addEntriesFromDictionary:parameters];
//    [manager POST:URLPathString parameters:mParameters progress:^(NSProgress *  downloadProgress) {
//    } success:^(NSURLSessionDataTask *task, id   responseObject) {
//        success(task,responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        failure(task,error);
//    }];
//}
//
//- (void)PUT:(NSString *)URLPathString
// parameters:(id)parameters
//    success:(void (^)(NSURLSessionDataTask *task, id  responseObject))success
//    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
//    [manager PUT:URLPathString parameters:parameters success:^(NSURLSessionDataTask *task, id   responseObject) {
//        success(task,responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        failure(task,error);
//    }];
//}
//
//#pragma mark - 解析
//- (NSInteger)getReturnCodeFromResponse:(id)responseObject {
//    NSNumber *returnCode = [self getObjectFromResponse:responseObject key:@"code"];
//    if (returnCode != nil && ([returnCode isKindOfClass:[NSNumber class]] || [returnCode isKindOfClass:[NSString class]])) {
//        NSInteger code = [returnCode integerValue];
//        return code;
//    }
//    return NSNotFound;
//}
//
//- (NSString *)getReturnMessageFromResponse:(id)responseObject {
//    NSString *message = [self getObjectFromResponse:responseObject key:@"message"];
//    if (message != nil) {
//        return message;
//    }else{
//        return [self getObjectFromResponse:responseObject key:@"data"];
//    }
//}
//
//- (NSDictionary *)getDictionaryFromResponse:(id)responseObject {
//    if (responseObject != nil && [responseObject isKindOfClass:[NSDictionary class]]) {
//        return (NSDictionary *)responseObject;
//    }
//    return nil;
//}
//
//- (NSDictionary *)getDictionaryFromResponse:(id)responseObject key:(NSString *)key {
//    NSDictionary *dictionary = [self getDictionaryFromResponse:responseObject];
//    if (dictionary != nil){
//        return [dictionary objectForKey:key];
//    }
//    return nil;
//}
//
//- (NSArray *)getArrayFromResponse:(id)responseObject {
//    if (responseObject != nil && [responseObject isKindOfClass:[NSArray class]]) {
//        return (NSArray *)responseObject;
//    }
//    return nil;
//}
//
//- (NSArray *)getArrayFromResponse:(id)responseObject key:(NSString *)key {
//    NSDictionary *dictionary = [self getDictionaryFromResponse:responseObject];
//    if (dictionary != nil){
//        NSArray *array = [dictionary objectForKey:key];
//        if (array != nil && [array isKindOfClass:[NSArray class]]) {
//            return array;
//        }
//    }
//    return nil;
//}
//
//- (id)getObjectFromResponse:(id)responseObject key:(NSString *)key {
//    NSDictionary *dictionary = [self getDictionaryFromResponse:responseObject];
//    if (dictionary != nil){
//        return [dictionary objectForKey:key];
//    }
//    return nil;
//}
//
//
//#pragma mark - 错误处理
//- (NSError *)getServiceErrorFromResponse:(id)responseObject {
//    NSInteger returnCode = [self getReturnCodeFromResponse:responseObject];
//    if (returnCode == 10000 ||returnCode == 1|| returnCode == NSNotFound) {
//        return nil;
//    }else {
//        NSString *returnMessage = [self getReturnMessageFromResponse:responseObject];
//        if (returnMessage != nil) {
//            return [NSError errorWithDomain:URL_Main code:returnCode userInfo:@{NSLocalizedDescriptionKey:returnMessage}];
//        }
//        else{
//            return [self getParsingError];
//        }
//    }
//}
//
//- (NSError *)getUnknownrror {
//    return [NSError errorWithDomain:URL_Main code:NSURLErrorUnknown userInfo:@{NSLocalizedDescriptionKey:@"未知错误"}];
//}
//
//- (NSError *)getParsingError {
//    return [NSError errorWithDomain:URL_Main code:NSURLErrorCannotParseResponse userInfo:@{NSLocalizedDescriptionKey:@"数据无法解析"}];
//}
//
//- (NSError *)getSessionExpiredError {
//    return [NSError errorWithDomain:URL_Main code:777 userInfo:@{NSLocalizedDescriptionKey:@"需要重新登录"}];
//}
//
//#pragma mark - 添加固定的字段
//- (NSMutableDictionary *)commonParmeters {
//    //    NSInteger timeStamp = [NSDate date].timeIntervalSince1970;
//    //    NSString *signStr = [NSString  stringWithFormat:@"%ld%@",(long)timeStamp,KAppsecret];
//    //    NSString *sign = [signStr md5String];
//    //    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:KAppkey,@"appkey",@(timeStamp),@"timestamp",sign,@"sign",nil];
//
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    NSString *key = @"CFBundleShortVersionString";
//    // 获得当前软件的版本号
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
//    [dic setObject:currentVersion forKey:@"edition_id"];
//    [dic setObject:@"ios" forKey:@"os"];
////    [dic setObject:@"1" forKey:@"app_type"];
//    //    [dic setObject:[self MD5Token] forKey:@"token"];
//    //    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
//    //    if ([self isLigon]) {
//    //        NSString *uid = [df objectForKey:USER_ID];
//    //        [dic setObject:uid forKey:@"user_id"];
//    //    }
//    //    if ([self hasCommunity]) {
//    //        NSString *com = [(NSMutableDictionary *)dic objectForKey:@"community"];
//    //        if (com.length == 0) {
//    //            NSString *community = [df objectForKey:USERCOMMUNITY];
//    //            [dic setObject:community forKey:@"community"];
//    //        }
//    //    }
//    return dic;
//}
////
////- (NSString *)MD5Token {
////    NSDate *date = [NSDate date];
////    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
////    [fmt setDateFormat:@"yyyy%%MM%%dd%%HH"];
////    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:8*3600];
////    [fmt setTimeZone:timeZone];
////
////    NSString *dateString = [fmt stringFromDate:date];
////
////    NSString *dateStr = [self md5WithString:dateString length:25];
////    NSString *textStr = [self md5WithString:@"hellow homehealth" length:12];
////    NSString *tokenAll = [self md5WithString:[NSString stringWithFormat:@"%@%@", dateStr, textStr] length:25];
////    return tokenAll;
////}
////
////- (NSString *)md5WithString:(NSString *)md5Str length:(NSInteger)length {
////    const char *cstr = [md5Str UTF8String];
////    unsigned char result[16];
////    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
////
////    NSMutableString *md5 = [NSMutableString string];
////    for (int i = 0; i < 16; i ++) {
////        [md5 appendString:[NSString stringWithFormat:@"%02x", result[i]]];
////    }
////    NSString *md5String = [md5 substringToIndex:length];
////    return md5String;
////}
////
/////**
//// *  是否有登录
//// */
////- (BOOL)isLigon {
////    LoginData *data = [[NTESLoginManager sharedManager] currentLoginData];
////    NSString *account = [data account];
////    NSString *token = [data token];
////    if ([account length] && [token length]){
////        return YES;
////    }
////    else return NO;
////}
//
//@end
