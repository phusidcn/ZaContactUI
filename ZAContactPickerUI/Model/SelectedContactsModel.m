//
//  SelectedContactsModel.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/20/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedContactsModel.h"

@interface SelectedContactsModel ()

@end

@implementation SelectedContactsModel

- (instancetype) initWithContacts:(NSArray<contactWithStatus*>*) contacts {
    self = [super init];
    if (self) {
        self.contacts = [[NSArray alloc] initWithArray:contacts];
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
