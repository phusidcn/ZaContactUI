//
//  SectionLabelController.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SectionLabelController.h"

@implementation SectionLabelController
- (NSInteger) numberOfItems {
    return 1;
}

- (CGSize) sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(100, 10);
}

- (UICollectionViewCell*) cellForItemAtIndex:(NSInteger) index {
    SectionLabelController* cell = [[self collectionContext] dequeueReusableCellOfClass:[SectionLabelController class] forSectionController:self atIndex:index];
    return cell;
}
@end
