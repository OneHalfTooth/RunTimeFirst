//
//  PushViewController.h
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushViewController : UIViewController
@property (nonatomic,retain)NSArray *dataSourceArray;
@property (nonatomic,retain)NSArray *dataSourceArrayClass;

@property (nonatomic,retain)id obj;

@property (nonatomic,assign)NSInteger flag;
@end
