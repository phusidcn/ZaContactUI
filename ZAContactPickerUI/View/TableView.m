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
        self.utility = [[contactUtility alloc] init];
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.contentView addSubview:self.tableView];
    }
    return self;
}

- (void) layoutSubviews {
    //CGSize viewSize = self.contentView.bounds.size;
    self.tableView.frame = self.contentView.bounds;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.model.isSearching) {
        return 1;
    } else {
        return [self.model numberOfHeader];
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.model.isSearching) {
        return self.model.displaySearchContacts.count;
    } else {
        NSString* sectionTitle = [NSString stringWithString:[self.model headerTitleForSection:section]];
        return [[self.model.displayAllContacts objectForKey:sectionTitle] count];
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell* cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    if (!self.model.isSearching) {
        NSString* sectionTitle = [NSString stringWithString:[self.model headerTitleForSection:indexPath.section]];
        NSArray* sectionContact = [self.model.displayAllContacts objectForKey:sectionTitle];
        contactWithStatus *contact = [sectionContact objectAtIndex:indexPath.row];
        cell.iconLabel.text = [self.utility getAvatarOf:contact];
        cell.contactName.text = [self.utility getContactFullNameOf:contact];
        cell.phoneNumber.text = [self.utility getPhoneNumberOf:contact];
        cell.color = [self.utility getColorOf:contact];
        return cell;
    } else {
        contactWithStatus* contact = [self.model.displaySearchContacts objectAtIndex:indexPath.row];
        cell.iconLabel.text = [self.utility getAvatarOf:contact];
        cell.contactName.text = [self.utility getContactFullNameOf:contact];
        cell.phoneNumber.text = [self.utility getPhoneNumberOf:contact];
        cell.color = [self.utility getColorOf:contact];
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}
@end
