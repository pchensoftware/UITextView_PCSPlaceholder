//====================================================================================================
// Author: Peter Chen
// Created: 1/4/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import "MyController.h"
#import "UITextView_PCSPlaceholder.h"

@interface MyController()



@end

@implementation MyController

- (id)init {
   if ((self = [super init])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   
   self.automaticallyAdjustsScrollViewInsets = NO;
   self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
   
   UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 300, 100)];
   textView.font = [UIFont systemFontOfSize:15];
   textView.placeholder = @"PCSPlaceholder :)";
   [textView updatePlaceholderLabel];
   [self.view addSubview:textView];
}

//====================================================================================================
#pragma mark - Events
//====================================================================================================



@end
