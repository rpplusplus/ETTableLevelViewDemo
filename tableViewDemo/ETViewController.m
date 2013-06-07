//
//  ETViewController.m
//  tableViewDemo
//
//  Created by Xiaoxuan Tang on 13-6-7.
//  Copyright (c) 2013年 txx. All rights reserved.
//

#import "ETViewController.h"
#import "ETCellModel.h"
#import "ETTableViewCell.h"
@implementation ETViewController

#define kMaxDeep 7

- (void) dataFiller:(NSInteger) level
{
    ETCellModel* model = [[ETCellModel alloc] init];
    model.level = level;
    model.hide = (1 << (kMaxDeep - level)) - 1;
    [_tableViewDataSource addObject:model];
    
    if (level != kMaxDeep - 1)
    {
        int t = random() % 3 + 1;
        for (int i=0; i<t; i++)
            [self dataFiller:level + 1];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableViewDataSource = [[NSMutableArray alloc] init];
    for (int i=0; i<2; i++) {
        [self dataFiller:0];
    }
}

const static int kShowFlag = (1 << kMaxDeep) -1;

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int n = 0;
    
    for (ETCellModel* model in _tableViewDataSource) {
        if (model.hide == kShowFlag) n ++ ;
    }
    
    return n;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int t = -1;
    ETCellModel* m;
    for (ETCellModel* model in _tableViewDataSource) {
        if (model.hide == kShowFlag) t ++;
        if (t == indexPath.row) {
            m = model;
            break;
        }
    }

    static NSString* key = @"default";
    ETTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:key];
    cell.level = m.level;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int t = -1, p = 0;
    ETCellModel* m;
    for (ETCellModel* model in _tableViewDataSource) {
        if (model.hide == kShowFlag) t ++;
        if (t == indexPath.row) {
            m = model;
            break;
        }
        p++;
    }
    
    if (m.level == 6) return;
    
    p ++;
    if (p == _tableViewDataSource.count) return;
    ETCellModel* nxtModel = _tableViewDataSource[p];
    if (nxtModel.level > m.level)
    {
        if (nxtModel.hide == kShowFlag)
        {
            NSMutableArray* arr = [NSMutableArray array];
            while (true)
            {
                if (nxtModel.hide == kShowFlag)
                {
                    t ++;
                    NSIndexPath* path = [NSIndexPath indexPathForRow:t inSection:0];
                    [arr addObject:path];
                }
                nxtModel.hide ^= 1 << (kMaxDeep - m.level - 1);
                p ++;
                if (p == _tableViewDataSource.count) break;
                nxtModel = _tableViewDataSource[p];
                if (nxtModel.level <= m.level) break;
            }
            [tableView deleteRowsAtIndexPaths:arr
                             withRowAnimation:UITableViewRowAnimationFade];
        }
        else
        {
            NSMutableArray* arr = [NSMutableArray array];
            while (true)
            {
                nxtModel.hide ^= 1 << (kMaxDeep - m.level - 1);
                
                if (nxtModel.hide == kShowFlag)
                {
                    t ++;
                    NSIndexPath* path = [NSIndexPath indexPathForRow:t inSection:0];
                    [arr addObject:path];
                }
                
                p ++;
                if (p == _tableViewDataSource.count) break;
                nxtModel = _tableViewDataSource[p];
                if (nxtModel.level <= m.level) break;
            }
            [tableView insertRowsAtIndexPaths:arr
                             withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}
@end
