//
//  PhotoCollectionViewCell.m
//  OC_Photos
//
//  Created by 李庆彬 on 3/6/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation PhotoCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.photoImageView.image = nil;
}
- (void)setImage:(UIImage *)image {
    _image = image;
    self.photoImageView.image = image;
}

@end
