//
//  SelectedContactsController.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/20/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
#import "../Model/SelectedContactsModel.h"
#import "../View/SelectedViewCell.h"
#import "../Bussiness/ContactUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectedContactsController : IGListSectionController
@property SelectedContactsModel* contactsModel;
@end

NS_ASSUME_NONNULL_END
