//
//  CDHomeCell.m
//  ColorDiary2
//
//  Created by apple on 16/5/22.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CDHomeCell.h"
#import "Diary.h"

@interface CDHomeCell ()
@property (nonatomic, strong) UILabel * dcontent;
@property (nonatomic, strong) UILabel * ddate;
@end

@implementation CDHomeCell

+ (CDHomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID=@"cell";
    CDHomeCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[CDHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //日期
        UILabel* ddate=[[UILabel alloc] init];
        ddate.frame=CGRectMake(0, 5, 320, 20);
        [self addSubview:ddate];
        self.ddate=ddate;
        //正文
        UILabel* dcontent=[[UILabel alloc] init];
        dcontent.frame=CGRectMake(0, 30, 320, 20);
        [self addSubview:dcontent];
        self.dcontent=dcontent;
    }
    return self;
}

-(void)setDiary:(Diary *)diary{
    _diary=diary;
    //日期
    NSDateFormatter* dfm=[[NSDateFormatter alloc] init];
    [dfm setDateFormat:@"yyyy年MM月dd日"];
    NSString* time=[dfm stringFromDate:diary.ddate];
    self.ddate.text=time;
    //正文
    self.dcontent.text=diary.dcontent;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
