//
//  M3MainWindowController.h
//  Money Transfer
//
//  Created by Martin Pilkington on 07/05/2012.
//  Copyright (c) 2012 M Cubed Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M3Account.h"

@protocol M3MainWindowControllerDelegate;
@interface M3MainWindowController : NSWindowController <NSTableViewDelegate>

@property (weak) id <M3MainWindowControllerDelegate>delegate;
@property (copy) NSArray *accounts;
@property (readonly) M3Account *selectedAccount;

- (void)presentError:(NSError *)aError;

//UI

@property (weak) IBOutlet NSTableView *accountsTable;
- (IBAction)showOpenAccountSheet:(id)sender;
- (IBAction)closeAccount:(id)sender;

@property (strong) IBOutlet NSWindow *openAccountSheet;
@property (weak) IBOutlet NSTextField *accountIDField;
- (IBAction)openAccount:(id)sender;
- (IBAction)cancelOpenAccount:(id)sender;

@property (weak) IBOutlet NSTextField *accountBalanceField;

@property (weak) IBOutlet NSTextField *depositAmountField;
- (IBAction)deposit:(id)sender;

@property (weak) IBOutlet NSTextField *withdrawAmountField;
- (IBAction)withdraw:(id)sender;

@end


@protocol M3MainWindowControllerDelegate <NSObject>

@required
- (void)controller:(M3MainWindowController *)aController openAccountWithID:(NSString *)aAccountID;
- (void)controller:(M3MainWindowController *)aController closeAccount:(M3Account *)aAccount;
- (void)controller:(M3MainWindowController *)aController depositAmount:(NSUInteger)aAmount intoAccount:(M3Account *)aAccount;
- (void)controller:(M3MainWindowController *)aController withdrawAmount:(NSUInteger)aAmount fromAccount:(M3Account *)aAccount;

@end