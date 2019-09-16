//
//  ContactView.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactSectionController.h"

@interface ContactSectionController ()
@property contactUtility* utility;
@end

@implementation ContactSectionController

- (instancetype) init {
    self = [super init];
    if (self) {
        self.utility = [[contactUtility alloc] init];
    }
    return self;
}

- (NSInteger) numberOfItems {
    return self.contacts.numberOfContacts;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    CGSize viewSize = self.collectionContext.containerSize;
    return CGSizeMake(viewSize.width, 75);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    ContactViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[ContactViewCell class] forSectionController:self atIndex:index];
    cell.iconLabel.text = [self.utility getAvatarOf:[self.contacts contactAtIndex:index]];
    cell.contactName.text = [self.utility getContactFullNameOf:[self.contacts contactAtIndex:index]];
    cell.phoneNumber.text = [self.utility getPhoneNumberOf:[self.contacts contactAtIndex:index]];
    cell.color = [self.utility getColorOf:[self.contacts contactAtIndex:index]];
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contacts = (ContactModel*)object;
}

- (void) didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%lu",index);
}
@end
