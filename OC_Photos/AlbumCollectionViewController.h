//
//  AlbumCollectionViewController.h
//  OC_Photos
//
//  Created by 李庆彬 on 3/6/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface AlbumCollectionViewController : UICollectionViewController
@property (strong, nonatomic) PHFetchResult * fetchResult;

@end
