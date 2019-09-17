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
    //return self.contacts.numberOfContacts;
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    CGSize viewSize = self.collectionContext.containerSize;
    return CGSizeMake(viewSize.width, viewSize.height);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    ContactViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[ContactViewCell class] forSectionController:self atIndex:index];
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contacts = (ContactModel*)object;
}

- (void) didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%lu",index);
}
@end
