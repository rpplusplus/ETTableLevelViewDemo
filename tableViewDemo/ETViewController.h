//
//  ETViewController.h
//  tableViewDemo
//
//  Created by Xiaoxuan Tang on 13-6-7.
//  Copyright (c) 2013年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray*                                     _tableViewDataSource;
}

@property (nonatomic, weak)   IBOutlet  UITableView*    tableView;

@end
