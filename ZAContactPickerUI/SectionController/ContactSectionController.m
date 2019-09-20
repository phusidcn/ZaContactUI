//
//  ContactView.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactSectionController.h"

@interface ContactSectionController ()
+ (contactUtility*) utility;
@end

@implementation ContactSectionController

- (instancetype) init {
    self = [super init];
    return self;
}

+ (contactUtility*) utility {
    __block contactUtility* utility;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        utility = [[contactUtility alloc] init];
    });
    return utility;
}

- (NSInteger) numberOfItems {
    return 1;
}
- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    CGSize viewSize = self.collectionContext.containerSize;
    return CGSizeMake(viewSize.width, 75);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    ContactViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[ContactViewCell class] forSectionController:self atIndex:index];
    cell.iconLabel.text = [NSString stringWithString:self.contact.avatarString];
    cell.color = self.contact.color;
    cell.contactName.text = [NSString stringWithString:self.contact.contactName];
    cell.phoneNumber.text = [NSString stringWithString:self.contact.phoneNumber];
    cell.isSelected = self.contact.isSelected;
    [cell layoutSubviews];
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contact = (ContactModel*)object;
}

- (void) didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%lu",self.contact.index);
    if (self.contact.isSelected) {
        [self.delegate deselectedContactAtIndex:self.contact.index];
        self.contact.isSelected = false;
    } else {
        [self.delegate selectedContactAtIndex:self.contact.index];
        self.contact.isSelected = true;
    }
    [self.collectionContext performBatchAnimated:false updates:^(id<IGListBatchContext> batchContext) {
        [batchContext reloadSectionController:self];
    } completion:nil];
}
@end
