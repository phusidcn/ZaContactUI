//
//  ContactModel.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel
- (instancetype) initWithContact:(contactWithStatus *)contact AndIndex:(NSInteger)index{
    self = [super init];
    if (self) {
        contactUtility* utility = [[contactUtility alloc] init];
        self.avatarString = [utility getAvatarOf:contact];
        self.contactName = [utility getContactFullNameOf:contact];
        self.phoneNumber = [utility getPhoneNumberOf:contact];
        self.color = [utility getColorOf:contact];
        self.isSelected = contact.isSelected;
        self.index = index;
    }
    return self;
}



- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
