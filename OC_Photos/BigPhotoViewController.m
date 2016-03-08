//
//  BigPhotoViewController.m
//  OC_Photos
//
//  Created by 李庆彬 on 3/8/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import "BigPhotoViewController.h"

@interface BigPhotoViewController ()
@property (strong, nonatomic) UIImageView * imageView;

@end

@implementation BigPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.imageView];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    options.networkAccessAllowed = YES;
    options.progressHandler = ^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
        /*
         Progress callbacks may not be on the main thread. Since we're updating
         the UI, dispatch to the main queue.
         */
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.progressView.progress = progress;
        });
    };

    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize targetSize = CGSizeMake(self.imageView.bounds.size.width * scale, self.imageView.bounds.size.height * scale);
    [[PHImageManager defaultManager] requestImageForAsset:self.asset targetSize:targetSize contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.imageView.image = result;
    }];
}


@end
