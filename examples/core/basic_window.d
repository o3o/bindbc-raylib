import std.stdio;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal == RaylibSupport.badLibrary) {
        foreach(info; loader.errors) {
            // A hypothetical logging routine
            writefln("e: %s, m:%s", info.error, info.message);
        }
      writeln("ERROR", retVal);
   } else {
      writeln(retVal);
      // Initialization
      enum SCREEN_WIDTH = 800;
      enum SCREEN_HEIGHT = 450;

      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - basic window");

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      // Main game loop
      while (!WindowShouldClose()) {
         // Draw
            BeginDrawing();
         ClearBackground(GOLD);
         //DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
         EndDrawing();
      }
      CloseWindow();
   }
}
