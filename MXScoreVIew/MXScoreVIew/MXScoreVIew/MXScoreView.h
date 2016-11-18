//
//  MXScoreView.h
//  MXScoreVIew
//
//  Created by 广东众网合一网络科技有限公司 on 16/11/18.
//  Copyright © 2016年 lyoniOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXScoreView : UIView
/**总评分数值*/
@property (nonatomic,assign)CGFloat totalScoreValue;
/**设置当前评分数值*/
@property (nonatomic,assign)CGFloat currentScoreValue;

/**
 初始化方法

 @param frame           尺寸
 @param totalScoreValue 总分

 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame totalScoreValue:(CGFloat)totalScoreValue;
/**
 设置背景图片和前景图片
 
 @param bgImageName  背景图片
 @param preImageName 前景图片
 */
- (void)configBgImageName:(NSString *)bgImageName preImageName:(NSString *)preImageName;

@end

