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
@protocol SelectedContactDelegate <NSObject>

- (void) actionForSelectedContact:(contactWithStatus*) contact;

@end

@interface SelectedContactsController : IGListSectionController
@property id<SelectedContactDelegate> delegate;
@property SelectedContactsModel* contactsModel;
@property contactUtility* utility;
@end

NS_ASSUME_NONNULL_END
