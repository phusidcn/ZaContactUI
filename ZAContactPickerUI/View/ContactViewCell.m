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
    self.iconLabel.frame = CGRectMake(20, 5, 65, 65);
    self.iconLabel.textAlignment = NSTextAlignmentCenter;
    self.iconLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightSemibold];
    self.iconLabel.clipsToBounds = true;
    self.iconLabel.layer.cornerRadius = 65 / 2;
    
    self.contactName.frame = CGRectMake(110, 10, viewSize.width - 100, viewSize.height / 3);
    self.contactName.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    
    self.phoneNumber.frame = CGRectMake(110, viewSize.height / 3 + 20, viewSize.width - 100, viewSize.height / 5);
    self.phoneNumber.font = [UIFont systemFontOfSize:15];
    self.iconLabel.backgroundColor = self.color;
}
@end
