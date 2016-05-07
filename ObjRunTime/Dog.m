//
//  Dog.m
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "Dog.h"

@interface Dog(){
@private NSString * _des;
}

@end


@implementation Dog
- (instancetype)init
{
    self = [super init];
    if (self) {
        _des = @"我是私有变量";
        _name1 = @"小乔";
    }
    return self;
}


- (void)firstMethod:(NSString *)falg{

    NSLog(@"%@",falg);
    NSLog(@"%s",__func__);
}
- (void)secondMethod:(NSArray *)array{
    NSLog(@"%@",array);
    NSLog(@"%s",__func__);
}
- (void)threeMethod:(BOOL)flag AndSel:(SEL)select{
    NSLog(@"%d,%@",flag,NSStringFromSelector(select));
    NSLog(@"%s",__func__);
}
- (NSString *)getStr:(NSString *)str{
    return str;
}
@end
