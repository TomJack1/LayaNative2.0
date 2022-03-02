//
//  CustomButton.m
//  conchRuntime
//
//  Created by tom on 2021/11/15.
//  Copyright © 2021 LayaBox. All rights reserved.
//

#import "CustomButton.h"
#import "conchRuntime.h"
#import "TouchFilter.h"
@implementation CustomButton

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
////    GLKView *view = [conchRuntime GetIOSConchRuntime]->m_pGLKView;
//   return view;
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    conchRuntime * a =[conchRuntime GetIOSConchRuntime];
//    [a touchesBegan:touches withEvent:event];
//}
////-------------------------------------------------------------------------------
//
////-------------------------------------------------------------------------------
////- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
////{
////    //conchRuntime touch
////    [[conchRuntime GetIOSConchRuntime] touchesMoved:touches withEvent:event];
////}
////-------------------------------------------------------------------------------
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    conchRuntime * a =[conchRuntime GetIOSConchRuntime];
//    [a touchesEnded:touches withEvent:event];
//}
- (void)sendTauchWindowWithEvent:(UIEvent *)event{
    conchRuntime * a = [conchRuntime GetIOSConchRuntime];
    IOSTouch kIOSTouch;
    kIOSTouch.m_nType = TOUCH_BEGAIN;
    kIOSTouch.m_nID[0] = 0;
    kIOSTouch.m_nX[0] = 1;
    kIOSTouch.m_nY[0] = self.superview.frame.origin.y-1;
    kIOSTouch.m_nCount = 1;
    a->m_pTouchFilter->onTouchEvent( kIOSTouch, a->m_fRetinaValue,a->m_nGLViewOffset);
    IOSTouch kLastTouch;//要发送的end
    kLastTouch.m_nType = TOUCHE_END;
    kLastTouch.m_nCount = 1;
    kLastTouch.m_nID[0] = 0;
    kLastTouch.m_nX[0] = 1;
    kLastTouch.m_nY[0] = self.superview.frame.origin.y-1;
    a->m_pTouchFilter->onTouchEvent( kLastTouch, a->m_fRetinaValue,a->m_nGLViewOffset);
}
@end
