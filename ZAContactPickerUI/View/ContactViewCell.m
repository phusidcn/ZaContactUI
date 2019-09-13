//
//  ContactViewCell.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactViewCell.h"

@implementation ContactViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.iconLabel = [[UILabel alloc] init];
        self.contactName = [[UILabel alloc] init];
        self.phoneNumber = [[UILabel alloc] init];
        [self.contentView addSubview:self.iconLabel];
        [self.contentView addSubview:self.contactName];
        [self.contentView addSubview:self.phoneNumber];
    }
    return self;
}

- (void) layoutSubviews {
    CGSize viewSize = self.contentView.bounds.size;
    self.iconLabel.frame = CGRectMake(0, 0, 75, 75);
    self.contactName.frame = CGRectMake(100, 0, viewSize.width - 100, viewSize.height / 3);
    self.phoneNumber.frame = CGRectMake(100, viewSize.height / 3 + 20, viewSize.width - 100, viewSize.height / 5);
}
@end
