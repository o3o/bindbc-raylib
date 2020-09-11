module bindbc.raylib.bind.core;

import bindbc.raylib.config;
import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      /**
       * Initialize window and OpenGL context
       */
      alias pInitWindow = void function(int width, int height, const(char)* title);
      /**
       * Check if KEY_ESCAPE pressed or Close icon pressed
       */
      alias pWindowShouldClose = bool function();
      /**
       * Close window and unload OpenGL context
       */
      alias pCloseWindow = void function();

      /**
       * Check if window has been initialized successfully
       */
      alias pIsWindowReady = bool function();
      /**
       * Check if window has been minimized (or lost focus)
       */
      alias pIsWindowMinimized = bool function();
      /**
       * Check if window has been resized
       */
      alias pIsWindowResized = bool function();
      /**
       * Check if window is currently hidden
       */
      alias pIsWindowHidden = bool function();
      /**
       * Check if window is currently fullscreen
       */
      alias pIsWindowFullScreen = bool function();




      /**
       * Toggle fullscreen mode (only PLATFORM_DESKTOP)
       */
      alias pToggleFullscreen = void function();
      /**
       * Show the window
       */
      alias pUnhideWindow = void function();
      /**
       * Hide the window
       */
      alias pHideWindow = void function();
      /**
       * Set icon for window (only PLATFORM_DESKTOP)
       */
      alias pSetWindowIcon = void function(Image image);
      /**
       * Set title for window (only PLATFORM_DESKTOP)
       */
      alias pSetWindowTitle = void function(const(char)* title);
      /**
       * Set window position on screen (only PLATFORM_DESKTOP)
       */
      alias pSetWindowPosition = void function(int x, int y);
      /**
       * Set monitor for the current window (fullscreen mode)
       */
      alias pSetWindowMonitor = void function(int monitor);
      /**
       * Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
       */
      alias pSetWindowMinSize = void function(int width, int height);
      /**
       * Set window dimensions
       */
      alias pSetWindowSize = void function(int width, int height);
      /**
       * Get native window handle
       */
      alias pGetWindowHandle = void* function();
      /**
       * Get current screen width
       */
      alias pGetScreenWidth = int function();
      /**
       * Get current screen height
       */
      alias pGetScreenHeight = int function();
      /**
       * Get number of connected monitors
       */
      alias pGetMonitorCount = int function();
      /**
       * Get primary monitor width
       */
      alias pGetMonitorWidth = int function(int monitor);
      /**
       * Get primary monitor height
       */
      alias pGetMonitorHeight = int function(int monitor);
      /**
       * Get primary monitor physical width in millimetres
       */
      alias pGetMonitorPhysicalWidth = int function(int monitor);
      /**
       * Get primary monitor physical height in millimetres
       */
      alias pGetMonitorPhysicalHeight = int function(int monitor);
      /**
       * Get window position XY on monitor
       */
      alias pGetWindowPosition = Vector2 function();
      /**
       * Get the human-readable, UTF-8 encoded name of the primary monitor
       */
      alias pGetMonitorName = const(char)* function(int monitor);
      /**
       * Get clipboard text content
       */
      alias pGetClipboardText = const(char)* function();
      /**
       * Set clipboard text content
       */
      alias pSetClipboardText = void function(const(char)* text);

      /**
       * Shows cursor
       */
      alias pShowCursor = void function();
      /**
       * Hides cursor
       */
      alias pHideCursor = void function();
      /**
       * Check if cursor is not visible
       */
      alias pIsCursorHidden = bool function();
      /**
       * Enables cursor (unlock cursor)
       */
      alias pEnableCursor = void function();
      /**
       * Disables cursor (lock cursor)
       */
      alias pDisableCursor = void function();

      /**
       * Set background color (framebuffer clear color)
       */
      alias pClearBackground = void function(Color color);
      /**
       * Setup canvas (framebuffer) to start drawing
       */
      alias pBeginDrawing = void function();
      /**
       * End canvas drawing and swap buffers (double buffering)
       */
      alias pEndDrawing = void function();
      /**
       * Initialize 2D mode with custom camera (2D)
       */
      alias pBeginMode2D = void function(Camera2D camera);
      /**
       * Ends 2D mode with custom camera
       */
      alias pEndMode2D = void function();
      /**
       * Initializes 3D mode with custom camera (3D)
       */
      alias pBeginMode3D = void function(Camera3D camera);
      /**
       * Ends 3D mode and returns to default 2D orthographic mode
       */
      alias pEndMode3D = void function();
      /**
       * Initializes render texture for drawing
       */
      alias pBeginTextureMode = void function(RenderTexture2D target);
      /**
       * Ends drawing to render texture
       */
      alias pEndTextureMode = void function();
      /**
       * Begin scissor mode (define screen area for following drawing)
       */
      alias pBeginScissorMode = void function(int x, int y, int width, int height);
      /**
       * End scissor mode
       */
      alias pEndScissorMode = void function();
      /**
       * Returns a ray trace from mouse position
       */
      alias pGetMouseRay = Ray function(Vector2 mousePosition, Camera camera);
      /**
       * Returns camera transform matrix (view matrix)
       */
      alias pGetCameraMatrix = Matrix function(Camera camera);
      /**
       * Returns camera 2d transform matrix
       */
      alias pGetCameraMatrix2D = Matrix function(Camera2D camera);
      /**
       * Returns the screen space position for a 3d world space position
       */
      alias pGetWorldToScreen = Vector2 function(Vector3 position, Camera camera);
      /**
       * Returns size position for a 3d world space position
       */
      alias pGetWorldToScreenEx = Vector2 function(Vector3 position, Camera camera, int width, int height);
      /**
       * Returns the screen space position for a 2d camera world space position
       */
      alias pGetWorldToScreen2D = Vector2 function(Vector2 position, Camera2D camera);
      /**
       * Returns the world space position for a 2d camera screen space position
       */
      alias pGetScreenToWorld2D = Vector2 function(Vector2 position, Camera2D camera);

      /**
       * Set target FPS (maximum)
       */
      alias pSetTargetFPS = void function(int fps);
      /**
       * Returns current FPS
       */
      alias pGetFPS = int function();
      /**
       * Returns time in seconds for last frame drawn
       */
      alias pGetFrameTime = float function();
      /**
       * Returns elapsed time in seconds since InitWindow()
       */
      alias pGetTime = double function();

      /**
       * Returns hexadecimal value for a Color
       */
      alias pColorToInt = int function(Color color);
      /**
       * Returns color normalized as float [0..1]
       */
      alias pColorNormalize = Vector4 function(Color color);
      /**
       * Returns color from normalized values [0..1]
       */
      alias pColorFromNormalized = Color function(Vector4 normalized);
      /**
       * Returns HSV values for a Color
       */
      alias pColorToHSV = Vector3 function(Color color);
      /**
       * Returns a Color from HSV values
       */
      alias pColorFromHSV = Color function(Vector3 hsv);
      /**
       * Returns a Color struct from hexadecimal value
       */
      alias pGetColor = Color function(int hexValue);
      /**
       * Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
       */
      alias pFade = Color function(Color color, float alpha);

      /**
       * Setup window configuration flags (view FLAGS)
       */
      alias pSetConfigFlags = void function(uint flags);
      /**
       * Takes a screenshot of current screen (saved a .png)
       */
      alias pTakeScreenshot = void function(const(char)* fileName);

      // Files management functions
      // Use D func!

      /**
       * Check if file exists
       */
      alias pFileExists = bool function(const(char)* fileName);
      /**
       * Check file extension
       */
      alias pIsFileExtension = bool function(const(char)* fileName, const(char)* ext);
      /**
       * Check if a directory path exists
       */
      alias pDirectoryExists = bool function(const(char)* dirPath);
      /**
       * Get pointer to extension for a filename string
       */
      alias pGetExtension = const(char)* function(const(char)* fileName);
      /**
       * Get pointer to filename for a path string
       */
      alias pGetFileName = const(char)* function(const(char)* filePath);
      /**
       * Get filename string without extension (uses static string)
       */
      alias pGetFileNameWithoutExt = const(char)* function(const(char)* filePath);
      /**
       * Get full path for a given fileName with path (uses static string)
       */
      alias pGetDirectoryPath = const(char)* function(const(char)* filePath);
      /**
       * Get previous directory path for a given path (uses static string)
       */
      alias pGetPrevDirectoryPath = const(char)* function(const(char)* dirPath);
      /**
       * Get current working directory (uses static string)
       */
      alias pGetWorkingDirectory = const(char)* function();
      /**
       * Get filenames in a directory path (memory should be freed)
       */
      alias pGetDirectoryFiles = char* function(const(char)* dirPath, int* count);
      /**
       * Clear directory files paths buffers (free memory)
       */
      alias pClearDirectoryFiles = void function();
      /**
       * Change working directory, returns true if success
       */
      alias pChangeDirectory = bool function(const(char)* dir);
      /**
       * Check if a file has been dropped into window
       */
      alias pIsFileDropped = bool function();
      /**
       * Get dropped files names (memory should be freed)
       */
      alias pGetDroppedFiles = char** function(int* count);
      /**
       * Clear dropped files paths buffer (free memory)
       */
      alias pClearDroppedFiles = void function();
      /**
       * Get file modification time (last write time)/
       */
      alias pGetFileModTime = long function(const(char)* fileName);

      //------------------------------------------------------------------------------------
      // Input Handling Functions
      //------------------------------------------------------------------------------------

      /**
       * Detect if a key has been pressed once
       */
      alias pIsKeyPressed = bool function(int key);
      /**
       * Detect if a key is being pressed
       */
      alias pIsKeyDown = bool function(int key);
      /**
       * Detect if a key has been released once
       */
      alias pIsKeyReleased = bool function(int key);
      /**
       * Detect if a key is NOT being pressed
       */
      alias pIsKeyUp = bool function(int key);
      /**
       * Get latest key pressed
       */
      alias pGetKeyPressed = int function();
      /**
       * Set a custom key to exit program (default is ESC)
       */
      alias pSetExitKey = void function(int key);

      // Input-related functions: gamepads
      /**
       * Detect if a gamepad is available
       */
      alias pIsGamepadAvailable = bool function(int gamepad);
      /**
       * Check gamepad name (if available)
       */
      alias pIsGamepadName = bool function(int gamepad, const(char)* name);
      /**
       * Return gamepad internal name id
       */
      alias pGetNamepadName = const(char)* function(int gamepad);
      /**
       * Detect if a gamepad button has been pressed once
       */
      alias pIsGamepadButtonPressed = bool function(int gamepad, int button);
      /**
       * Detect if a gamepad button is being pressed
       */
      alias pIsGamepadButtonDown = bool function(int gamepad, int button);
      /**
       * Detect if a gamepad button has been released once
       */
      alias pIsGamepadButtonReleased = bool function(int gamepad, int button);
      /**
       * Detect if a gamepad button is NOT being pressed
       */
      alias pIsGamepadButtonUp = bool function(int gamepad, int button);
      /**
       * Get the last gamepad button pressed
       */
      alias pGetGamepadButtonPressed = int function();
      /**
       * Return gamepad axis count for a gamepad
       */
      alias pGetGamepadAxisCount = int function(int gamepad);
      /**
       * Return axis movement value for a gamepad axis
       */
      alias pGetGamepadAxisMovement = float function(int gamepad, int axis);

      // Input-related functions: mouse
      /**
       * Detect if a mouse button has been pressed once
       */
      alias pIsMouseButtonPressed = bool function(int button);
      /**
       * Detect if a mouse button is being pressed
       */
      alias pIsMouseButtonDown = bool function(int button);
      /**
       * Detect if a mouse button has been released once
       */
      alias pIsMouseButtonReleased = bool function(int button);
      /**
       * Detect if a mouse button is NOT being pressed
       */
      alias pIsMouseButtonUp = bool function(int button);
      /**
       * Returns mouse position X
       */
      alias pGetMouseX = int function();
      /**
       * Returns mouse position Y
       */
      alias pGetMouseY = int function();
      /**
       * Returns mouse position XY
       */
      alias pGetMousePosition = Vector2 function();
      /**
       * Set mouse position XY
       */
      alias pSetMousePosition = void function(int x, int y);
      /**
       * Set mouse offset
       */
      alias pSetMouseOffset = void function(int offsetX, int offsetY);
      /**
       * Set mouse scaling
       */
      alias pSetMouseScale = void function(float scaleX, float scaleY);
      /**
       * Returns mouse wheel movement Y
       */
      alias pGetMouseWheelMove = int function();

      // Input-related functions: touch
      /**
       * Returns touch position X for touch point 0 (relative to screen size)
       */
      alias pGetTouchX = int function();
      /**
       * Returns touch position Y for touch point 0 (relative to screen size)
       */
      alias pGetTouchY = int function();
      /**
       * Returns touch position XY for a touch point index (relative to screen size)
       */
      alias pGetTouchPosition = Vector2 function(int index);

      //------------------------------------------------------------------------------------
      // Gestures and Touch Handling Functions (Module: gestures)
      //------------------------------------------------------------------------------------
      /**
       * Enable a set of gestures using flags
       */
      alias pSetGesturesEnabled = void function(uint gestureFlags);
      /**
       * Check if a gesture have been detected
       */
      alias pIsGestureDetected = bool function(int gesture);
      /**
       * Get latest detected gesture
       */
      alias pGetGestureDetected = int function();
      /**
       * Get touch points count
       */
      alias pGetTouchPointsCount = int function();
      /**
       * Get gesture hold time in milliseconds
       */
      alias pGetGestureHoldDuration = float function();
      /**
       * Get gesture drag vector
       */
      alias pGetGestureDragVector = Vector2 function();
      /**
       * Get gesture drag angle
       */
      alias pGetGestureDragAngle = float function();
      /**
       * Get gesture pinch delta
       */
      alias pGetGesturePinchVector = Vector2 function();
      /**
       * Get gesture pinch angle
       */
      alias pGetGesturePinchAngle = float function();

      //------------------------------------------------------------------------------------
      // Camera System Functions (Module: camera)
      //------------------------------------------------------------------------------------
      /**
       * Set camera mode (multiple camera modes available)
       */
      alias pSetCameraMode = void function(Camera camera, int mode);
      /**
       * Update camera position for selected mode
       */
      alias pUpdateCamera = void function(Camera* camera);
      /**
       * Set camera pan key to combine with mouse movement (free camera)
       */
      alias pSetCameraPanControl = void function(int panKey);
      /**
       * Set camera alt key to combine with mouse movement (free camera)
       */
      alias pSetCameraAltControl = void function(int altKey);
      /**
       * Set camera smooth zoom key to combine with mouse (free camera)
       */
      alias pSetCameraSmoothZoomControl = void function(int szKey);
      /**
       * Set camera move controls (1st person and 3rd person cameras)
       */
      alias pSetCameraMoveControls = void function(int frontKey, int backKey, int rightKey, int leftKey, int upKey, int downKey);
   }

   __gshared {
      pInitWindow InitWindow;
      pWindowShouldClose WindowShouldClose;
      pCloseWindow CloseWindow;
      pIsWindowReady IsWindowReady;
      pIsWindowMinimized IsWindowMinimized;
      pIsWindowResized IsWindowResized;
      pIsWindowHidden IsWindowHidden;
      pIsWindowFullScreen IsWindowFullscreen;
      pToggleFullscreen ToggleFullscreen;
      pUnhideWindow UnhideWindow;
      pHideWindow HideWindow;
      pSetWindowIcon SetWindowIcon;
      pSetWindowTitle SetWindowTitle;
      pSetWindowPosition SetWindowPosition;
      pSetWindowMonitor SetWindowMonitor;
      pSetWindowMinSize SetWindowMinSize;
      pSetWindowSize SetWindowSize;
      pGetWindowHandle GetWindowHandle;
      pGetScreenWidth GetScreenWidth;
      pGetScreenHeight GetScreenHeight;
      pGetMonitorCount GetMonitorCount;
      pGetMonitorWidth GetMonitorWidth;
      pGetMonitorHeight GetMonitorHeight;
      pGetMonitorPhysicalWidth GetMonitorPhysicalWidth;
      pGetMonitorPhysicalHeight GetMonitorPhysicalHeight;
      pGetWindowPosition GetWindowPosition;
      pGetMonitorName GetMonitorName;
      pGetClipboardText GetClipboardText;
      pSetClipboardText SetClipboardText;
      pShowCursor ShowCursor;
      pHideCursor HideCursor;
      pIsCursorHidden IsCursorHidden;
      pEnableCursor EnableCursor;
      pDisableCursor DisableCursor;

      pClearBackground ClearBackground;
      pBeginDrawing BeginDrawing;
      pEndDrawing EndDrawing;
      pBeginMode2D BeginMode2D;
      pEndMode2D EndMode2D;
      pBeginMode3D BeginMode3D;
      pEndMode3D EndMode3D;
      pBeginTextureMode BeginTextureMode;
      pEndTextureMode EndTextureMode;
      pBeginScissorMode BeginScissorMode;
      pEndScissorMode EndScissorMode;

      pGetMouseRay GetMouseRay;
      pGetCameraMatrix GetCameraMatrix;
      pGetCameraMatrix2D GetCameraMatrix2D;
      pGetWorldToScreen GetWorldToScreen;
      pGetWorldToScreenEx GetWorldToScreenEx;
      pGetWorldToScreen2D GetWorldToScreen2D;
      pGetScreenToWorld2D GetScreenToWorld2D;

      pSetTargetFPS SetTargetFPS;
      pGetFPS GetFPS;
      pGetFrameTime GetFrameTime;
      pGetTime GetTime;

      pColorToInt ColorToInt;
      pColorNormalize ColorNormalize;
      pColorFromNormalized ColorFromNormalized;
      pColorToHSV ColorToHSV;
      pColorFromHSV ColorFromHSV;
      pGetColor GetColor;
      pFade Fade;

      // Misc. functions
      pSetConfigFlags SetConfigFlags;
      pTakeScreenshot TakeScreenshot;

      pFileExists FileExists;
      pIsFileExtension IsFileExtension;
      pDirectoryExists DirectoryExists;
      pGetExtension GetExtension;
      pGetFileName GetFileName;
      pGetFileNameWithoutExt GetFileNameWithoutExt;
      pGetDirectoryPath GetDirectoryPath;
      pGetPrevDirectoryPath GetPrevDirectoryPath;
      pGetWorkingDirectory GetWorkingDirectory;
      pGetDirectoryFiles GetDirectoryFiles;
      pClearDirectoryFiles ClearDirectoryFiles;
      pChangeDirectory ChangeDirectory;
      pIsFileDropped IsFileDropped;
      pGetDroppedFiles GetDroppedFiles;
      pClearDroppedFiles ClearDroppedFiles;
      pGetFileModTime GetFileModTime;

      pIsKeyPressed IsKeyPressed;
      pIsKeyDown IsKeyDown;
      pIsKeyReleased IsKeyReleased;
      pIsKeyUp IsKeyUp;
      pGetKeyPressed GetKeyPressed;
      pSetExitKey SetExitKey;

      // Input-related functions: gamepads
      pIsGamepadAvailable IsGamepadAvailable;
      pIsGamepadName IsGamepadName;
      pIsGamepadButtonPressed IsGamepadButtonPressed;
      pIsGamepadButtonDown IsGamepadButtonDown;
      pIsGamepadButtonReleased IsGamepadButtonReleased;
      pIsGamepadButtonUp IsGamepadButtonUp;
      pGetGamepadButtonPressed GetGamepadButtonPressed;
      pGetGamepadAxisCount GetGamepadAxisCount;
      pGetGamepadAxisMovement GetGamepadAxisMovement;

      // Input-related functions: mouse
      pIsMouseButtonPressed IsMouseButtonPressed;
      pIsMouseButtonDown IsMouseButtonDown;
      pIsMouseButtonReleased IsMouseButtonReleased;
      pIsMouseButtonUp IsMouseButtonUp;
      pGetMouseX GetMouseX;
      pGetMouseY GetMouseY;
      pGetMousePosition GetMousePosition;
      pSetMousePosition SetMousePosition;
      pSetMouseOffset SetMouseOffset;
      pSetMouseScale SetMouseScale;
      pGetMouseWheelMove GetMouseWheelMove;

      pGetTouchX GetTouchX;
      pGetTouchY GetTouchY;
      pGetTouchPosition GetTouchPosition;

      pSetGesturesEnabled SetGesturesEnabled;
      pIsGestureDetected IsGestureDetected;
      pGetGestureDetected GetGestureDetected;
      pGetTouchPointsCount GetTouchPointsCount;
      pGetGestureHoldDuration GetGestureHoldDuration;
      pGetGestureDragVector GetGestureDragVector;
      pGetGestureDragAngle GetGestureDragAngle;
      pGetGesturePinchVector GetGesturePinchVector;
      pGetGesturePinchAngle GetGesturePinchAngle;

      pSetCameraMode SetCameraMode;
      pUpdateCamera UpdateCamera;
      pSetCameraPanControl SetCameraPanControl;
      pSetCameraAltControl SetCameraAltControl;
      pSetCameraSmoothZoomControl SetCameraSmoothZoomControl;
      pSetCameraMoveControls SetCameraMoveControls;
   }

   static if (raylibSupport >= RaylibSupport.raylib300_70) {
      extern (C) @nogc nothrow {
         /**
          * Get window scale DPI factor
          */
         alias pGetWindowScaleDPI = Vector2 function();
         /**
          * Check if window has been focused
          */
         alias pIsWindowFocused = bool function();
      }
      __gshared {
         pGetWindowScaleDPI GetWindowScaleDPI;
         pIsWindowFocused IsWindowFocused;
      }
   }
}
