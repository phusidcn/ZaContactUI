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
    self.selectedArray = [[NSMutableArray alloc] init];
    self.displaySelectedContacts = [[NSArray alloc] init];
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
    
    self.searchBar.delegate = self;
    
    self.adapterForSelected.collectionView = self.selectedView;
    self.adapterForSelected.dataSource = self;
    [self loadViews];
}

- (void) loadViews {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.selectedView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.selectedView];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.collectionView];
}
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect navigationRect = self.navigationController.navigationBar.frame;
    CGFloat contentY = navigationRect.size.height + navigationRect.origin.y;
    self.selectedView.frame = CGRectMake(0, contentY, self.view.bounds.size.width, 53);
    self.searchBar.frame = CGRectMake(0, contentY + 53, self.view.bounds.size.width, 44);
    self.collectionView.frame = CGRectMake(0, contentY + 53 + 44, self.view.bounds.size.width, self.view.bounds.size.height - contentY - 53 - 44);
}

#pragma mark : - IGListKit DataSource
- (NSArray<id<IGListDiffable>>*) objectsForListAdapter:(IGListAdapter *)listAdapter {
    if (listAdapter == self.adapterForContacts) {
        if (!self.isSearching) {
            [self.modelArray removeAllObjects];
            for (NSString* header in self.businessInterface.titleForSection) {
                [self.modelArray addObject:[[SectionLabelModel alloc] initWithLabel:header]];
                NSArray* array = [self.displayAllContacts objectForKey:header];
                for (contactWithStatus* contact in array) {
                    [self.modelArray addObject:[[ContactModel alloc] initWithContact:contact AndIndex:contact.index]];
                }
            }
        }
        return self.modelArray;
    } else {
        if (listAdapter == self.adapterForSelected) {
            return self.selectedArray;
        }
    }
    return nil;
}

- (IGListSectionController*) listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if (listAdapter == self.adapterForSelected) {
        if ([object isKindOfClass:[SelectedContactsModel class]]) {
            SelectedContactsController* controller = [SelectedContactsController new];
            return controller;
        }
    }
    if (listAdapter == self.adapterForContacts) {
        if ([object isKindOfClass:[ContactModel class]]) {
            ContactSectionController* controller = [ContactSectionController new];
            controller.delegate = self;
            return controller;
        }
        if ([object isKindOfClass:[SectionLabelModel class]]) {
            return [SectionLabelController new];
        }
    }
    return nil;
}

- (UIView*) emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark : - Contacts Delegate
- (void) selectedContact:(ContactModel*)contact {
    [self.businessInterface selectOneContactAtIndex:contact.index completion:^(NSError* error) {
        [self.businessInterface getSelectedContactWithCompletionHandler:^(NSArray<contactWithStatus*>* result) {
            [self.selectedArray removeAllObjects];
            /*
            for (contactWithStatus* contact in result) {
                [self.selectedArray addObject:[[SelectedContact alloc] initWithContact:contact AndIndex:contact.index]];
            }*/
            [self.selectedArray addObject:[[SelectedContactsModel alloc] initWithContacts:result]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.adapterForSelected performUpdatesAnimated:false completion:nil];
            });
        }];
    }];
}

- (void) deselectedContact:(ContactModel*)contact  {
    [self.businessInterface deselectContactAtIndex:contact.index completion:^(NSError* error) {
        [self.businessInterface getSelectedContactWithCompletionHandler:^(NSArray<contactWithStatus*>* result) {
            [self.selectedArray removeAllObjects];
            /*
            for (contactWithStatus* contact in result) {
                [self.selectedArray addObject:[[SelectedContact alloc] initWithContact:contact AndIndex:contact.index]];
            }*/
            [self.selectedArray addObject:[[SelectedContactsModel alloc] initWithContacts:result]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.adapterForSelected performUpdatesAnimated:false completion:nil];
            });
        }];
    }];
}

- (void) collapseSelectedBar {
    dispatch_async(dispatch_get_main_queue(), ^{
        //self.selectedView.frame.size.height = 0.0;
    });
}

- (void) showSelectedBar {
    dispatch_async(dispatch_get_main_queue(), ^{
        //self.selectedView.frame.size.height = 53;
    });
}
#pragma mark : - Search Delegate
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        self.isSearching = false;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.adapterForContacts performUpdatesAnimated:true completion:nil];
        });
    } else {
        self.isSearching = true;
        [self.modelArray removeAllObjects];
        [self.businessInterface searchContactWithKey:searchText completion:^(NSError* error) {
            [self.businessInterface getSearchedContactWithCompletionHandler:^(NSArray<contactWithStatus*>* result) {
                for (contactWithStatus* contact in result) {
                    [self.modelArray addObject:[[ContactModel alloc] initWithContact:contact AndIndex:contact.index]];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.adapterForContacts performUpdatesAnimated:true completion:nil];
                });
            }];
        }];
    }
}

#pragma mark : - alert message
- (void) alertCantAccessContact {
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Access denied" message:@"This application can't access to your contact" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertViewController addAction:cancel];
    [self presentViewController:alertViewController animated:true completion:nil];
}
@end
