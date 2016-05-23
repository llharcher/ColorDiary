//
//  CDHomeCell.m
//  ColorDiary2
//
//  Created by apple on 16/5/22.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CDHomeCell.h"
#import "DiaryFrame.h"
#import "Diary.h"
#import "CDConst.h"

@interface CDHomeCell ()
@property (nonatomic, strong) UILabel * dcontent;
@property (nonatomic, strong) UILabel * ddate;
@property (nonatomic, strong) UIView* sprtV;
@end

@implementation CDHomeCell

+ (CDHomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID=@"cell";
    CDHomeCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[CDHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //cell点击不变色
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //间距view
        UIView* sprtV=[[UIView alloc] init];
        sprtV.backgroundColor=CDColor(235, 235, 242);
        [self addSubview:sprtV];
        self.sprtV=sprtV;
        //日期
        UILabel* ddate=[[UILabel alloc] init];
        ddate.font=[UIFont systemFontOfSize:20];
        [self addSubview:ddate];
        self.ddate=ddate;
        //正文
        UILabel* dcontent=[[UILabel alloc] init];
        dcontent.font=[UIFont systemFontOfSize:15];
        dcontent.numberOfLines=0;
        [self addSubview:dcontent];
        self.dcontent=dcontent;
    }
    return self;
}

-(void)setDiaryF:(DiaryFrame *)diaryF{
    _diaryF=diaryF;
    Diary* d=diaryF.diary;
    //View
    self.sprtV.frame=diaryF.sprtvF;
    //日期
    NSDateFormatter* dfm=[[NSDateFormatter alloc] init];
    [dfm setDateFormat:@"MM月dd日"];
    NSString* time=[dfm stringFromDate:d.ddate];
    self.ddate.text=time;
    self.ddate.frame=diaryF.ddateF;
    //正文
    self.dcontent.text=d.dcontent;
    self.dcontent.frame=diaryF.dcontentF;
    //修改正文颜色
    switch ([d.dcolor intValue]) {
        case CDCheckBoxColorRed:
            self.dcontent.textColor=[UIColor redColor];
            break;
        case CDCheckBoxColorOrange:
            self.dcontent.textColor=[UIColor orangeColor];
            break;
        case CDCheckBoxColorYellow:
            self.dcontent.textColor=[UIColor yellowColor];
            break;
        case CDCheckBoxColorGreen:
            self.dcontent.textColor=[UIColor greenColor];
            break;
        case CDCheckBoxColorCyan:
            self.dcontent.textColor=[UIColor cyanColor];
            break;
        case CDCheckBoxColorBlue:
            self.dcontent.textColor=[UIColor blueColor];
            break;
        case CDCheckBoxColorPurple:
            self.dcontent.textColor=[UIColor purpleColor];
            break;
        default:
            break;
    }
}



@end
