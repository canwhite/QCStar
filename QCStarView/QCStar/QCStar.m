//
//  QCStarView.m
//  QCStarView
//
//  Created by EricZhang on 2018/8/15.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "QCStar.h"

#define STAR_YELLOW_NAME @"star_yellow"
#define STAR_GRAY_NAME @"star_gray"
#define DEFALUT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.1



/*
 实现思路
 先放背景图
 再放前景图
 前景图在上背景图在下
 然后根据比例显示前景图
 */


@interface QCStar()
// 前景视图
@property (nonatomic, strong) UIView *foregroundStarView;
// 背景视图
@property (nonatomic, strong) UIView *backgroundStarView;
// 星星个数
@property (nonatomic, assign) NSInteger numberOfStars;


@end

@implementation QCStar


- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}


- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self createDataAndUI];
    }
    return self;
}

// 创建视图
- (void)createDataAndUI {
    
    
    _scorePercent = 1;//默认为1
    _isAnimation = NO;//默认为NO
    _isCompleteStar = NO;//默认为NO
    _isJsutDisplay = NO;
    self.foregroundStarView = [self createStarViewWithImage:STAR_YELLOW_NAME];
    self.backgroundStarView = [self createStarViewWithImage:STAR_GRAY_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
    
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self]; // 手指当前点
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.isCompleteStar ? realStarScore : ceilf(realStarScore);
    
    if (_isJsutDisplay) {
        //数据不发生变化，界面也就不刷新
    }else{
        
        self.scorePercent = starScore / self.numberOfStars;
        if (self.sendStarPercent) {
            self.sendStarPercent(self.scorePercent);
        }
        
    }

    
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}



//MARK: 建议使用setNeedsLayout  可以和变化数据同步使用（eg:下边的set方法）  只要数据变化 layoutSubviews 就会被调用，而addsubview一般只调用一次
- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak QCStar *weakSelf = self;
    CGFloat animationTimeInterval = self.isAnimation ? ANIMATION_TIME_INTERVAL : 0;
    
    [UIView animateWithDuration:animationTimeInterval animations:^{
        
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}



#pragma mark - Get and Set Methods

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    [self setNeedsLayout];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
