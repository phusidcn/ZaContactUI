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
#import "../Model/ContactModel.h"
#import "../Bussiness/ContactUtility.h"

@protocol ContactDelegate <NSObject>

- (void) selectedContact:(ContactModel* _Nullable)model;
- (void) deselectedContact:(ContactModel* _Nullable)model;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ContactSectionController : IGListSectionController
@property id<ContactDelegate> delegate;
@property ContactModel* contact;
@end

NS_ASSUME_NONNULL_END
