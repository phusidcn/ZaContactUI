//
//  SelectedContactController.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedContactSectionController.h"

@interface SelectedContactSectionController ()
@end

@implementation SelectedContactSectionController

- (NSInteger) numberOfItems {
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(53, 53);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    SelectedViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SelectedViewCell class] forSectionController:self atIndex:index];
    
    cell.iconLabel.text = self.contact.avatarString;
    cell.iconLabel.backgroundColor = self.contact.iconColor;
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contact = (SelectedContacts*)object;
}
@end
