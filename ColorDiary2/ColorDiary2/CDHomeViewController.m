//
//  CDHomeViewController.m
//  ColorDiary2
//
//  Created by apple on 16/5/19.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CDHomeViewController.h"
#import "CDComposeViewController.h"
@interface CDHomeViewController ()

@end

@implementation CDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title=@"日记本";
    //右边按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写日记" style:UIBarButtonItemStylePlain target:self action:@selector(compose)];
}

-(void)compose{
    CDComposeViewController* compose=[[CDComposeViewController alloc] init];
    [self.navigationController pushViewController:compose animated:YES];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID=@"cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text=@"123";
    
    return cell;
}

@end
