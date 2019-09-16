//
//  SectionLabelModel.h
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SectionLabelModel : NSObject <IGListDiffable>
@property NSString* label;
- (instancetype) initWithLabel:(NSString*) label;
@end

NS_ASSUME_NONNULL_END
