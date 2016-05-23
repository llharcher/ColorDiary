//
//  CDHomeCell.h
//  ColorDiary2
//
//  Created by apple on 16/5/22.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiaryFrame;

@interface CDHomeCell : UITableViewCell
@property (nonatomic, strong) DiaryFrame* diaryF;
+ (CDHomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
