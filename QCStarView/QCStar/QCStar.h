//
//  QCStarView.h
//  QCStarView
//
//  Created by EricZhang on 2018/8/15.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCStar : UIView

@property(nonatomic,assign) CGFloat scorePercent;//分数（0...1）
@property(nonatomic,assign) BOOL isAnimation;//是否有动画
@property(nonatomic,assign) BOOL isCompleteStar;//是否整星
@property(nonatomic,assign) BOOL isJsutDisplay;//是否只是展示
//封装方法
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;
//block反向传星星score
@property(nonatomic,strong) void (^sendStarPercent)(double percent);




@end
