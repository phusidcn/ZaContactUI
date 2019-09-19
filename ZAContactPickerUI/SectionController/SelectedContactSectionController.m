//
//  SelectedContactController.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedContactSectionController.h"

@interface SelectedContactSectionController ()
@property NSMutableArray* selectedContactsArray;
@end

@implementation SelectedContactSectionController

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

- (void) didUpdateToObject:(id)object {
    self.contact = (SelectedContacts*)object;
}
@end
