//
//  CDCheckBoxView.m
//  ColorDiary2
//
//  Created by apple on 16/5/21.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CDCheckBoxView.h"
#import "CDConst.h"


@interface CDCheckBoxView ()
@property (nonatomic, strong) UIButton* selBtn;
@end

@implementation CDCheckBoxView

+(instancetype)colorCheckBox{
    return [[CDCheckBoxView alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self addBtnWithImg:@"cd_red" selImg:@"cd_red_sel" tag:CDCheckBoxColorRed];
        [self addBtnWithImg:@"cd_orange" selImg:@"cd_orange_sel" tag:CDCheckBoxColorOrange];
        [self addBtnWithImg:@"cd_yellow" selImg:@"cd_yellow_sel" tag:CDCheckBoxColorYellow];
        [self addBtnWithImg:@"cd_green" selImg:@"cd_green_sel" tag:CDCheckBoxColorGreen];
        [self addBtnWithImg:@"cd_cyan" selImg:@"cd_cyan_sel" tag:CDCheckBoxColorCyan];
        [self addBtnWithImg:@"cd_blue" selImg:@"cd_blue_sel" tag:CDCheckBoxColorBlue];
        [self addBtnWithImg:@"cd_purple" selImg:@"cd_purple_sel" tag:CDCheckBoxColorPurple];
    }
    return self;
}

-(void)addBtnWithImg:(NSString*)img selImg:(NSString*)selImg tag:(int)tag{
    UIButton* btn=[[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
    btn.contentMode=UIViewContentModeCenter;
    btn.tag=tag;
    if (tag==CDCheckBoxColorRed) {
        self.selBtn=btn;
        self.selBtn.selected=YES;
    }
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

-(void)btnClick:(UIButton*)btn{
    self.selBtn.selected=!self.selBtn.selected;
    self.selBtn=btn;
    self.selBtn.selected=!self.selBtn.selected;
    //发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CheckBoxClickNotification" object:btn];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    int c=self.subviews.count;
    int btnEdge=self.frame.size.width/c;
    int btnW=35;
    int btnH=35;
    for (int i=0; i<c; i++) {
        UIButton* btn=self.subviews[i];
        btn.frame=CGRectMake(i*btnEdge, 0, btnW, btnH);
    }
}

@end
