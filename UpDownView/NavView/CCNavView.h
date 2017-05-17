//
//  CCNavView.h
//  UpDownView
//
//  Created by kedll on 2017/5/16.
//  Copyright © 2017年 Chocolate. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCNavViewDelegate <NSObject>

- (void)k_leftButtonTouchBegan:(UIButton *)sender;

- (void)k_rightButtonTouchBegan:(UIButton *)sender;

@end
@interface CCNavView : UIView
@property (weak, nonatomic) IBOutlet UIView     *k_leftItem;
@property (weak, nonatomic) IBOutlet UIView     *k_rightItem;

@property (weak, nonatomic) IBOutlet UIButton   *k_leftButton;
@property (weak, nonatomic) IBOutlet UIButton   *k_rightButton;

@property (weak, nonatomic) IBOutlet UIView     *k_contentView;
@property (weak, nonatomic) IBOutlet UILabel    *k_titleLabel;
@property (weak, nonatomic) IBOutlet UILabel    *k_descriptionLabel;

@property (weak, nonatomic) id<CCNavViewDelegate> delegate;

-(void)setViewWithTitle:(NSString *)title description:(NSString *)description;
@end
