//
//  ZMNetworking.m
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMNetworking.h"

@implementation ZMNetworking

+ (ZMNetworking *)shareInstance //获取网络请求单例
{
    static ZMNetworking *helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (helper == nil)
        {
            helper = [[ZMNetworking alloc] init];
        }
    });
    return helper;
}


#pragma makr - 开始监听网络连接

+ (void)startMonitoring
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                DLog(@"未知网络");
                [ZMNetworking shareInstance].networkStats = StatusUnknown;
                
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                DLog(@"没有网络");
                [ZMNetworking shareInstance].networkStats=StatusNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                DLog(@"手机自带网络");
                [ZMNetworking shareInstance].networkStats=StatusReachableViaWWAN;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                
                [ZMNetworking shareInstance].networkStats=StatusReachableViaWiFi;
                break;
        }
    }];
    [mgr startMonitoring];
}



- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [self Get:url parameter:parameter inView:nil scrollView:nil success:^(NSDictionary * responseObject) {
        success(responseObject);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}


- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter inView:(UIView *)view success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [self Get:url parameter:parameter inView:view scrollView:nil success:^(NSDictionary * responseObject) {
        success(responseObject);
        
    } failure:^(NSError *error) {
        failure(error);
        
    }];
}



- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    if (view)   [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    NSString *strUrl = [NSString stringWithFormat:@"%@%@", K_API, url];
    
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *result = [responseObject isKindOfClass:[NSDictionary class]] ? responseObject : [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        
        if (view)       [MBProgressHUD hideHUDForView:view animated:YES];
        
        if (scrollView) {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer endRefreshing];
            
        }
        
        //根据后台返回的字段做判断  这里先注释掉
//        if ([result[@"result"] isEqualToString:@"OK"]) {
//            
            if (success)    success(result);
//        } else {
//            [SVProgressHUD showInfoWithStatus:result[@"result"]];
//        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (view)       [MBProgressHUD hideHUDForView:view animated:YES];
        
        if (scrollView) {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer endRefreshing];
        }
        
        if (failure)    failure(error);
        
        //一般报 404   详情可打印 error
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
    }];
    
}





- (void)Post:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [self Post:url parameter:parameter inView:nil scrollView:nil success:^(NSDictionary * responseObject) {
        success(responseObject);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}


-(void)Post:(NSString *)url parameter:(NSDictionary *)parameter inView:(UIView *)view success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [self Post:url parameter:parameter inView:view scrollView:nil success:^(NSDictionary * responseObject) {
        success(responseObject);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}


-(void)Post:(NSString *)url parameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    
    if (view)   [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    NSString *strUrl = [NSString stringWithFormat:@"%@%@", K_API, url];
    
    [manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *result = [responseObject isKindOfClass:[NSDictionary class]] ? responseObject : [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        if (view)       [MBProgressHUD hideHUDForView:view animated:YES];
        
        if (scrollView) {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer endRefreshing];
            
        }
        //根据后台返回的字段做判断  这里先注释掉
//        if ([result[@"result"] isEqualToString:@"OK"]) {
//            
            if (success)    success(result);
//        } else {
//            [SVProgressHUD showInfoWithStatus:result[@"result"]];
//        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (view)       [MBProgressHUD hideHUDForView:view animated:YES];
        
        if (scrollView) {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer endRefreshing];
        }
        if (failure)    failure(error);
        
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
    }];
    
}








-(void)Post:(NSString *)url parameter:(NSDictionary *)parameter data:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType inView:(UIView *)view success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    
    NSAssert(view != nil, @"必须要有加载HUD的View");
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    if (fileData)   hud.mode = MBProgressHUDModeDeterminate;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (fileData) {
            
            [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:mimeType];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        DLog(@"%.2f" ,uploadProgress.completedUnitCount * 1.0 / uploadProgress.totalUnitCount);
        
        hud.progress = uploadProgress.completedUnitCount * 1.0 / uploadProgress.totalUnitCount;
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        
        NSDictionary *result = [responseObject isKindOfClass:[NSDictionary class]] ? responseObject : [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        //根据后台返回的字段做判断
        if ([result[@"result"] isEqualToString:@"OK"]) {
            
            if (success)    success(result);
        } else {
            [SVProgressHUD showInfoWithStatus:result[@"result"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        
        if (failure)    failure(error);
        
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
    }];
    
}

- (void)Post:(NSString *)url parameter:(NSDictionary *)parameter imageArr:(NSArray *)imageArr name:(NSString *)name mimeType:(NSString *)mimeType inView:(UIView *)view success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    if (imageArr.count > 0) hud.mode = MBProgressHUDModeDeterminate;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [imageArr enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *fileData = UIImageJPEGRepresentation(image, 1.0/*压缩比*/);
            
            NSString *str = [NSString stringWithFormat:@"photo%ld.jpg",idx];
            
            [formData appendPartWithFileData:fileData name:name fileName:str mimeType:mimeType];
        }];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        DLog(@"%.2f" ,uploadProgress.completedUnitCount * 1.0 / uploadProgress.totalUnitCount);
        
        hud.progress = uploadProgress.completedUnitCount * 1.0 / uploadProgress.totalUnitCount;
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        
        NSDictionary *result = [responseObject isKindOfClass:[NSDictionary class]] ? responseObject : [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        //根据后台返回的字段做判断
        if ([result[@"result"] isEqualToString:@"OK"]) {
            
            if (success)    success(result);
        } else {
            [SVProgressHUD showInfoWithStatus:result[@"result"]];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        
        if (failure)    failure(error);
        
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
    }];
}

@end
