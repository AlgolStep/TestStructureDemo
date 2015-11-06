//
//  HomeTableViewCell.m
//  TestStructureDemo
//
//  Created by 思来氏 on 15/11/6.
//  Copyright (c) 2015年 ThornDemo. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HomeTableViewCell


- (void)awakeFromNib {
    // Initialization code
   
    
}

- (void)setContentDictionary:(NSDictionary *)contentDictionary{
    if (_contentDictionary == nil) {
        _contentDictionary = contentDictionary;
    }
    NSDictionary *showDic = _contentDictionary;
    self.dishTitleLabel.text = [showDic objectForKey:@"title"];
    self.dishMaterialLabel.text = [showDic objectForKey:@"burden"];
    NSArray *imageArray = [showDic objectForKey:@"albums"];
    if (imageArray.count > 0) {
        NSURL *url = [[NSURL alloc] initWithString:imageArray[0]];
        [self.dishImageView sd_setImageWithURL:url];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
