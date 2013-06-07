//
//  ETTableViewCell.m
//  tableViewDemo
//
//  Created by Xiaoxuan Tang on 13-6-7.
//  Copyright (c) 2013年 txx. All rights reserved.
//

#import "ETTableViewCell.h"
#define kLevelOffset    10
@implementation ETTableViewCell

- (void) setLevel:(NSInteger)level
{
    _level = level;
    
    CGRect rect = _contextLabel.frame;
    rect.origin.x =46 + kLevelOffset * _level;
    _contextLabel.frame = rect;
    
    rect = _iconView.frame;
    rect.origin.x =20 + kLevelOffset * _level;
    _iconView.frame = rect;
    
    _contextLabel.text = [NSString stringWithFormat:@"TableView 第 %d 级", _level + 1];
}

- (void) awakeFromNib
{
    
}
@end
