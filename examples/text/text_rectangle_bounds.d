import std.stdio;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;
import std.conv : to;
import std.string : toStringz;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport) {
      foreach (info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {

      // Initialization
      //--------------------------------------------------------------------------------------
      enum int screenWidth = 800;
      enum int screenHeight = 450;

      InitWindow(screenWidth, screenHeight, "raylib [text] example - draw text inside a rectangle");

      string text = "Text cannot escape\tthis container\t...word wrap also works when active so here's a long text for testing.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nec ullamcorper sit amet risus nullam eget felis eget.";
      bool resizing = false;
      bool wordWrap = true;

      Rectangle container = Rectangle(25, 25, screenWidth - 50, screenHeight - 250);
      Rectangle resizer = Rectangle(container.x + container.width - 17, container.y + container.height - 17, 14, 14);

      // Minimum width and heigh for the container rectangle
      enum int minWidth = 60;
      enum int minHeight = 60;
      enum int maxWidth = screenWidth - 50;
      enum int maxHeight = screenHeight - 160;

      Vector2 lastMouse = Vector2(0.0f, 0.0f); // Stores last mouse coordinates
      Color borderColor = MAROON; // Container border color
      Font font = GetFontDefault(); // Get default system font

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second
      //--------------------------------------------------------------------------------------

      // Main game loop
      while (!WindowShouldClose()) {
         // Update
         //----------------------------------------------------------------------------------
         if (IsKeyPressed(KeyboardKey.KEY_SPACE)) {
            wordWrap = !wordWrap;
         }

         Vector2 mouse = GetMousePosition();

         // Check if the mouse is inside the container and toggle border color
         if (CheckCollisionPointRec(mouse, container)) {
            borderColor = Fade(MAROON, 0.4f);
         } else if (!resizing) {
            borderColor = MAROON;
         }

         // Container resizing logic
         if (resizing) {
            if (IsMouseButtonReleased(MouseButton.MOUSE_LEFT_BUTTON)) {
               resizing = false;
         }
            int width = to!int(container.width + (mouse.x - lastMouse.x));
            container.width = (width > minWidth) ? ((width < maxWidth) ? width : maxWidth) : minWidth;

            int height = to!int(container.height + (mouse.y - lastMouse.y));
            container.height = (height > minHeight) ? ((height < maxHeight) ? height : maxHeight) : minHeight;
         } else {
            // Check if we're resizing
            if (IsMouseButtonDown(MouseButton.MOUSE_LEFT_BUTTON) && CheckCollisionPointRec(mouse, resizer)) {
               resizing = true;
            }
         }

         // Move resizer rectangle properly
         resizer.x = container.x + container.width - 17;
         resizer.y = container.y + container.height - 17;

         lastMouse = mouse; // Update mouse
         //----------------------------------------------------------------------------------

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         DrawRectangleLinesEx(container, 3, borderColor); // Draw container border

         // Draw text in container (add some padding)
         DrawTextRec(font, text.toStringz, Rectangle(container.x + 4, container.y + 4, container.width - 4,
               container.height - 4), 20.0f, 2.0f, wordWrap, GRAY);

         DrawRectangleRec(resizer, borderColor); // Draw the resize box

         // Draw bottom info
         DrawRectangle(0, screenHeight - 54, screenWidth, 54, GRAY);
         DrawRectangleRec(Rectangle(382, screenHeight - 34, 12, 12), MAROON);

         DrawText("Word Wrap: ", 313, screenHeight - 115, 20, BLACK);
         if (wordWrap) {
            DrawText("ON", 447, screenHeight - 115, 20, RED);
         } else {
            DrawText("OFF", 447, screenHeight - 115, 20, BLACK);
         }

         DrawText("Press [SPACE] to toggle word wrap", 218, screenHeight - 86, 20, GRAY);

         DrawText("Click hold & drag the    to resize the container", 155, screenHeight - 38, 20, RAYWHITE);

         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      // De-Initialization
      //--------------------------------------------------------------------------------------
      CloseWindow(); // Close window and OpenGL context
      //--------------------------------------------------------------------------------------

   }
}
