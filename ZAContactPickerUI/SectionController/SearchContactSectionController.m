//
//  SearchContactView.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SearchContactSectionController.h"

@interface SearchContactSectionController ()

@end

@implementation SearchContactSectionController

- (NSInteger) numberOfItems {
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    CGSize viewSize = self.collectionContext.containerSize;
    return CGSizeMake(viewSize.width, 50);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    SearchViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SearchViewCell class] forSectionController:self atIndex:index];
    cell.delegate = self;
    return cell;
}

- (void) searchContactWithKeyword:(NSString *)keyword {
    [self.delegate searchContactWithKeyword:keyword];
}

- (void) cancelSearch {
    [self.delegate cancelSearch];
}
@end
