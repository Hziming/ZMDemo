//
//  KeyHeader.h
//  DdAppFramework
//
//  Created by wzw on 16/3/8.
//  Copyright © 2016年 wzw. All rights reserved.
//

#ifndef KeyHeader_h
#define KeyHeader_h

//是否是模拟器
#define IsSimulator 1

//初次加载 标识符
#define KLaunchKey @"firstLaunch"

/**屏幕高度*/
#define KVIEW_H [UIScreen mainScreen].bounds.size.height

/**屏幕宽度*/
#define KVIEW_W [UIScreen mainScreen].bounds.size.width

//
#define KScreen_Center CGPointMake(KVIEW_W/2.0, KVIEW_H/2.0 - 44)

//宽高比
#define KSCALE_W [UIScreen mainScreen].bounds.size.width/320.0
#define KSCALE_H [UIScreen mainScreen].bounds.size.height/667

// 当前版本
#define KSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]

#define KIMAGE_TOOL(imageUrl) [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",K_IMAGE_API,imageUrl]]

// 是否空对象
#define KIS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

#define KWeakSelf(type)  __weak typeof(type) weak##type = type;

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define KColor (arc4random()% 155 + 55)
#define KRGB RGBA(KColor,KColor,KColor,1.0f)

//背景颜色
#define KDefaultBackColor RGB(0, 190, 220)

#define K_BACKGROUD_color RGB(237, 241, 244)


#define K_DefaultImage [UIImage imageNamed:@"444"]
#define KBackImage [UIImage imageNamed:@"icon_pic_break"]



//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define KUserDefaults  [NSUserDefaults standardUserDefaults]

#define KNotificationCenter [NSNotificationCenter defaultCenter]

#define kHead  UICollectionElementKindSectionHeader
#define kFoot  UICollectionElementKindSectionFooter


#define K_TestUrl           @"http://www.baidu.com"
/*************************************** NSUserDefaultsKey********************************************/




#endif /* KeyHeader_h */
