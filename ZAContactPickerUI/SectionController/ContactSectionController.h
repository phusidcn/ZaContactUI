//
//  ContactView.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "../View/ContactViewCell.h"
#import "../View/TableView.h"
#import "../Model/ContactModel.h"
#import "../Bussiness/ContactUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactSectionController : IGListSectionController 
@property ContactModel* contacts;
@end

NS_ASSUME_NONNULL_END
