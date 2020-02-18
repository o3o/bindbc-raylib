import std.stdio;
import raylib;

void main(string[] args) {
   // Initialization
   enum SCREEN_WIDTH = 800;
   enum SCREEN_HEIGHT = 450;

   InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - mouse input");
   Vector2 ballPosition = Vector2(-100.0f, -100.0f);
   Color ballColor = DARKBLUE;

   SetTargetFPS(60); // Set our game to run at 60 frames-per-second

   // Main game loop
   while (!WindowShouldClose()) {
      ballPosition = GetMousePosition();

      if (IsMouseButtonPressed(MouseButton.MOUSE_LEFT_BUTTON)) {
         ballColor = MAROON;
      } else if (IsMouseButtonPressed(MouseButton.MOUSE_MIDDLE_BUTTON)) {
         ballColor = LIME;
      } else if (IsMouseButtonPressed(MouseButton.MOUSE_RIGHT_BUTTON)) {
         ballColor = DARKBLUE;
      }

      // Draw
      BeginDrawing();

      ClearBackground(RAYWHITE);
      DrawCircleV(ballPosition, 40, ballColor);
      DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, DARKGRAY);

      EndDrawing();
   }

   // De-Initialization
   CloseWindow(); // Close window and OpenGL context
}
