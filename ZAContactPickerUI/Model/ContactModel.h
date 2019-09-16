//
//  ContactModel.h
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
#import <UIKit/UIKit.h>
#import "../Bussiness/ContactWithStatus.h"
#import "../Bussiness/ContactUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactModel : NSObject <IGListDiffable>
@property NSDictionary* displayAllContacts;
@property NSMutableArray* contacts;
@property NSArray* headers;
@property NSArray<contactWithStatus*>* displaySearchContacts;
@property NSArray<contactWithStatus*>* displaySelectedContacts;
- (instancetype) initWithDictionary:(NSDictionary*) contacts;
- (NSInteger) numberOfContacts;
- (contactWithStatus*) contactAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
