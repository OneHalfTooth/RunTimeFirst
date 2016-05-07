//
//  ViewController.m
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "MSYRunTimeTools.h"
#import "PushViewController.h"
#import "PushObjViewController.h"
#import "Dog.h"
#import "Cat.h"
#import "Pig.h"











@interface ViewController() <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain)NSArray * dataSourceArray;
@property (nonatomic,retain)NSMutableArray * pushDataSourceArray;
@property (nonatomic,retain)NSMutableArray * pushDataSourceArrayClass;


@property (nonatomic,retain)Dog * dog;
@property (nonatomic,retain)Cat * cat;
@property (nonatomic,retain)Pig * pig;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createObj];
    self.dataSourceArray = @[@"获取对象类名",@"获取对象的父类名字",@"获取对象大小",@"获取对象的变量",@"获取对象属性pro",@"获取对象方法名",@"获取对象协议"];
    self.pushDataSourceArray = [[NSMutableArray alloc]init];
    self.pushDataSourceArrayClass = [[NSMutableArray alloc]init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Idtifier"];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -- 返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
#pragma mark --返回区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark --返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}
#pragma mark --返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Idtifier"];
    cell.textLabel.text  = [self.dataSourceArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.pushDataSourceArrayClass removeAllObjects];
    [self.pushDataSourceArray removeAllObjects];
    if (indexPath.row == 0) {
        [self getNameClass];
        [self push];
    }else if(indexPath.row == 1){
        [self getSuperClassName];
        [self push];
    }else if(indexPath.row == 2){
        [self getObjSize];
        [self push];
    }else if(indexPath.row == 3){
        PushObjViewController * push = [[PushObjViewController alloc]init];
        push.flag = 0;
        push.dataSourceArray = @[self.dog,self.pig,self.cat];
        [self.navigationController pushViewController:push animated:YES];
    }else if (indexPath.row == 4){
        PushObjViewController * push = [[PushObjViewController alloc]init];
        push.dataSourceArray = @[self.dog,self.pig,self.cat];
        push.flag = 1;
        [self.navigationController pushViewController:push animated:YES];
    }else if (indexPath.row == 5){
        PushObjViewController * push = [[PushObjViewController alloc]init];
        push.dataSourceArray = @[self.dog,self.pig,self.cat];
        push.flag = 2;
        [self.navigationController pushViewController:push animated:YES];
    }else if (indexPath.row == 6){
        PushObjViewController * push = [[PushObjViewController alloc]init];
        push.dataSourceArray = @[self.dog,self.pig,self.cat];
        push.flag = 3;
        [self.navigationController pushViewController:push animated:YES];
    }
}
- (void)getObjMethod{
    [self getObjMethodFrom:self.dog];
    [self getObjMethodFrom:self.pig];
    [self getObjMethodFrom:self.cat];
}
- (void)getObjSize{
    [self getObjSizeForm:self.dog];
    [self getObjSizeForm:self.pig];
    [self getObjSizeForm:self.cat];
}
- (void)getNameClass{
    [self getObjClassName:self.dog];
    [self getObjClassName:self.pig];
    [self getObjClassName:self.cat];
}
- (void)getSuperClassName{
    [self getObjClassNameSuper:self.dog];
    [self getObjClassNameSuper:self.pig];
    [self getObjClassNameSuper:self.cat];
}
- (void)getObjMethodFrom:(id)obj{
    [self.pushDataSourceArrayClass addObjectsFromArray:[MSYRunTimeTools getObjMethods:obj]];
}
- (void)getObjSizeForm:(id)obj{
    double size = [MSYRunTimeTools getObjSize:obj];
    NSString * str = [NSString stringWithFormat:@"%lf",size];
    [self.pushDataSourceArray addObject:str];
    [self.pushDataSourceArrayClass addObject:@"大小--------"];
}
- (void)getObjClassName:(id)obj{
    NSString * str = [MSYRunTimeTools getClassName:obj];
    [self.pushDataSourceArray addObject:str];
    [self.pushDataSourceArrayClass addObject:@"类名--------"];
}
- (void)getObjClassNameSuper:(id)obj{
    NSString * str = [MSYRunTimeTools getClassSuperClassName:obj];
    [self.pushDataSourceArray addObject:str];
    [self.pushDataSourceArrayClass addObject:@"父类名--------"];
}
- (void)push{
    PushViewController * push = [[PushViewController alloc]init];
    push.flag = 0;
    push.dataSourceArray = self.pushDataSourceArray;
    push.dataSourceArrayClass = self.pushDataSourceArrayClass;
    [self.navigationController pushViewController:push animated:YES];
}
- (void)createObj{
    Dog * dog = [[Dog alloc]init];
    dog.name = @"小🐶";
    dog.age = 1;
    dog.flag = NO;
    dog.array = @[@(1),@(2),@(3),@(4),@(5)];
    dog.dic = @{@"1":@"11",@"1":@"11",@"1":@"11",@"1":@"11",@"1":@"11"};
    self.dog = dog;
    Pig * pig = [[Pig alloc]init];
    pig.name = @"小🐷";
    pig.age = 1;
    pig.flag = NO;
    pig.array = @[@(1),@(2),@(3),@(4),@(5)];
    pig.dic = @{@"1":@"11",@"1":@"11",@"1":@"11",@"1":@"11",@"1":@"11"};
    self.pig = pig;
    Cat * cat = [[Cat alloc]init];
    cat.name = @"小🐱";
    cat.age = 1;
    cat.flag = NO;
    cat.array = @[@(1),@(2),@(3),@(4),@(5)];
    cat.dic = @{@"1":@"11",@"1":@"11",@"1":@"11",@"1":@"11",@"1":@"11"};
    self.cat = cat;
}
@end
