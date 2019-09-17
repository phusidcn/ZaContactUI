//
//  TableViewCell.h
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/16/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property UILabel* iconLabel;
@property UILabel* contactName;
@property UILabel* phoneNumber;
@property UIColor* color;
@end

NS_ASSUME_NONNULL_END
