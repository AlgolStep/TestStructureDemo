//
//  HomeTableViewCell.h
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/6.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;
@property (weak, nonatomic) IBOutlet UILabel *dishTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishMaterialLabel;


@property (nonatomic, strong) NSDictionary *contentDictionary;
@end
