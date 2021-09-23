/**
 @file			UIEditBox.mm
 @brief         继承textField类
 @author		wyw
 @version		1.0
 @date			2012_12_17
 @company       JoyChina
 */

#import "UIEditBox.h"
#import "JCScriptRuntime.h"

//-------------------------------------------------------------------------------
@implementation UIEditBox
//-------------------------------------------------------------------------------
-(UIEditBox*)init
{
    self = [super init];
    m_nMaxLength = -1;
    m_sRegular = NULL;
    m_pRegular = NULL;
    m_bNumberOnly = false;
    m_bIsMultiAble=false;
    //[self setRegular:@"\\d+"];
    m_bForbidEdit = false;
    return self;
}
//-------------------------------------------------------------------------------
-(void) setNumberOnly:(bool)p_bNumberOnly
{
    m_bNumberOnly = p_bNumberOnly;
}
-(void) setForbidEdit:(bool)p_bForbidEdit
{
    m_bForbidEdit = p_bForbidEdit;
}
//-------------------------------------------------------------------------------
-(bool) getNumberOnly
{
    return m_bNumberOnly;
}
//-------------------------------------------------------------------------------    
-(bool) getForbidEdit
{
    return m_bForbidEdit;
}
//-------------------------------------------------------------------------------
-(void) SetMaxLength:(int)p_nMaxLength
{
    m_nMaxLength = p_nMaxLength;
}
//-------------------------------------------------------------------------------
-(int) GetMaxLength
{
    return m_nMaxLength;
}
//-------------------------------------------------------------------------------
-(void) setRegular:(NSString*)p_sRegular
{
    m_sRegular = p_sRegular;
    NSError *error = NULL;
    m_pRegular = [ NSRegularExpression regularExpressionWithPattern:m_sRegular options:NSRegularExpressionCaseInsensitive error:&error];
}
//-------------------------------------------------------------------------------
-(BOOL) IsInputValid:(NSString*)p_sBuffer
{
    if( m_pRegular == NULL || m_sRegular == NULL )return true;
    NSArray* vArrays = [m_pRegular matchesInString:p_sBuffer options:NSMatchingCompleted range:NSMakeRange( 0, [p_sBuffer length] )];
    if( vArrays != NULL && [vArrays count] > 0 )
    {
        return true;
    }
    return false;
}
//-------------------------------------------------------------------------------
-(void)setMultiAble:(bool)p_bMultiAble
{
    m_bIsMultiAble=p_bMultiAble;
}
-(BOOL) getMultiAble
{
    return m_bIsMultiAble;
}
-(id)getTextField {
    if(self.secureTextEntry){
        return m_textFiled;
    }
    return m_textView;
}

-(NSString *)text {
    if (self.secureTextEntry) {
        return  m_textFiled.text;
    }else {
        return  m_textView.text;
    }
}

-(void)setText:(NSString *)text{
    self.content = text;
}
-(UIFont *)font {
    return  self._tempFont;
}
-(void)setFont:(UIFont *)font {
    self._tempFont = font;
    if(self.secureTextEntry){
        if(m_textFiled){
            m_textFiled.font = font;
        }
    }else {
        if(m_textView){
            m_textView.font = font;
        }
    }
}


//创建View

- (BOOL)becomeFirstResponder{
    
    
    if (self.secureTextEntry) {
        m_textFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:m_textFiled];
        m_textFiled.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        m_textFiled.font = self.font;
        m_textFiled.textColor = self.textColor;
        m_textFiled.delegate = self.delegate;
        m_textFiled.backgroundColor = [UIColor clearColor];
        m_textFiled.secureTextEntry = true;
        m_textFiled.text = self.content;
        m_textFiled.autocapitalizationType = self.autocapitalizationType;
        [m_textFiled addTarget:self.delegate action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
        [m_textFiled becomeFirstResponder];
    }else {
        m_textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:m_textView];
        m_textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        m_textView.font = self.font;
        m_textView.textColor = self.textColor;
        m_textView.delegate = self.delegate;
        m_textView.showsVerticalScrollIndicator = false;
        m_textView.showsHorizontalScrollIndicator = false;
        [m_textView setBackgroundColor:[UIColor clearColor]];
        m_textView.text = self.content;
        m_textView.autocapitalizationType = self.autocapitalizationType;
        
//        m_textView.textContainer.maximumNumberOfLines = m_nMaxLength;
        if(JCScriptRuntime::s_JSRT->m_pCurEditBox != NULL){
            std::string type = JCScriptRuntime::s_JSRT->m_pCurEditBox->m_sType;
            if(type == "number"){
                m_textView.keyboardType = UIKeyboardTypeNumberPad;
            }
        }
        [m_textView becomeFirstResponder];
    }
    return [super becomeFirstResponder];
}
- (BOOL)resignFirstResponder {
    
    if (m_textView) {
        [m_textView removeFromSuperview];
        m_textView = nil;
    }
    if(m_textFiled){
        [m_textFiled removeTarget:self.delegate action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
        [m_textFiled removeFromSuperview];
        m_textFiled = nil;
    }
    return [super resignFirstResponder];
}
@end
