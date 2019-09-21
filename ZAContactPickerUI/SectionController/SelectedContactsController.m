//
//  SelectedContactsController.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/20/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedContactsController.h"

@implementation SelectedContactsController
- (instancetype) init {
    self = [super init];
    self.utility = [[contactUtility alloc] init];
    self.inset = UIEdgeInsetsMake(5, 5, 5, 5);
    return self;
}

- (NSInteger) numberOfItems {
    return self.contactsModel.contacts.count;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(53, 53);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger)index {
    SelectedViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SelectedViewCell class] forSectionController:self atIndex:index];
    contactWithStatus* contact = [self.contactsModel.contacts objectAtIndex:index];
    cell.iconLabel.text = [self.utility getAvatarOf:contact];
    cell.contentView.backgroundColor = [self.utility getColorOf:contact];
    cell.clipsToBounds = true;
    cell.layer.cornerRadius = cell.contentView.bounds.size.height / 2;
    [cell layoutSubviews];
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contactsModel = (SelectedContactsModel*)object;
}

- (void) didSelectItemAtIndex:(NSInteger)index {
    [self.delegate actionForSelectedContact:[self.contactsModel.contacts objectAtIndex:index]];
}
@end
