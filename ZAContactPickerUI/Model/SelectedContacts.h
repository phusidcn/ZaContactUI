//
//  SelectedContacts.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
#import "../DataAccess/MutableContactList.h"
#import <UIKit/UIKit.h>
#import "../Bussiness/ContactUtility.h"
#import "../Bussiness/ContactWithStatus.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectedContacts : NSObject <IGListDiffable>
@property UIColor* iconColor;
@property NSString* avatarString;
- (instancetype) initWithAvatarString:(NSString*) string AndColor:(UIColor*) color;
- (instancetype) initWithContact:(contactWithStatus*) contact;
@end

NS_ASSUME_NONNULL_END
