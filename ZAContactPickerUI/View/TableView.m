//
//  TableView.m
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/16/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "TableView.h"

@implementation TableView
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void) layoutSubviews {
    //CGSize viewSize = self.contentView.bounds.size;
    self.tableView.frame = self.contentView.bounds;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell* cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    cell.iconLabel.text = [self.utility getAvatarOf:[self.contacts contactAtIndex:index]];
    cell.contactName.text = [self.utility getContactFullNameOf:[self.contacts contactAtIndex:index]];
    cell.phoneNumber.text = [self.utility getPhoneNumberOf:[self.contacts contactAtIndex:index]];
    cell.color = [self.utility getColorOf:[self.contacts contactAtIndex:index]];
    return cell;
}
@end
