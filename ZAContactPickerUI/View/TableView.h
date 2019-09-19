//
//  TableView.h
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/16/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "../Bussiness/ContactUtility.h"
#import "../Model/ContactModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableView : UICollectionViewCell <UITableViewDelegate, UITableViewDataSource>
@property UITableView* tableView;
@property contactUtility* utility;
@property ContactModel* model;
@property BOOL isSearching;
@end

NS_ASSUME_NONNULL_END
