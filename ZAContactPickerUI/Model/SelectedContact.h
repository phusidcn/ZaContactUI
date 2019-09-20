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

@interface SelectedContact : NSObject <IGListDiffable>
@property UIColor* iconColor;
@property NSString* avatarString;
@property NSInteger index;
- (instancetype) initWithContact:(contactWithStatus*) contact AndIndex:(NSInteger)index;
- (instancetype) initWithAvatarString:(NSString*) string Color:(UIColor*) color
                             AndIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
