//
//  ViewController.m
//  ClipImgDemo
//
//  Created by lang on 2021/7/16.
//

#import "ViewController.h"
#import "LClipImgView.h"

#define lscreenW UIScreen.mainScreen.bounds.size.width
#define lscreenH UIScreen.mainScreen.bounds.size.height

@interface ViewController ()

@property (nonatomic , strong) UIImageView  * showImgView;
@property (nonatomic , strong) LClipImgView * lImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.showImgView];
    

    self.lImageView = [[LClipImgView alloc] initWithFrame:self.view.bounds];
    self.lImageView.toCropImage = [UIImage imageNamed:@"img"];          //设置底图（必须属性!）
    self.lImageView.showSplitLines = YES;
    self.lImageView.needScaleCrop = YES;           //允许手指捏和缩放裁剪框
//    self.lImageView.showInsideCropButton = YES;    //允许内部裁剪按钮
//    self.lImageView.btnCropWH = 30;                //内部裁剪按钮宽高，有默认值，不设也没事
//    self.lImageView.delegate = self;               //需要实现内部裁剪代理事件
//    __weak __typeof(self)weakSelf = self;
//    self.lImageView.getImgBlock = ^(UIImage *image) {
////        weakSelf.showImgView.image = image;
//    };
//    [self.lImageView getImgBlock:^(UIImage *image) {
//        weakSelf.showImgView.image = image;
//
//    }];
    [self.view addSubview:self.lImageView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.showImgView.image = self.lImageView.currentCroppedImage;
}

-(UIImageView *)showImgView
{
    if (!_showImgView) {
//        UIImage * image = [UIImage imageNamed:@"img"];
        _showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(lscreenW / 2 - 50, 60, 100,100)];
        _showImgView.contentMode = UIViewContentModeScaleAspectFit;
//        _showImgView.image = image;
    }
    return _showImgView;
}

@end
