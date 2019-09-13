//
//  ContactView.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactController.h"

@interface ContactController ()
@property NSMutableArray* contacts;
@end

@implementation ContactController

- (NSInteger) numberOfItems {
    return 1;
}

- (UICollectionViewCell*) cellForRowAt:(NSInteger) index {
    ContactViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:[ContactViewCell class] forSectionController:self atIndex:index];
    return cell;
}
@end
