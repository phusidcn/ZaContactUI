//
//  SectionLabelViewCell.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SectionLabelViewCell.h"

@implementation SectionLabelViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.sectionLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.sectionLabel];
    }
    return self;
}

- (void) layoutSubviews {
    self.sectionLabel.frame = CGRectMake(10, 0, 20, 20);
    self.backgroundColor = [UIColor lightGrayColor];
}
@end
