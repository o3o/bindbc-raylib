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
