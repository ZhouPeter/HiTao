//
//  TopSearchBar.m
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/10.
//  Copyright © 2016年 周. All rights reserved.
//

#import "TopSearchBar.h"
#import "MBProgressHUD.h"
#import "SDCycleScrollView.h"
@implementation TopSearchBar

#pragma mark - Initializers
// ------------------------------------------------------------------------------------------
- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.hasCentredPlaceholder = NO;
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Methods
// ------------------------------------------------------------------------------------------
- (void)setHasCentredPlaceholder:(BOOL)hasCentredPlaceholder
{
    _hasCentredPlaceholder = hasCentredPlaceholder;
    
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector])
    {
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&_hasCentredPlaceholder atIndex:2];
        [invocation invoke];
    }
    
}

@end
