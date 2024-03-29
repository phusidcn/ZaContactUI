//
//  SectionLabelController.h
//  ZAContactPickerUI
//
//  Created by Huynh Lam Phu Si on 9/15/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
#import "../View/SectionLabelViewCell.h"
#import "../Model/SectionLabelModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SectionLabelController : IGListSectionController
@property SectionLabelModel* sectionModel;
@end

NS_ASSUME_NONNULL_END
