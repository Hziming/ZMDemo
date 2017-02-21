//
//  AppDelegate.h
//  ZMDemo
//
//  Created by ddapp on 17/1/11.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

