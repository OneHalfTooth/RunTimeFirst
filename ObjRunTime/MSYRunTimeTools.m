//
//  MSYRunTimeTools.m
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "MSYRunTimeTools.h"
#import "Dog.h"

@implementation MSYRunTimeTools


+ (NSString *)getClassName:(id)obj{
    Class classObj = [obj class];
    NSString * string = NSStringFromClass(classObj);
    return string;
}
+ (NSString *)getClassSuperClassName:(id)obj{
    Class objSuperClass = [obj superclass];
    NSString * str = NSStringFromClass(objSuperClass);
    return str;
}
+ (double)getObjSize:(id)obj{
    Class objClass = [obj class];
    double size = class_getInstanceSize(objClass);
    return size;
}
+ (NSDictionary *)getObjPro:(id)obj{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    unsigned int count = 0;
        /// 获取对象的成员属性
    Ivar * ivars = class_copyIvarList([obj class], &count);
    for (int i = 0; i < count ; i ++){
        NSString * str = [NSString stringWithFormat:@"%s",ivar_getName(ivars[i])];
        NSLog(@"%@",str);
        //获取变量的值
        id value = [obj valueForKey:str];
        //获取变量的类型
        NSString * type = [NSString stringWithFormat:@"%s",ivar_getTypeEncoding(ivars[i])];
        if (value) {
            [dic setObject:value forKey:str];
        }
//        if (i != 1 && i != 2) {
            //不能获取基本数据类型
#warning 不能获取基本数据类型
//            id temp = object_getIvar(obj, ivars[i]);
//            NSLog(@"temp %@",temp);
//        }

    }
    free(ivars);

    return dic;
}
+ (id)getValueFromName:(NSString *)name AndObj:(id)obj{
    if (![name hasPrefix:@"_"]) {
        name = [@"_" stringByAppendingString:name];
    }
    const char * str = [name UTF8String];
    Ivar value = class_getInstanceVariable([obj class], str);
    //不能获取基本数据类型
    id temp = object_getIvar(obj, value);
    NSLog(@"%@",temp);
    return nil;
}
+ (NSDictionary *)getObjPriByProperty:(id)obj{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    unsigned int count = 0;
    objc_property_t * properties = class_copyPropertyList([obj class], &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t proper = properties[i];
        NSString * name = [NSString stringWithUTF8String:property_getName(proper)];
        NSLog(@"%@",name);
        //获取变量的值
        id value = [obj valueForKey:name];
        if (value) {
            [dic setObject:value forKey:name];
        }
    }
    return dic;
}
+ (NSArray *)getObjMethods:(id)obj{
    NSMutableArray * temp = [[NSMutableArray alloc]init];
    unsigned int count = 0;
    Method * methods = class_copyMethodList([obj class], &count);
    for (int i = 0 ; i < count; i ++) {
        Method method = methods[i];
        SEL select = method_getName(method);
        NSString * selectStr = NSStringFromSelector(select);
        [temp addObject:selectStr];
    }
    free(methods);
    return temp;
}
+ (NSArray *)getObjMethods:(id)obj SelStr:(SEL)select{

    Method method = class_getClassMethod([obj class], select);
    SEL selector = method_getName(method);
    BOOL res = class_respondsToSelector([obj class], select);
    if (res) {
        IMP imp = class_getMethodImplementation([obj class], select);
        
        //调用这个方法，这里是调用一个给数组赋值的方法
         id temp = objc_msgSend(obj, select,@"参数只有一个呢");
    
    }
    return nil;
}
+ (NSArray *)getProtocolList:(id)obj{
    NSMutableArray * array = [[NSMutableArray alloc]init];
    unsigned int count = 0;
    Protocol *__unsafe_unretained * protocols = class_copyProtocolList([obj class], &count);
    for (int i = 0; i < count; i ++) {
        Protocol *protocol = protocols[i];
        NSString * str = NSStringFromProtocol(protocol);
        NSString * str1= [NSString stringWithUTF8String:protocol_getName(protocol)];//protocol_getName(protocol);
        NSLog(@"%@,%@",str1,str);
        if (str) {
            [array addObject:str];
        }
    }
    return array;
}

@end
