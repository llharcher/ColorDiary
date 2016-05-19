//
//  CoreDataTool.h
//  ColorDiary
//
//  Created by apple on 16/5/17.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CoreDataTool : NSObject
+(instancetype)sharedCoreDataTool;
-(void)cdinsertDate:(NSDate*)date text:(NSString*)text;
-(void)cdget;
@end
