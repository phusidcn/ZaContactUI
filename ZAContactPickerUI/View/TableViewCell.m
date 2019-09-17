//
//  TableViewCell.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/16/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
