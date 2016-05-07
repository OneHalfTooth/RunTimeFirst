//
//  PushViewController.m
//  ObjRunTime
//
//  Created by 马少洋 on 16/4/28.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "PushViewController.h"
#import "MSYRunTimeTools.h"




@interface PushViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"无名";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArrayClass.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    NSString * str = self.dataSourceArrayClass[indexPath.row];
    if (self.dataSourceArray[indexPath.row]) {
        str = [str stringByAppendingString:self.dataSourceArray[indexPath.row]];
    }
    cell.textLabel.text = str;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (self.flag == 0) {
        if (self.obj) {
            [MSYRunTimeTools getValueFromName:cell.textLabel.text AndObj:self.obj];
        }
    }else if(self.flag == 1){
        [MSYRunTimeTools getObjMethods:self.obj SelStr:NSSelectorFromString(cell.textLabel.text)];
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
