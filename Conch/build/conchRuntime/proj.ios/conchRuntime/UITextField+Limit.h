//
//  UITextField+Limit.h
//  conchRuntime
//
//  Created by tom on 2021/9/23.
//  Copyright © 2021 LayaBox. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef BOOL(^BNConditionBlock)(NSString* inputStr);

@interface UITextField (Limit)

- (void)limitNums:(NSInteger)num action:(void(^)(void))action;

- (void)limitCondition:(BNConditionBlock)condition action:(void (^)(void))action;

- (void)observeValueWithCondition:(BNConditionBlock)condition action:(void(^)(void))action;

- (void)setPlaceholder:(NSString *)placeholder color:(UIColor*)color font:(UIFont*)font;

@end

@interface UITextView (Limit)

- (void)limitNums:(NSInteger)num action:(void(^)(void))action;

- (void)limitCondition:(BNConditionBlock)condition action:(void (^)(void))action;

- (void)observeValueWithCondition:(BNConditionBlock)condition action:(void(^)(void))action;

//- (void)setPlaceholder:(NSString *)placeholder color:(UIColor*)color font:(UIFont*)font;

@end

NS_ASSUME_NONNULL_END
