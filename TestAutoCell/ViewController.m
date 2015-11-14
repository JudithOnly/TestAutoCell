//
//  ViewController.m
//  TestAutoCell
//
//  Created by Huashen on 11/13/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "TableViewCell.h"
#import "TableViewCellXib.h"
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation ViewController

#pragma mark - Inits

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - View

-(void)initView
{
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.bottom.equalTo(@0);
        make.top.equalTo(@64);
    }];

}

#pragma mark - <UITableViewDataSource/UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    /*! Code */
//    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHWTestHeightCellIdentifier forIndexPath:indexPath];

    /*! Xib */
    TableViewCellXib *cell = [tableView dequeueReusableCellWithIdentifier:kHWTestHeightCellIdentifier forIndexPath:indexPath];
    cell.dataModel = _data[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*! Code */
//    CGFloat height = [tableView fd_heightForCellWithIdentifier:kHWTestHeightCellIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
//        TableViewCell *tbCell = (TableViewCell *)cell;
//        tbCell.dataModel = _data[indexPath.row];
//    }];
    /*! Xib */
    CGFloat height = [tableView fd_heightForCellWithIdentifier:kHWTestHeightCellIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
        TableViewCellXib *tbCell = (TableViewCellXib *)cell;
        tbCell.dataModel = _data[indexPath.row];
    }];
    return height;
}
#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        /*! Code */
//        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:kHWTestHeightCellIdentifier];
        /*! Xib */
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewCellXib" bundle:nil] forCellReuseIdentifier:kHWTestHeightCellIdentifier];
    }
    
    return _tableView;
}

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
        DataModel *model = [DataModel dataModelWithTitle:@"打打分放大发发大氛围七分袜打打分放大发发大氛围七分袜氛围七分袜" content:@"的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大"];
        [_data addObject:model];
    }
    return _data;
}
@end
