//
//  SelectedContactsModel.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/20/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
#import "../Bussiness/ContactWithStatus.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectedContactsModel : NSObject <IGListDiffable>
@property NSArray<contactWithStatus*>* contacts;
- (instancetype) initWithContacts:(NSArray<contactWithStatus*>*) contacts;
@end

NS_ASSUME_NONNULL_END
