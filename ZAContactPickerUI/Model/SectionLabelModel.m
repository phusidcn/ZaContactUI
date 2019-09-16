//
//  SectionLabelModel.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SectionLabelModel.h"

@implementation SectionLabelModel
- (instancetype) initWithLabel:(NSString *)label {
    self = [super init];
    if (self) {
        self.label = [NSString stringWithString:label];
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
