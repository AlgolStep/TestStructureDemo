//
//  HomeViewController.h
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/5.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
#import "HomeDataRequest.h"
@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,homeDataDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) HomeDataRequest *homeDataRequest;
@end
