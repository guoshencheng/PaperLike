//
//  CustomSelectionListDatasource.h
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSelectionListDatasource : NSObject <UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *selections;
@end
