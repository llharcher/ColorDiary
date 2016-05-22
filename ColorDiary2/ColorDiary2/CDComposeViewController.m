//
//  CDComposeViewController.m
//  ColorDiary2
//
//  Created by apple on 16/5/19.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CDComposeViewController.h"
#import "CDCheckBoxView.h"
#import "CoreDataTool.h"
#import "CDConst.h"
#import "MBProgressHUD+MJ.h"

#define CDColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface CDComposeViewController ()
@property (nonatomic, strong) UITextView* textV;
//当前日记颜色
@property (nonatomic, assign)enum CDCheckBoxColor curColor;
@end

@implementation CDComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"写日记";
    self.view.backgroundColor=[UIColor whiteColor];
    //右边按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写完啦" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    //输入框
    CGRect frame=CGRectMake(10, 0, 300, 250);
    UITextView* textV=[[UITextView alloc] initWithFrame:frame];
    textV.font=[UIFont systemFontOfSize:15];
    textV.textColor=[UIColor redColor];//默认颜色
    self.curColor=CDCheckBoxColorRed;
    textV.backgroundColor=CDColor(240, 240, 240);;
    self.textV=textV;
    [self.view addSubview:textV];
    //颜色选择器
    CDCheckBoxView* cb=[CDCheckBoxView colorCheckBox];
    CGRect f=cb.frame;
    f.origin.y=300;
    cb.frame=f;
    [self.view addSubview:cb];
    //接受通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkBoxClick:) name:@"CheckBoxClickNotification" object:nil];
}

//储存日记
-(void)send{
    if (self.textV.text==nil) {
        return;
    }
    NSDate* date=[NSDate date];
    NSDate* now=[NSDate dateWithTimeInterval:8*3600 sinceDate:date];
    
    CoreDataTool* cd=[CoreDataTool sharedCoreDataTool];
    [cd cdinsertDate:now text:self.textV.text color:self.curColor];
    //显示信息
    [MBProgressHUD showSuccess:@"保存成功"];
    //退出
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)checkBoxClick:(NSNotification*)notification{
    //修改当前颜色
    UIButton* btn=notification.object;
    self.curColor=btn.tag;
    switch (btn.tag) {
        case CDCheckBoxColorRed:
            self.textV.textColor=[UIColor redColor];
            break;
        case CDCheckBoxColorOrange:
            self.textV.textColor=[UIColor orangeColor];
            break;
        case CDCheckBoxColorYellow:
            self.textV.textColor=[UIColor yellowColor];
            break;
        case CDCheckBoxColorGreen:
            self.textV.textColor=[UIColor greenColor];
            break;
        case CDCheckBoxColorCyan:
            self.textV.textColor=[UIColor cyanColor];
            break;
        case CDCheckBoxColorBlue:
            self.textV.textColor=[UIColor blueColor];
            break;
        case CDCheckBoxColorPurple:
            self.textV.textColor=[UIColor purpleColor];
            break;
        default:
            break;
    }
    
}

-(void)dealloc{
    //注销观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
