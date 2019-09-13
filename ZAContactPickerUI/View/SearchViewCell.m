//
//  SearchViewCell.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "SearchViewCell.h"

@implementation SearchViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.searchbar = [[UISearchBar alloc] init];
        [self.contentView addSubview:self.searchbar];
    }
    return self;
}

- (void) layoutSubviews {
    self.searchbar.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 44);
}
@end
