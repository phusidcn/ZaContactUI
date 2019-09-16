//
//  ViewController.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import <Foundation/Foundation.h>
#import "../Model/SelectedContacts.h"
#import "../Model/SearchBar.h"
#import "../SectionController/SelectedContactSectionController.h"
#import "../SectionController/SearchContactSectionController.h"
#import "../SectionController/ContactSectionController.h"
#import "../SectionController/SectionLabelController.h"
#import "../Bussiness/ContactBusiness.h"
#import "../Bussiness/ContactWithStatus.h"
#import "../Bussiness/ContactUtility.h"
#import "../Model/ContactModel.h"
#import "../Model/SectionLabelModel.h"
#import "../Model/SelectedContacts.h"
#import "../Model/SearchBar.h"

@interface ContactViewController : UIViewController <IGListAdapterDataSource, IGListAdapterDelegate, SearchControllerDelegate>


@end

