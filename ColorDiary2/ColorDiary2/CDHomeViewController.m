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
#import "DiaryFrame.h"

@interface CDHomeViewController ()
@property (nonatomic, strong) NSMutableArray* diariesF;
@end

@implementation CDHomeViewController

-(NSMutableArray *)diariesF{
    if (!_diariesF) {
        _diariesF=[[NSMutableArray alloc] init];
    }
    return _diariesF;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title=@"颜色日记本";
    //右边按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写日记" style:UIBarButtonItemStylePlain target:self action:@selector(compose)];
    //取消cell间分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //加载数据
    [self.diariesF removeAllObjects];//清空
    CoreDataTool* cd=[CoreDataTool sharedCoreDataTool];
    NSArray* diaries=[cd cdselect];
    for (Diary* d in diaries) {
        DiaryFrame* df=[[DiaryFrame alloc] init];
        df.diary=d;
        [self.diariesF insertObject:df atIndex:0];
    }
    [self.tableView reloadData];
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
    return self.diariesF.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDHomeCell* cell=[CDHomeCell tableView:tableView cellForRowAtIndexPath:indexPath];
    DiaryFrame* df=self.diariesF[indexPath.row];
    cell.diaryF=df;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiaryFrame* df=self.diariesF[indexPath.row];
    return df.cellHeight;
}


@end
