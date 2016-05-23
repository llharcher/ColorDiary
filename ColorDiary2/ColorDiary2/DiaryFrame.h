//
//  DiaryFrame.h
//  ColorDiary2
//
//  Created by apple on 16/5/23.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Diary;
@interface DiaryFrame : NSObject
@property (nonatomic, strong) Diary* diary;
@property (nonatomic, assign) CGRect sprtvF;
@property (nonatomic, assign) CGRect ddateF;
@property (nonatomic, assign) CGRect dcontentF;
@property (nonatomic, assign) int cellHeight;
@end
