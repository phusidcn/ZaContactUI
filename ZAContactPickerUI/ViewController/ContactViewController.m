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
@property IGListAdapter* adapter;
@property MutableContactList* contactList;
@property ContactBussiness* businessInterface;
@property contactUtility* utility;
@property NSDictionary* displayAllContacts;
@property NSArray<contactWithStatus*>* displaySearchContacts;
@property NSArray<contactWithStatus*>* displaySelectedContacts;
@property BOOL isSearching;
@property BOOL isIntitialized;

@property NSMutableArray<id<IGListDiffable>>* modelArray;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
    self.searchBar = [[UISearchBar alloc] init];
    IGListAdapterUpdater* adapterUpdate = [[IGListAdapterUpdater alloc] init];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:adapterUpdate viewController:self workingRangeSize:0];
    self.businessInterface = [[ContactBussiness alloc] init];
    self.utility = [[contactUtility alloc] init];
    self.isSearching = false;
    self.isIntitialized = false;
    self.modelArray = [[NSMutableArray alloc] init];
    [[self businessInterface] getAllContacInDevicetWithCompletionHandler:^(BOOL canGet) {
        if (canGet) {
            [[self businessInterface] groupContactToSectionWithCompletion:^{
                self.displayAllContacts = self.businessInterface.dictionary;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.adapter performUpdatesAnimated:true completion:^(BOOL complete) {
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
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    [self loadViews];
}

- (void) loadViews {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark : - IGListKit DataSource
- (NSArray<id<IGListDiffable>>*) objectsForListAdapter:(IGListAdapter *)listAdapter {
    if (!self.isIntitialized) {
        [self.modelArray addObject:[[SelectedContacts alloc] init]];
        [self.modelArray addObject:[[SearchBar alloc] init]];
    }
    [self.modelArray addObject:[[ContactModel alloc] initWithDictionary:self.displayAllContacts]];
    self.isIntitialized = true;
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
            [self.adapter performUpdatesAnimated:true completion:^(BOOL complete) {
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
                        [self.adapter performUpdatesAnimated:true completion:^(BOOL complete) {
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
    [self.adapter performUpdatesAnimated:true completion:^(BOOL complete) {
        NSLog(@"Update complete");
    }];
}
@end
