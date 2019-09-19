//
//  SelectedContactController.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "../View/SelectedViewCell.h"
#import "../Model/SelectedContacts.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectedContactSectionController : IGListSectionController
@property SelectedContacts* contact;
@end

NS_ASSUME_NONNULL_END
