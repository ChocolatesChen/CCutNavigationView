//
//  ViewController.m
//  UpDownView
//
//  Created by kedll on 2017/5/16.
//  Copyright © 2017年 Chocolate. All rights reserved.
//

#import "ViewController.h"
#import "CCNavView.h"
#import "UIView+Category.h"
#import "WSProgressHUD.h"


#define appWidth CGRectGetWidth([[UIScreen mainScreen] bounds])
#define appHight CGRectGetHeight([[UIScreen mainScreen] bounds])
//RGB颜色颜色
#define RGBColor(a,b,c,d) [UIColor colorWithRed:(a)/255. green:(b)/255. blue:(c)/255. alpha:(d)]
#define BasebgColorGray RGBColor(240, 241, 242, 1)

@interface ViewController ()<CAAnimationDelegate,UITableViewDelegate,UITableViewDataSource,CCNavViewDelegate>
{
    NSArray *rssArray;
}
@property (strong, nonatomic) CCNavView *navView;
@property (nonatomic , strong) UITableView *newtableView;
@end


@implementation ViewController
@synthesize navView;

- (void)viewDidLoad {
    [super viewDidLoad];
    navView = [[[NSBundle mainBundle]loadNibNamed:@"CCNavView" owner:self options:nil]lastObject];
    navView.frame = CGRectMake(0, 0, appWidth, 64);
    navView.delegate = self;
    [self.view addSubview:navView];
    

    _newtableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _newtableView.backgroundColor = BasebgColorGray;
    _newtableView.delegate = self;
    _newtableView.dataSource = self;
    _newtableView.frame = CGRectMake(0, 64, appWidth, appHight-64);
    [self.view addSubview:_newtableView];
    
    
    rssArray = @[@"等待滚动的文字",@"滚动后的文字"];
    [navView setViewWithTitle:rssArray[0] description:rssArray[1]];
}

#pragma mark - # CCNavViewDelegate
-(void)k_leftButtonTouchBegan:(UIButton *)sender{
    [WSProgressHUD showSuccessWithStatus:@"左item被点击"];
}
-(void)k_rightButtonTouchBegan:(UIButton *)sender{
    [WSProgressHUD showSuccessWithStatus:@"右item被点击"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试%ld",indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _newtableView) {
        if (scrollView.contentOffset.y < 64 && scrollView.contentOffset.y > 0) {
            navView.k_titleLabel.frame = CGRectMake(0, -scrollView.contentOffset.y , navView.k_contentView.frame.size.width, navView.k_contentView.frame.size.height);
            navView.k_descriptionLabel.frame = CGRectMake(0, navView.k_titleLabel.bottom+20, navView.k_contentView.frame.size.width, navView.k_contentView.frame.size.height);
        }else if (scrollView.contentOffset.y >= 64){
            navView.k_titleLabel.frame = CGRectMake(0, -64, navView.k_contentView.frame.size.width, navView.k_contentView.frame.size.height);
            navView.k_descriptionLabel.frame = CGRectMake(0, navView.k_titleLabel.bottom+20, navView.k_contentView.frame.size.width, navView.k_contentView.frame.size.height);
        }else if(scrollView.contentOffset.y <=0){
            navView.k_titleLabel.frame = CGRectMake(0, 0, navView.k_contentView.frame.size.width, navView.k_contentView.frame.size.height);
            navView.k_descriptionLabel.frame = CGRectMake(0, navView.k_titleLabel.bottom+20, navView.k_contentView.frame.size.width, navView.k_contentView.frame.size.height);
        }
        
    }
}


@end
