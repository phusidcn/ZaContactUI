//
//  SelectedViewCell.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SelectedViewCell.h"

@implementation SelectedViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.iconLabel = [[UILabel alloc] init];
        [[self contentView] addSubview:self.iconLabel];
    }
    return self;
}

- (void) layoutSubviews {
    self.iconLabel.frame = CGRectMake(0, 0, 53, 33);
    self.iconLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightSemibold];
    self.iconLabel.center = CGPointMake(self.contentView.bounds.size.width / 2, self.contentView.bounds.size.height / 2);
    self.layer.cornerRadius = 53 / 2;
}
@end
