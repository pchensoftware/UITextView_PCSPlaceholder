//====================================================================================================
// Author: Peter Chen
// Created: 1/4/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import <Foundation/Foundation.h>


@interface UITextView (PCSPlaceholder)

@property (nonatomic, strong) NSString *placeholder;

- (void)updatePlaceholderLabel;

@end
