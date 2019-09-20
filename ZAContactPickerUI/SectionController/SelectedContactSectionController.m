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

- (instancetype) init {
    self = [super init];
    return self;
}

- (NSInteger) numberOfItems {
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(53, 53);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    SelectedViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SelectedViewCell class] forSectionController:self atIndex:index];
    cell.iconLabel.text = self.contact.avatarString;
    cell.contentView.backgroundColor = self.contact.iconColor;
    cell.clipsToBounds = true;
    cell.layer.cornerRadius = cell.frame.size.height / 2;
    [cell layoutSubviews];
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.contact = (SelectedContact*)object;
    [self.collectionContext performBatchAnimated:true updates:^(id<IGListBatchContext> batchContext) {
        [batchContext reloadSectionController:self];
    } completion:nil];
}
@end
