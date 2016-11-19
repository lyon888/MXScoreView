//
// @author 刘智援 2016-11-19
// @简书地址:    http://www.jianshu.com/users/0714484ea84f/latest_articles
// @Github地址: https://github.com/lyoniOS
//


#import "MXScoreView.h"

static CGFloat kSingleScoreValueImageViewWidth = 0;//1分的图片宽度
static NSString *const kDefaultBgImageName  = @"MXScoreView.bundle/icon_bgView";//默认背景图片名称
static NSString *kDefaultPreImageName       = @"MXScoreView.bundle/icon_preView";//默认前景图片名称

@interface MXScoreView ()

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UIImageView *preImageView;

@end

@implementation MXScoreView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame totalScoreValue:(CGFloat)totalScoreValue
{
    //总分
    _totalScoreValue = totalScoreValue;
    //计算每分的图片宽度
    kSingleScoreValueImageViewWidth = frame.size.width / totalScoreValue;
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self setupUIFrame];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor grayColor];
    
    [self addSubview:self.bgImageView];
    [self addSubview:self.preImageView];
}

- (void)setupUIFrame
{
    self.bgImageView.frame   = self.bounds;
    self.preImageView.frame  = self.bounds;
}

#pragma mark - Getter and Setter

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:kDefaultBgImageName];
    }
    return _bgImageView;
}

- (UIImageView *)preImageView
{
    if (!_preImageView) {
        _preImageView = [[UIImageView alloc] init];
        _preImageView.image = [UIImage imageNamed:kDefaultPreImageName];
    }
    return _preImageView;
}

- (void)configBgImageName:(NSString *)bgImageName preImageName:(NSString *)preImageName
{
    _bgImageView.image   = [UIImage imageNamed:bgImageName];
    _preImageView.image  = [UIImage imageNamed:preImageName];
    kDefaultPreImageName = preImageName;
}

- (void)setCurrentScoreValue:(CGFloat)currentScoreValue
{
    //每次修改评分值时需要还原图片
    self.preImageView.frame = self.bounds;
    self.preImageView.image = [UIImage imageNamed:kDefaultPreImageName];
    
    //预防传入的分值大于总分值
    currentScoreValue = currentScoreValue > _totalScoreValue ? _totalScoreValue : currentScoreValue;
    /**
     处理绘画因传入宽度为0控制器输出的警告
     */
    currentScoreValue = currentScoreValue == 0.0 ? 0.1 : currentScoreValue;
    
    //获取视图原始尺寸
    CGRect preImageViewFrame     = self.preImageView.frame;
    preImageViewFrame.size.width = kSingleScoreValueImageViewWidth * currentScoreValue;
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(preImageViewFrame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将所有内容渲染到图形上下文中
    [self.preImageView.layer renderInContext:context];
    
    self.preImageView.frame = preImageViewFrame;
    self.preImageView.image = UIGraphicsGetImageFromCurrentImageContext();

    /**
     测试使用:将图片文件写到桌面
     [UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext()) writeToFile:@"/Users/zhongwangheyi/Desktop/image.png" atomically:YES];
     */
    
    UIGraphicsEndImageContext();
}

@end
