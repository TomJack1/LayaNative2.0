package layaair.game.browser;

import android.content.Context;
import android.support.v7.widget.AppCompatEditText;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;

public class InputEditText extends AppCompatEditText {

    public InputEditText(Context context) {
        this(context, null);
    }

    public InputEditText(Context context, AttributeSet attrs) {
        this(context, attrs, android.R.attr.editTextStyle);
    }

    public InputEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected void onSelectionChanged(int selStart, int selEnd) {
        super.onSelectionChanged(selStart, selEnd);
        if (selStart == selEnd){//防止不能多选
            if(getText() == null){//判空，防止出现空指针
                setSelection(0);
            }else {
                setSelection(getText().length()); // 保证光标始终在最后面
//                setSelection(0, getText().length());
            }
        }
    }
    public boolean isEdited(){
        return this.hasFocus();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // 其他按键事件响应
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        // 返回自己的实现
        return new BackspaceInputConnection(super.onCreateInputConnection(outAttrs), true);
    }

    private class BackspaceInputConnection extends InputConnectionWrapper {

        public BackspaceInputConnection(InputConnection target, boolean mutable) {
            super(target, mutable);
        }

        /**
         * 当软键盘删除文本之前，会调用这个方法通知输入框，我们可以重写这个方法并判断是否要拦截这个删除事件。
         * 在谷歌输入法上，点击退格键的时候不会调用{@link #sendKeyEvent(KeyEvent event)}，
         * 而是直接回调这个方法，所以也要在这个方法上做拦截；
         * */
        @Override
        public boolean deleteSurroundingText(int beforeLength, int afterLength) {
            ConchJNI.inputChange(KeyEvent.KEYCODE_DEL);
            // 做你想做的是拦截他
            return super.deleteSurroundingText(beforeLength, afterLength);
        }

    }

}