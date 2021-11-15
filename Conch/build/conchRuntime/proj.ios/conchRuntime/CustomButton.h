//
//  CustomButton.h
//  conchRuntime
//
//  Created by tom on 2021/11/15.
//  Copyright © 2021 LayaBox. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomButton : UIButton
- (void)sendTauchWindowWithEvent:(UIEvent *)event;
@end

NS_ASSUME_NONNULL_END
