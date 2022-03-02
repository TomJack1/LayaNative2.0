//
//  KeyInputDelegate.h
//  conchRuntime
//
//  Created by tom on 2022/3/1.
//  Copyright © 2022 LayaBox. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KeyInputDelegate <NSObject>
@optional
- (void)deleteBackWard:(UITextView *)txt;

@end

NS_ASSUME_NONNULL_END
