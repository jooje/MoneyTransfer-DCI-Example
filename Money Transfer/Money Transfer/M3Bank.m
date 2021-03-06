//
//  M3Bank.m
//  Money Transfer
//
//  Created by Martin Pilkington on 07/05/2012.
//  Copyright (c) 2012 M Cubed Software. All rights reserved.
//

#import "M3Bank.h"
#import "M3SavingsAccount.h"
#import "M3OverdraftAccount.h"
#import "M3ErrorFactory.h"

@implementation M3Bank {
	NSMutableArray *accounts;
}

- (id)init {
	if ((self = [super init])) {
		accounts = [NSMutableArray array];
	}
	return self;
}

- (NSArray *)accounts {
	return [accounts copy];
}

- (void)openAccountWithID:(NSString *)aAccountID type:(M3AccountType)aType {
	NSArray *classes = @[ [M3Account class], [M3OverdraftAccount class], [M3SavingsAccount class] ];
	M3Account *account = [[classes[aType] alloc] initWithAccountID:aAccountID];
	[accounts addObject:account];
}

- (BOOL)closeAccount:(M3Account *)aAccount error:(NSError *__autoreleasing *)aError {
	if (aAccount.balance == 0) {
		[accounts removeObject:aAccount];
		return YES;
	}
	
	*aError = [M3ErrorFactory accountToCloseHasNonEmptyBalanceError];
	return NO;
}

@end
