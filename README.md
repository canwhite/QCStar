## QCStar
【ios】写了一个星星评分的控件，可以操作评分，也可以只是展示，欢迎使用
## 以下为使用示例（将QCStar文件夹复制到项目中，即可使用）
···   
#import "ViewController.h"
#import "QCStar.h"


@interface ViewController ()
@property(nonatomic,strong) QCStar *qcStarView;
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.qcStarView = [[QCStar alloc] initWithFrame:CGRectMake(10, 100, 300, 40) numberOfStars:5];
    self.qcStarView.scorePercent = 0.3;
    self.qcStarView.isCompleteStar = NO;
    self.qcStarView.isAnimation = YES;
    //是否仅仅是展示,默认为NO，可选
    //self.qcStarView.isJsutDisplay = YES;
    
    self.qcStarView.sendStarPercent= ^(double data) {
        
        NSLog(@"%f",data);
    };
    
    [self.view addSubview:self.qcStarView];

}
···
