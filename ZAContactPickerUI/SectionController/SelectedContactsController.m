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
    return self.contactsModel.contacts.count;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(53, 53);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger)index {
    SelectedViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SelectedViewCell class] forSectionController:self atIndex:index];
    cell.iconLabel.text = [[SelectedContactsController utility] getAvatarOf: [self.contactsModel.contacts objectAtIndex:index]];
    cell.contentView.backgroundColor = [[SelectedContactsController utility] getColorOf:[self.contactsModel.contacts objectAtIndex:index]];
    cell.clipsToBounds = true;
    cell.layer.cornerRadius = 53 / 2;
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contactsModel = (SelectedContactsModel*)object;
}

- (void) didSelectItemAtIndex:(NSInteger)index {
    
}
@end
