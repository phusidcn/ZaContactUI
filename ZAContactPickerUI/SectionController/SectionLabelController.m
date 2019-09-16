//
//  SectionLabelController.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SectionLabelController.h"

@implementation SectionLabelController

- (instancetype) init {
    self = [super init];
    return self;
}
- (NSInteger) numberOfItems {
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    CGSize viewSize = self.collectionContext.containerSize;
    return CGSizeMake(viewSize.width, 20);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    SectionLabelViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[SectionLabelViewCell class] forSectionController:self atIndex:index];
    cell.sectionLabel.text = self.sectionModel.label;
    return cell;
}

- (void) didUpdateToObject:(id)object {
    self.sectionModel = (SectionLabelModel*)object;
}
@end
