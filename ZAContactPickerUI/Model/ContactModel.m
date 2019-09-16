//
//  ContactModel.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel
- (instancetype) initWithDictionary:(NSDictionary*) contacts {
    self = [super init];
    if (self) {
        self.contacts = [NSMutableArray array];
        self.displayAllContacts = [NSDictionary dictionaryWithDictionary:contacts];
        self.headers = [[self.displayAllContacts allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        for (NSString* key in self.headers) {
            NSMutableArray* array = [self.displayAllContacts objectForKey:key];
            for (contactWithStatus* contact in array) {
                [self.contacts addObject:contact];
            }
        }
        //self.contacts = [self.displayAllContacts objectsForKeys:self.headers notFoundMarker:[NSNull null]];
    }
    return self;
}

- (NSInteger) numberOfContacts {
    return self.contacts.count;
}

- (contactWithStatus*) contactAtIndex:(NSInteger)index {
    return [self.contacts objectAtIndex:index];
}

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
