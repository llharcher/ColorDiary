//
//  DiaryFrame.m
//  ColorDiary2
//
//  Created by apple on 16/5/23.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "DiaryFrame.h"
#import "Diary.h"

@implementation DiaryFrame

-(void)setDiary:(Diary *)diary{
    _diary=diary;
    //分割view
    self.sprtvF=CGRectMake(0, 0, 320, 10);
    //日期frame
    self.ddateF=CGRectMake(10, CGRectGetMaxY(self.sprtvF)+10, 300, 20);
    //正文frame
    NSMutableDictionary* dict=[NSMutableDictionary dictionary];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    CGRect rect=[diary.dcontent boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    int contentY=CGRectGetMaxY(self.ddateF)+5;
    int contentX=10;
    self.dcontentF=CGRectMake(contentX, contentY, rect.size.width, rect.size.height);
    //cell高度
    self.cellHeight=CGRectGetMaxY(self.dcontentF)+10;
}

@end
