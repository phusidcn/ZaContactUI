//
//  SearchContactView.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "../View/SearchViewCell.h"
#import "../Model/SearchBar.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SearchControllerDelegate <NSObject>

- (void) searchContactWithKeyword:(NSString*) keyword;
- (void) cancelSearch;

@end

@interface SearchContactSectionController : IGListSectionController <SearchDelegate>
@property id<SearchControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
