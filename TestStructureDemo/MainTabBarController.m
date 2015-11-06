//
//  MainTabBarController.m
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/5.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    HomeViewController *homeVCtrl = [[HomeViewController alloc] init];
    homeVCtrl.tabBarItem.title = @"推荐";
    MineViewController *mineVCtrl = [[MineViewController alloc] init];
    mineVCtrl.tabBarItem.title = @"我的";
    
    
    NSArray *tpViewControllers = @[homeVCtrl,mineVCtrl];
    NSMutableArray *viewControllersMutableArray = [[NSMutableArray alloc]init];
    for (int i = 0; i<tpViewControllers.count; i++) {
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tpViewControllers[i]];
        [viewControllersMutableArray addObject:tpViewControllers[i]];
    }
    self.viewControllers = viewControllersMutableArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
