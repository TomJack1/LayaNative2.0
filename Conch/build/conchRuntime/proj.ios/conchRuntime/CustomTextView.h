//
//  CustomTextView.h
//  conchRuntime
//
//  Created by tom on 2022/3/1.
//  Copyright © 2022 LayaBox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyInputDelegate.h"
NS_ASSUME_NONNULL_BEGIN
@interface CustomTextView : UITextView
@property (nonatomic,weak) id<KeyInputDelegate>keyInputDelegates;
@end

NS_ASSUME_NONNULL_END
