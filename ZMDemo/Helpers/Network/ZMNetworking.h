//
//  ZMNetworking.h
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    StatusUnknown           = -1, //未知网络
    StatusNotReachable      = 0,    //没有网络
    StatusReachableViaWWAN  = 1,    //手机自带网络
    StatusReachableViaWiFi  = 2     //wifi
    
}ZMNetworkStatus;

@interface ZMNetworking : NSObject

+ (ZMNetworking *)shareInstance;

/**
 *  获取网络状态
 */
@property (nonatomic,assign) ZMNetworkStatus networkStats;
+ (void)startMonitoring;


//封装常用的网络请求

/**
 *  向服务器发送get请求
 *
 *  @param url     请求的接口
 *  @param parameter 向服务器请求数据时候的参数
 *  @param success 请求成功结果,block的参数为服务器返回的数据
 *  @param failure 请求失败,block的参数是错误的信息
 */
- (void)Get:(NSString *)url
  parameter:(NSDictionary *)parameter
    success:(void(^)(NSDictionary *responseObject))success
    failure:(void(^)(NSError *error))failure;


/**
 *  带菊花 向服务器发送get请求
 *
 *  @param url       请求的接口
 *  @param parameter 向服务器请求数据时候的参数
 *  @param view      加载HUD的图层
 *  @param success   请求成功结果,block的参数为服务器返回的数据
 *  @param failure   请求失败,block的参数是错误的信息
 */
- (void)Get:(NSString *)url
  parameter:(NSDictionary *)parameter
     inView:(UIView *)view
    success:(void(^)(NSDictionary *responseObject))success
    failure:(void(^)(NSError *error))failure;



/**
 *  带菊花 + UIScrollView刷新动画  向服务器发送get请求
 *
 *  @param url       请求的接口
 *  @param parameter 向服务器请求数据时候的参数
 *  @param view      加载HUD的图层
 *  @param scrollView      加载数据的UIScrollView
 *  @param success   请求成功结果,block的参数为服务器返回的数据
 *  @param failure   请求失败,block的参数是错误的信息
 */
- (void)Get:(NSString *)url
  parameter:(NSDictionary *)parameter
     inView:(UIView *)view
 scrollView:(UIScrollView *)scrollView
    success:(void(^)(NSDictionary *responseObject))success
    failure:(void(^)(NSError *error))failure;


/**
 *  向服务器post数据
 *
 *  @param url       要提交数据额结构
 *  @param parameter 要提交的数据
 *  @param success   成功执行的block,block的参数为服务器返回的内容
 *  @param failure   失败执行的block,block的参数为错误信息
 */
- (void)Post:(NSString *)url
   parameter:(NSDictionary *)parameter
     success:(void(^)(NSDictionary *responseObject))success
     failure:(void(^)(NSError *error))failure;


/**
 *  带菊花 向服务器post数据
 *
 *  @param url       要提交数据额结构
 *  @param parameter 要提交的数据
 *  @param view      加载HUD的图层
 *  @param success   成功执行的block,block的参数为服务器返回的内容
 *  @param failure   失败执行的block,block的参数为错误信息
 */
- (void)Post:(NSString *)url
   parameter:(NSDictionary *)parameter
      inView:(UIView *)view
     success:(void(^)(NSDictionary *responseObject))success
     failure:(void(^)(NSError *error))failure;


/**
 *  带菊花 + UIScrollView刷新动画 向服务器post数据
 *
 *  @param url          要提交数据额结构
 *  @param parameter    要提交的数据
 *  @param view         加载HUD的图层
 *  @param scrollView   加载数据的UIScrollView
 *  @param success      成功执行的block,block的参数为服务器返回的内容
 *  @param failure      失败执行的block,block的参数为错误信息
 */
- (void)Post:(NSString *)url
   parameter:(NSDictionary *)parameter
      inView:(UIView *)view
  scrollView:(UIScrollView *)scrollView
     success:(void(^)(NSDictionary *responseObject))success
     failure:(void(^)(NSError *error))failure;


/**
 *  带菊花 向服务器上传文件
 *
 *  @param url       要上传文件的接口
 *  @param parameter 上传的参数
 *  @param fileData  上传的文件数据
 *  @param name      服务所对应的字段
 *  @param fileName  上传到服务器的文件名
 *  @param mimeType  上传文件类型
 *  @param view      加载HUD的图层
 *  @param success   成功执行的block,block的参数为服务器返回的内容
 *  @param failure   失败执行的block,block的参数为错误信息
 */
- (void)Post:(NSString *)url
   parameter:(NSDictionary *)parameter
        data:(NSData *)fileData
        name:(NSString *)name
    fileName:(NSString *)fileName
    mimeType:(NSString *)mimeType
      inView:(UIView *)view
     success:(void(^)(NSDictionary *responseObject))success
     failure:(void(^)(NSError *error))failure;

/**
 *  带菊花 多张图片上传
 *
 *  @param url       要上传文件的接口
 *  @param parameter 上传的参数
 *  @param imageArr  上传的图片数组
 *  @param name      服务所对应的字段
 *  @param mimeType  上传文件类型
 *  @param view 加载HUD的图层
 *  @param success   成功执行的block,block的参数为服务器返回的内容
 *  @param failure   失败执行的block,block的参数为错误信息
 */
- (void)Post:(NSString *)url
   parameter:(NSDictionary *)parameter
    imageArr:(NSArray *)imageArr
        name:(NSString *)name
    mimeType:(NSString *)mimeType
      inView:(UIView *)view
     success:(void (^)(NSDictionary *responseObject))success
     failure:(void (^)(NSError *error))failure;


@end
