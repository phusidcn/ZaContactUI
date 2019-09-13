//
//  SelectedContactController.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedContactController.h"

@interface SelectedContactController ()
@property NSMutableArray* selectedContactsArray;
@end

@implementation SelectedContactController

- (NSInteger) numberOfItems {
    return self.selectedContactsArray.count;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(53, 53);
}

- (UICollectionViewCell*) cellForItemAtindex:(NSInteger) index {
    SelectedViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SelectedViewCell class] forSectionController:self atIndex:index];
    return cell;
}

@end
