
//
//  PushObjViewController.m
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "PushObjViewController.h"
#import "MSYRunTimeTools.h"
#import "PushViewController.h"


@interface PushObjViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PushObjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"获取对象属性";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    id obj = [self.dataSourceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = NSStringFromClass([obj class]);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.flag == 0) {
        NSDictionary * dic = [MSYRunTimeTools getObjPro:[self.dataSourceArray objectAtIndex:indexPath.row]];
        PushViewController * push = [[PushViewController alloc]init];
        push.flag = 0;
        push.dataSourceArrayClass = [dic allKeys];
        push.obj = [self.dataSourceArray objectAtIndex:indexPath.row];
        NSLog(@"%@",dic);
        [self.navigationController pushViewController:push animated:YES];
    }else if (self.flag == 1){
        NSDictionary * dic = [MSYRunTimeTools getObjPriByProperty:[self.dataSourceArray objectAtIndex:indexPath.row]];
        PushViewController * push = [[PushViewController alloc]init];
        push.flag = 0;
        push.dataSourceArrayClass = [dic allKeys];
        push.obj = [self.dataSourceArray objectAtIndex:indexPath.row];
        NSLog(@"%@",dic);
        [self.navigationController pushViewController:push animated:YES];
    }else if(self.flag == 2){
        NSArray * arr = [MSYRunTimeTools getObjMethods:[self.dataSourceArray objectAtIndex:indexPath.row]];
        PushViewController * push = [[PushViewController alloc]init];
        push.flag = 1;
        push.dataSourceArrayClass =arr;
        push.obj = [self.dataSourceArray objectAtIndex:indexPath.row];
        NSLog(@"%@",arr);
        [self.navigationController pushViewController:push animated:YES];
    }else if (self.flag == 3){
        NSArray * arr = [MSYRunTimeTools getProtocolList:[self.dataSourceArray objectAtIndex:indexPath.row]];
        PushViewController * push = [[PushViewController alloc]init];
        push.flag = 1;
        push.dataSourceArrayClass =arr;
        push.obj = [self.dataSourceArray objectAtIndex:indexPath.row];
        NSLog(@"%@",arr);
        [self.navigationController pushViewController:push animated:YES];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
