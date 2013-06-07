//
//  ETCellModel.m
//  tableViewDemo
//
//  Created by Xiaoxuan Tang on 13-6-7.
//  Copyright (c) 2013年 txx. All rights reserved.
//

#import "ETCellModel.h"

@implementation ETCellModel
- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ level = %d hide = %d", [super description], _level, _hide];
}
@end
