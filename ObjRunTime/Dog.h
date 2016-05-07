//
//  Dog.h
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@protocol ThisIsProtocol <NSObject>
- (void)haha;


@end



@interface Dog : UIView<ThisIsProtocol>{
    NSString * _name1;
}

@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)float age;
@property (nonatomic,assign)BOOL flag;
@property (nonatomic,strong)NSArray * array;
@property (nonatomic,strong)NSDictionary * dic;


@end
