//
//  CDHomeViewController.m
//  ColorDiary2
//
//  Created by apple on 16/5/19.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CDHomeViewController.h"
#import "CDComposeViewController.h"
#import "CoreDataTool.h"
#import "Diary.h"
#import "CDHomeCell.h"

@interface CDHomeViewController ()
@property (nonatomic, strong) NSArray* diaries;
@end

@implementation CDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title=@"日记本";
    //右边按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写日记" style:UIBarButtonItemStylePlain target:self action:@selector(compose)];
    //加载数据
    CoreDataTool* cd=[CoreDataTool sharedCoreDataTool];
    self.diaries=[cd cdselect];
}

//写日记
-(void)compose{
    CDComposeViewController* compose=[[CDComposeViewController alloc] init];
    [self.navigationController pushViewController:compose animated:YES];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.diaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDHomeCell* cell=[CDHomeCell tableView:tableView cellForRowAtIndexPath:indexPath];
    Diary* d=self.diaries[indexPath.row];
    cell.diary=d;
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    Diary* d=self.diaries[section];
//    NSDateFormatter* dfm=[[NSDateFormatter alloc] init];
//    [dfm setDateFormat:@"yyyy年MM月dd日"];
//    NSString* time=[dfm stringFromDate:d.ddate];
//    return time;
//}


@end
