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
        self.checkedIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconLabel];
        [self.contentView addSubview:self.contactName];
        [self.contentView addSubview:self.phoneNumber];
        [self.contentView addSubview:self.checkedIcon];
    }
    return self;
}

- (void) layoutSubviews {
    CGSize viewSize = self.contentView.bounds.size;
    self.checkedIcon.frame = CGRectMake(0, 0, 30, 30);
    self.checkedIcon.center = CGPointMake(30, viewSize.height / 2);
    [self checkBoxSet];
    
    self.iconLabel.frame = CGRectMake(0, 0, 65, 65);
    self.iconLabel.center = CGPointMake(90, viewSize.height / 2);
    self.iconLabel.textAlignment = NSTextAlignmentCenter;
    self.iconLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightSemibold];
    self.iconLabel.clipsToBounds = true;
    self.iconLabel.layer.cornerRadius = 65 / 2;
    self.iconLabel.textColor = [UIColor whiteColor];
    self.iconLabel.backgroundColor = self.color;
    
    self.contactName.frame = CGRectMake(150, 10, viewSize.width - 100, viewSize.height / 3);
    self.contactName.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    
    self.phoneNumber.frame = CGRectMake(150, viewSize.height / 3 + 20, viewSize.width - 100, viewSize.height / 5);
    self.phoneNumber.font = [UIFont systemFontOfSize:15];
}

- (void) checkBoxSet {
    if (self.isSelected) {
        self.checkedIcon.image = [UIImage imageNamed:@"checked-checkbox-50"];
    } else {
        self.checkedIcon.image = [UIImage imageNamed:@"unchecked-checkbox-50"];
    }
}
@end
