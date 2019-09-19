//
//  ContactViewCell.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Bussiness/ContactUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactViewCell : UICollectionViewCell
@property UILabel* iconLabel;
@property UILabel* contactName;
@property UILabel* phoneNumber;
@property UIColor* color;
@property BOOL isSelected;
@property UIImageView* checkedIcon;
@property UIImage* checkedImage;
@property UIImage* uncheckedImage;
@end

NS_ASSUME_NONNULL_END
