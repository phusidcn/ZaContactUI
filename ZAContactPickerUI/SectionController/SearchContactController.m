//
//  SearchContactView.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SearchContactController.h"

@interface SearchContactController ()

@end

@implementation SearchContactController

- (NSInteger) numberOfItems {
    return 1;
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    SearchViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SearchViewCell class] forSectionController:self atIndex:index];
    return cell;
}
@end
