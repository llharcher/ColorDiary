//
//  Diary.h
//  ColorDiary2
//
//  Created by apple on 16/5/19.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Diary : NSManagedObject

@property (nonatomic, retain) NSString * dcontent;
@property (nonatomic, retain) NSDate * ddate;
@property (nonatomic, retain) NSNumber * dcolor;

@end
