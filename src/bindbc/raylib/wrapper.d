/**
 * Wrapper facilities.
 */
module bindbc.raylib.wrapper;

import bindbc.raylib.types : Rectangle, Color;

int guiListViewEx(Rectangle bounds, string[] text, int count, int* focus, int* scrollIndex, int active) {
   import bindbc.raylib.bind.gui : GuiListViewEx;

   auto ptrs = new const(char)*[count];
   foreach (i, t; text) {
      ptrs[i] = t.ptr;
   }
   return GuiListViewEx(bounds, ptrs.ptr, count, focus, scrollIndex, active);
}

int guiTextInputBox(Rectangle bounds, string title, string message, string buttons, string text) {
   import bindbc.raylib.bind.gui : GuiTextInputBox;
   import std.string : toStringz;

   char[] txt = text.dup ~ '\0';
   return GuiTextInputBox(bounds, title.toStringz, message.toStringz, buttons.toStringz, txt.ptr);
}

bool guiTextBox(Rectangle bounds, string text, int textSize, bool editMode) {
   import std.string : toStringz;
   import bindbc.raylib.bind.gui : GuiTextBox;
   char[] txt = text.dup ~ '\0';

   return GuiTextBox(bounds, txt.ptr, textSize, editMode);
}

void drawText(string text, int posX, int posY, int fontSize, Color color) {
   import bindbc.raylib.bind.text : DrawText;
   import std.string : toStringz;
   DrawText(toStringz(text) , posX, posY, fontSize, color);
}


