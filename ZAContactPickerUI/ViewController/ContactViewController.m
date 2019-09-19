//
//  ViewController.m
//  ZAContactPickerUI
//
//  Created by CPU11899 on 9/13/19.
//  Copyright © 2019 CPU11899. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()
@property UICollectionView* collectionView;
@property UICollectionView* selectedView;
@property UISearchBar* searchBar;


@property IGListAdapter* adapterForContacts;
@property IGListAdapter* adapterForSelected;
@property MutableContactList* contactList;
@property ContactBussiness* businessInterface;
@property contactUtility* utility;
@property NSDictionary* displayAllContacts;
@property NSArray<contactWithStatus*>* displaySearchContacts;
@property NSArray<contactWithStatus*>* displaySelectedContacts;
@property BOOL isSearching;
@property BOOL isIntitialized;
@property CGFloat heightOfSelectedContacts;

@property NSMutableArray<id<IGListDiffable>>* modelArray;
@property NSMutableArray<id<IGListDiffable>>* selectedArray;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 53 + 44, self.view.bounds.size.width, self.view.bounds.size.height - 53 - 44) collectionViewLayout:[UICollectionViewFlowLayout new]];
    self.searchBar = [[UISearchBar alloc] init];
    self.selectedView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 53) collectionViewLayout:[UICollectionViewFlowLayout new]];
    
    IGListAdapterUpdater* adapterViewContacts = [[IGListAdapterUpdater alloc] init];
    self.adapterForContacts = [[IGListAdapter alloc] initWithUpdater:adapterViewContacts viewController:self workingRangeSize:0];
    
    IGListAdapterUpdater* adapterSelectedContacts = [[IGListAdapterUpdater alloc] init];
    self.adapterForSelected = [[IGListAdapter alloc] initWithUpdater:adapterSelectedContacts viewController:self workingRangeSize:0];
    
    self.businessInterface = [[ContactBussiness alloc] init];
    self.utility = [[contactUtility alloc] init];
    self.isSearching = false;
    self.isIntitialized = false;
    self.modelArray = [[NSMutableArray alloc] init];
    [[self businessInterface] getAllContacInDeviceWithCompletionHandler:^(BOOL canGet) {
        if (canGet) {
            [[self businessInterface] groupContactToSectionWithCompletion:^{
                self.displayAllContacts = self.businessInterface.dictionary;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.adapterForContacts performUpdatesAnimated:true completion:^(BOOL complete) {
                        NSLog(@"Get contact Complete");
                    }];
                });
            }];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self alertCantAccessContact];
            });
        }
    }];
    self.adapterForContacts.collectionView = self.collectionView;
    self.adapterForContacts.dataSource = self;
    
    self.adapterForSelected.collectionView = self.selectedView;
    self.adapterForSelected.dataSource = self;
    [self loadViews];
}

- (void) loadViews {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.selectedView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.selectedView];
    [self.view addSubview:self.collectionView];
}
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect navigationSize = self.navigationController.navigationBar.frame;
    self.selectedView.frame = CGRectMake(0, navigationSize.size.height, self.view.bounds.size.width, 100);
    self.searchBar.frame = CGRectMake(0, navigationSize.size.height + 100, self.view.bounds.size.width, 44);
    self.collectionView.frame = CGRectMake(0, navigationSize.size.height + 100 + 44, self.view.bounds.size.width, self.view.bounds.size.height - 100 - 44);
}

#pragma mark : - IGListKit DataSource
- (NSArray<id<IGListDiffable>>*) objectsForListAdapter:(IGListAdapter *)listAdapter {
    if (listAdapter == self.adapterForContacts) {
        NSArray* headers = [[self.displayAllContacts allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        for (NSString* key in headers) {
            NSMutableArray* array = [self.displayAllContacts objectForKey:key];
            [self.modelArray addObject:[[SectionLabelModel alloc] initWithLabel:key]];
            for (contactWithStatus* contact in array) {
                [self.modelArray addObject:[[ContactModel alloc] initWithContact:contact]];
            }
        }
    } else {
        if (listAdapter == self.adapterForSelected) {
            //[self.selectedArray addObject:[[SelectedContacts alloc] initWithContact:<#(nonnull contactWithStatus *)#>]]
        }
    }
    
    return self.modelArray;
}

- (IGListSectionController*) listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[SelectedContacts class]]) {
        return [SelectedContactSectionController new];
    }
    if ([object isKindOfClass:[SearchBar class]]) {
        SearchContactSectionController* searchController = [[SearchContactSectionController alloc] init];
        searchController.delegate = self;
        return searchController;
    }
    if ([object isKindOfClass:[ContactModel class]]) {
        return [ContactSectionController new];
    }
    if ([object isKindOfClass:[SectionLabelModel class]]) {
        return [SectionLabelController new];
    }
    return nil;
}

- (UIView*) emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void) alertCantAccessContact {
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Access denied" message:@"This application can't access to your contact" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertViewController addAction:cancel];
    [self presentViewController:alertViewController animated:true completion:nil];
}

#pragma mark : - Search behavior
- (void) searchContactWithKeyword:(NSString *)keyword {
    if (keyword.length == 0) {
        self.isSearching = false;
        [self.businessInterface cancelSearch];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.adapterForContacts performUpdatesAnimated:true completion:^(BOOL complete) {
                NSLog(@"Complete");
            }];
        });
    } else {
        self.isSearching = true;
        [self.businessInterface searchContactWithKey:keyword completion:^(NSError* error) {
            if (!error) {
                [self.businessInterface getSearchedContactWithCompletionHandler:^(NSArray<contactWithStatus*>* result) {
                    self.displaySearchContacts = result;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.adapterForContacts performUpdatesAnimated:true completion:^(BOOL complete) {
                            NSLog(@"Search complete");
                        }];
                    });
                }];
            }
        }];
    }
}

- (void) cancelSearch {
    self.isSearching = false;
}
@end
