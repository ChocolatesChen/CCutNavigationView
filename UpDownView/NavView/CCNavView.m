//
//  CCNavView.m
//  UpDownView
//
//  Created by kedll on 2017/5/16.
//  Copyright © 2017年 Chocolate. All rights reserved.
//

#import "CCNavView.h"

@implementation CCNavView
@synthesize k_contentView;
@synthesize k_titleLabel;
@synthesize k_descriptionLabel;

- (void)k_leftButtonTouchBegan:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(k_leftButtonTouchBegan:)]) {
        [_delegate k_leftButtonTouchBegan:sender];
    }
}
- (void)k_rightButtonTouchBegan:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(k_rightButtonTouchBegan:)]) {
        [_delegate k_rightButtonTouchBegan:sender];
    }
}
-(void)awakeFromNib{
    [super awakeFromNib];
    k_contentView.clipsToBounds = YES;
    k_titleLabel.font = [UIFont systemFontOfSize:14];
    k_descriptionLabel.font = [UIFont systemFontOfSize:14];
    
    [_k_leftButton addTarget:self action:@selector(k_leftButtonTouchBegan:) forControlEvents:UIControlEventTouchUpInside];
    [_k_rightButton addTarget:self action:@selector(k_rightButtonTouchBegan:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)setViewWithTitle:(NSString *)title description:(NSString *)description{
    
    [k_titleLabel setText:title];

    [k_descriptionLabel setText:description];

}

@end
