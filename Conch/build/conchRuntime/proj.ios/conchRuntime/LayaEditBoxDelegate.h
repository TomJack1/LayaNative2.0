/**
 @file			LayaEditBoxDelegate.h
 @brief         LayaEditBoxDelegate类
 @author		wyw
 @version		1.0
 @date			2012_12_17
 @company       JoyChina
 */
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "KeyInputDelegate.h"

@interface LayaEditBoxDelegate  : NSObject <UITextViewDelegate,UITextFieldDelegate,KeyInputDelegate>
{
@public
    float   m_fRetinaValue;
    int     m_nEditBoxPosY;
    UIDeviceOrientation  m_orient;
    UIDeviceOrientation  m_lastOrient;
}
-(void) setRetinaValue:(float)fRetina;
-(void)keyboardWasShown:(NSNotification*)aNotification;
-(void)keyboardWasShownEnd:(NSNotification*)aNotification;
-(void)orientChange:(NSNotification *)aNotification;
-(void)postToC;
@end
