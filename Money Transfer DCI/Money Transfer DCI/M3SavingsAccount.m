//
//  M3SavingsAccount.m
//  Money Transfer
//
//  Created by Martin Pilkington on 08/05/2012.
//  Copyright (c) 2012 M Cubed Software. All rights reserved.
//

#import "M3SavingsAccount.h"

@implementation M3SavingsAccount

- (NSString *)description {
	NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
	[currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	return [NSString stringWithFormat:@"Savings %@ (%@)", self.accountID, [currencyFormatter stringForObjectValue:[NSNumber numberWithInteger:self.balance]]];
}

@end
