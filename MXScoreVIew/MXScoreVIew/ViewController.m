//
//  ViewController.m
//  MXScoreVIew
//
//  Created by 广东众网合一网络科技有限公司 on 16/11/18.
//  Copyright © 2016年 lyoniOS. All rights reserved.
//

#import "ViewController.h"
#import "MXScoreView.h"

@interface ViewController ()
@property (nonatomic , strong)MXScoreView *scoreView;
@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scoreView.currentScoreValue = 15;
    [self.view addSubview:self.scoreView];
}

#pragma mark - Event Response

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击传入随机分值
    NSInteger count = arc4random_uniform(10);
    self.scoreView.currentScoreValue = count;
}

#pragma mark - Getter and Setter

- (MXScoreView *)scoreView
{
    if (!_scoreView) {
        _scoreView =  [[MXScoreView alloc]initWithFrame:CGRectMake(100, 100, 174, 25) totalScoreValue:10];
    }
    return _scoreView;
}

@end
