//
//  BackgroundCollectionViewDatasource.h
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BackgroundCellConfigurationBlock)(NSIndexPath *indexPath, UICollectionViewCell *cell);

@interface BackgroundCollectionViewDatasource : NSObject<UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) BackgroundCellConfigurationBlock backgroundCellConfigurationBlock;

@end
