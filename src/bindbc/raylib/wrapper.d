/**
 * Wrapper facilities.
 */
module bindbc.raylib.wrapper;

import bindbc.raylib.types : Rectangle;

int guiListViewEx(Rectangle bounds, string[] text, int count, int* focus, int* scrollIndex, int active) {
   import bindbc.raylib.bind.gui : GuiListViewEx;

   auto ptrs = new const(char)*[count];
   foreach (i, t; text) {
      ptrs[i] = t.ptr;
   }
   return GuiListViewEx(bounds, ptrs.ptr, count, focus, scrollIndex, active);
}

bool guiTextBox(Rectangle bounds, string text, int textSize, bool editMode) {
   import std.string : toStringz;
   import bindbc.raylib.bind.gui : GuiTextBox;
   char[] txt = text.dup ~ '\0';

   return GuiTextBox(bounds, txt.ptr, textSize, editMode);
}

