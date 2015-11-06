//
//  HomeViewController.m
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/5.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    NSDictionary *singleShowDictionary;
    NSDictionary *allDataDic;
    NSArray *allListDataArray;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initData];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods
- (void)initData{
    _homeDataRequest = [[HomeDataRequest alloc] initHomeRequestEngineWithMenuName:@"酸辣白菜"];
    _homeDataRequest.homeRequestDelegate = self;
}

#pragma mark - HomeReqeust Delegate
- (void)homeRequestDataSuccessWithReturn:(id)responseObject{
    allDataDic = responseObject;
    allListDataArray = [allDataDic objectForKey:@"data"];
    [self.mainTableView reloadData];
}

- (void)homeRequestDataFailWithReturn:(id)responseObject{
    
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return allListDataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCellIdentifier];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:nil options:nil] lastObject];
    }
    singleShowDictionary = allListDataArray[indexPath.row];
    cell.contentDictionary = singleShowDictionary;
    return cell;
}


#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
