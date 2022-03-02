//
//  CustomTextView.m
//  conchRuntime
//
//  Created by tom on 2022/3/1.
//  Copyright © 2022 LayaBox. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)deleteBackward {
    [super deleteBackward];
    if ([self.keyInputDelegates respondsToSelector:@selector(deleteBackWard:)]) {
        [self.keyInputDelegates deleteBackWard:self];
    }

}
@end
