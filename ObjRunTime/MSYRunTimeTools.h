//
//  MSYRunTimeTools.h
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>


@interface MSYRunTimeTools : NSObject
//获取类名
+ (NSString *)getClassName:(id)obj;
//获取父类名
+ (NSString *)getClassSuperClassName:(id)obj;
//获取对象所占空间的大小
+ (double)getObjSize:(id)obj;
//获取对象变量
+ (NSDictionary *)getObjPro:(id)obj;
//运行时获取私有变量的方法
+ (id)getValueFromName:(NSString *)name AndObj:(id)obj;
//获取对象的属性
+ (NSDictionary *)getObjPriByProperty:(id)obj;
//获取对象的方法
+ (NSArray *)getObjMethods:(id)obj;
//获取对象的某个方法
+ (NSArray *)getObjMethods:(id)obj SelStr:(SEL)select;
//获取协议列表
+ (NSArray *)getProtocolList:(id)obj;
@end
