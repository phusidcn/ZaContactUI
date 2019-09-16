//
//  SearchViewCell.h
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SearchDelegate <NSObject>
- (void) searchContactWithKeyword:(NSString*) keyword;
- (void) cancelSearch;
@end

@interface SearchViewCell : UICollectionViewCell <UISearchBarDelegate>
@property UISearchBar* searchbar;
@property id<SearchDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
