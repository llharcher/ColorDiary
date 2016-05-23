//
//  CDConst.h
//  ColorDiary2
//
//  Created by apple on 16/5/22.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

//颜色枚举类型
enum CDCheckBoxColor{
    CDCheckBoxColorRed=0,
    CDCheckBoxColorOrange,
    CDCheckBoxColorYellow,
    CDCheckBoxColorGreen,
    CDCheckBoxColorCyan,
    CDCheckBoxColorBlue,
    CDCheckBoxColorPurple
};

#define CDColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
