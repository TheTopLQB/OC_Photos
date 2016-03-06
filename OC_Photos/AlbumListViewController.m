//
//  AlbumListViewController.m
//  OC_Photos
//
//  Created by 李庆彬 on 3/6/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import "AlbumListViewController.h"
#import <Photos/Photos.h>
#import "AlbumCollectionViewController.h"

@interface AlbumListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray * fetchResults;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation AlbumListViewController

static NSString * const cellReuseIdentifier = @"albumCellReuseIdentifier";

- (void)viewDidLoad {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    PHFetchOptions * options = [[PHFetchOptions alloc] init];
    PHFetchResult * result = [PHAsset fetchAssetsWithOptions:options];
    self.fetchResults = @[result];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"所有照片";
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:cellReuseIdentifier sender:self.fetchResults[0]];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:cellReuseIdentifier]) {
        PHFetchResult * fetchReult = (PHFetchResult *)sender;
        AlbumCollectionViewController * albumCollectionVC = segue.destinationViewController;
        albumCollectionVC.fetchResult = fetchReult;
    }
}


@end
