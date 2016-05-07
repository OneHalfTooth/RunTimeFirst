//
//  Pig.h
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pig : NSObject


@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)float age;
@property (nonatomic,assign)BOOL flag;
@property (nonatomic,strong)NSArray * array;
@property (nonatomic,strong)NSDictionary * dic;
- (void)firstMethod;
- (void)secondMethod;
- (void)threeMethod;
@end
