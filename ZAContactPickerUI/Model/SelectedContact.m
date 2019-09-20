//
//  SelectedContacts.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedContact.h"

@implementation SelectedContact

- (instancetype) initWithAvatarString:(NSString*) string Color:(UIColor*) color AndIndex:(NSInteger) index{
    self = [super init];
    if (self) {
        self.iconColor = color;
        self.avatarString = [NSString stringWithString:string];
        self.index = index;
    }
    return self;
}

- (instancetype) initWithContact:(contactWithStatus*) contact AndIndex:(NSInteger)index{
    self = [super init];
    if (self) {
        contactUtility* utility = [[contactUtility alloc] init];
        NSString* avatarString = [utility getAvatarOf:contact];
        self.iconColor = [utility getColorOf:contact];
        self.avatarString = [NSString stringWithString:avatarString];
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
