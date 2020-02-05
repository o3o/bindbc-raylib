module bindbc.kw.button;

import bindbc.kw.widget;
import bindbc.kw.rect;

version(BindKiwi_Static){
    extern (C) @nogc nothrow{
        KW_Widget * KW_CreateButton(KW_GUI * gui, KW_Widget * parent, KW_Widget * label, const KW_Rect * geometry);
        KW_Widget * KW_CreateButtonAndLabel(KW_GUI * gui, KW_Widget * parent, const char * text, const KW_Rect * geometry);
        KW_Widget * KW_SetButtonLabel(KW_Widget * button, KW_Widget * label);
        KW_Widget * KW_GetButtonLabel(KW_Widget * button);
    } 
}else{
    extern(C) @nogc nothrow {
        alias pKW_CreateButton = KW_Widget* function(KW_GUI*, KW_Widget*, KW_Widget*, const(KW_Rect)* );
        alias pKW_CreateButtonAndLabel = KW_Widget* function(KW_GUI*, KW_Widget*, const(char)*, const KW_Rect*);
        alias pKW_SetButtonLabel = KW_Widget* function(KW_Widget*, KW_Widget*);
        alias pKW_GetButtonLabel = KW_Widget* function(KW_Widget*);
    }

    __gshared {
        pKW_CreateButton KW_CreateButton;
        pKW_CreateButtonAndLabel KW_CreateButtonAndLabel;
        pKW_SetButtonLabel KW_SetButtonLabel;
        pKW_GetButtonLabel KW_GetButtonLabel;
    }
}