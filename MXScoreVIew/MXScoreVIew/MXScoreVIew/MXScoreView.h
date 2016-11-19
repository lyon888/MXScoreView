//
// @author 刘智援 2016-11-19
// @简书地址:    http://www.jianshu.com/users/0714484ea84f/latest_articles
// @Github地址: https://github.com/lyoniOS
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
 */
- (instancetype)initWithFrame:(CGRect)frame totalScoreValue:(CGFloat)totalScoreValue;
/**
 设置背景图片和前景图片
 
 @param bgImageName  背景图片
 @param preImageName 前景图片
 */
- (void)configBgImageName:(NSString *)bgImageName preImageName:(NSString *)preImageName;

@end

