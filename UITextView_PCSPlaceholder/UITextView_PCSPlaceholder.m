//====================================================================================================
// Author: Peter Chen
// Created: 1/4/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import "UITextView_PCSPlaceholder.h"
#import <objc/runtime.h>

#define kUITextViewPCSPlaceholderLabelKey @"kUITextViewPCSPlaceholderLabelKey"
#define kUITextViewPCSPlaceholderKey @"kUITextViewPCSPlaceholderKey"

@implementation UITextView (PCSPlaceholder)

- (UILabel *)placeholderLabel {
   return objc_getAssociatedObject(self, kUITextViewPCSPlaceholderLabelKey);
}

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
   objc_setAssociatedObject(self, kUITextViewPCSPlaceholderLabelKey, placeholderLabel, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)placeholder {
   return objc_getAssociatedObject(self, kUITextViewPCSPlaceholderKey);
}

- (void)setPlaceholder:(NSString *)placeholder {
   UILabel *placeholderLabel = [self placeholderLabel];
   if (! placeholderLabel) {
      placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.textContainerInset.top, self.frame.size.width - 2 * 5, 20)];
      placeholderLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
      placeholderLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
      [self addSubview:placeholderLabel];
      
      [self setPlaceholderLabel:placeholderLabel];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textDidChange) name:UITextViewTextDidChangeNotification object:self];
   }
   
   placeholderLabel.text = placeholder;
   [self updatePlaceholderLabel];
}

- (void)_textDidChange {
   [self updatePlaceholderLabel];
}

- (void)updatePlaceholderLabel {
   if ([self.text length] > 0) {
      [self placeholderLabel].hidden = YES;
   }
   else {
      if (self.font)
         [self placeholderLabel].font = self.font;
      else
         [self placeholderLabel].font = [UIFont systemFontOfSize:13];
      
      CGRect frame = [self placeholderLabel].frame;
      frame.origin.x = self.textContainerInset.left + 5;
      frame.origin.y = self.textContainerInset.top;
      frame.size.height = [self placeholderLabel].font.lineHeight;
      [self placeholderLabel].frame = frame;
      
      [self placeholderLabel].hidden = NO;
   }
}

@end
