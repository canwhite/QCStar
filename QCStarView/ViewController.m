//
//  ViewController.m
//  QCStarView
//
//  Created by EricZhang on 2018/8/15.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "ViewController.h"
#import "QCStar.h"


@interface ViewController ()
@property(nonatomic,strong) QCStar *qcStarView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.qcStarView = [[QCStar alloc] initWithFrame:CGRectMake(10, 100, 300, 40) numberOfStars:5];
    self.qcStarView.scorePercent = 0.3;
    self.qcStarView.isCompleteStar = NO; //NO的话可以展示半星
    self.qcStarView.isAnimation = YES;
    //是否仅仅是展示,默认为NO，可选
    //self.qcStarView.isJsutDisplay = YES;
    
    self.qcStarView.sendStarPercent= ^(double data) {
        
        NSLog(@"%f",data);
    };
    
    [self.view addSubview:self.qcStarView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
