/**
 @file			UIEditBox.h
 @brief         editBox类 继承 uitextField
 @author		wyw
 @version		1.0
 @date			2012_12_17
 @company       JoyChina
 */
#import "UIKit/UIKit.h"
#import "LayaEditBoxDelegate.h"
#import "CustomButton.h"
#import "CustomTextView.h"
#import "CustomTextField.h"
@interface UIEditBox  : UIView
{
    bool                    m_bNumberOnly;
    bool                    m_bForbidEdit;
    bool                    m_bIsMultiAble;
    int                     m_nMaxLength;
    NSString*               m_sRegular;
    NSRegularExpression*    m_pRegular;
    CustomTextView*             m_textView;
    CustomTextField*            m_textFiled;
    CustomButton * m_touchButton;
    UIColor * m_textColor;
}
@property(nonatomic,strong)UIFont * _tempFont;
@property(nonatomic,strong)NSString * content;
@property(nonatomic,strong)UIFont * font;
@property(nonatomic,strong)UIColor* textColor;
@property(nonatomic,assign)BOOL secureTextEntry;
@property(nonatomic,strong)NSString * text;
@property(nonatomic,assign)UITextAutocapitalizationType autocapitalizationType;
@property (nonatomic, weak) id delegate;


-(UIEditBox*)init;

-(void) SetMaxLength:(int)p_nMaxLength;
-(int) GetMaxLength;
-(void) setNumberOnly:(bool)p_bNumberOnly;
-(void) setForbidEdit:(bool)p_bForbidEdit;
-(bool) getNumberOnly;
-(bool) getForbidEdit;
-(void) setRegular:(NSString*)p_sRegular;
-(BOOL) IsInputValid:(NSString*)p_sBuffer;
-(void)setMultiAble:(bool)p_bMultiAble;
-(BOOL) getMultiAble;
-(id)getTextField;
- (void)returnKeyboard;
@end
