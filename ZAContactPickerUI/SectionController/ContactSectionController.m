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
    return self;
}

- (NSInteger) numberOfItems {
    //return self.contacts.numberOfContacts;
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    CGSize viewSize = self.collectionContext.containerSize;
    return CGSizeMake(viewSize.width, 75);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    ContactViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[ContactViewCell class] forSectionController:self atIndex:index];
    cell.iconLabel.text = [NSString stringWithString:self.contacts.avatarString];
    cell.color = self.contacts.color;
    cell.contactName.text = [NSString stringWithString:self.contacts.contactName];
    cell.phoneNumber.text = [NSString stringWithString:self.contacts.phoneNumber];
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contacts = (ContactModel*)object;
}

- (void) didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%lu",index);
}
@end
