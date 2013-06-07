//
//  ETTableViewCell.h
//  tableViewDemo
//
//  Created by Xiaoxuan Tang on 13-6-7.
//  Copyright (c) 2013年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETTableViewCell : UITableViewCell

@property (nonatomic)                   NSInteger       level;
@property (nonatomic, weak) IBOutlet    UIImageView*    iconView;
@property (nonatomic, weak) IBOutlet    UILabel*        contextLabel;

@end
