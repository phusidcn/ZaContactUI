//
//  ViewController.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "../Model/SelectedContacts.h"
#import "../Model/SearchBar.h"
#import "../SectionController/SelectedContactController.h"
#import "../SectionController/SearchContactController.h"
#import "../SectionController/ContactController.h"
#import "../SectionController/SectionLabelController.h"
#import "../Bussiness/ContactBusiness.h"
#import "../Bussiness/ContactWithStatus.h"
#import "../Bussiness/ContactBusiness.h"

@interface ContactViewController : UIViewController <IGListAdapterDataSource, IGListAdapterDelegate>


@end

