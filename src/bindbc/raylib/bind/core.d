module bindbc.raylib.bind.core;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      alias pInitWindow = void function(int width, int height, const(char)* title); // Initialize window and OpenGL context
      alias pWindowShouldClose = bool function(); // Check if KEY_ESCAPE pressed or Close icon pressed
      alias pCloseWindow = void function(); // Close window and unload OpenGL context
   }

   __gshared {
      pInitWindow InitWindow;
      pWindowShouldClose WindowShouldClose;
      pCloseWindow CloseWindow;
   }
}
