module bindbc.raylib.dynload;

import bindbc.raylib.config;
import bindbc.raylib.bind.core;
import bindbc.raylib.bind.shapes;
import bindbc.raylib.bind.gui;

version (BindRaylib_Static) {
} else version = BindRaylib_Dynamic;

version (BindRaylib_Dynamic)  : import bindbc.loader;

private {
   SharedLib lib;
   RaylibSupport loadedVersion;
}

void unloadRaylib() {
   if (lib != invalidHandle) {
      lib.unload();
   }
}

RaylibSupport loadedRaylibVersion() {
   return loadedVersion;
}

bool isRaylibLoaded() {
   return lib != invalidHandle;
}

RaylibSupport loadRaylib() {
   version (Windows) {
      const(char)[][1] libNames = ["raylib.dll"];
   } else version (Posix) {
      const(char)[][3] libNames = [
         "libraylib.so",
         "/usr/local/lib/libraylib.so" //make install PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED
         , "/usr/lib/libraylib.so"

      ];
   } else {
      static assert(0, "bindbc-raylib is not yet supported on this platform");
   }

   RaylibSupport ret;
   foreach (name; libNames) {
      ret = loadRaylib(name.ptr);
      if (ret != RaylibSupport.noLibrary) {
         break;
      }
   }
   return ret;
}

RaylibSupport loadRaylib(const(char)* libName) {
   // If the library isn't yet loaded, load it now.
   if (lib == invalidHandle) {
      lib = load(libName);
      if (lib == invalidHandle) {
         return RaylibSupport.noLibrary;
      }
   }

   auto errCount = errorCount();
   lib.bindSymbol(cast(void**)&InitWindow, "InitWindow");
   lib.bindSymbol(cast(void**)&WindowShouldClose, "WindowShouldClose");
   lib.bindSymbol(cast(void**)&CloseWindow, "CloseWindow");
   lib.bindSymbol(cast(void**)&IsWindowReady, "IsWindowReady");
   lib.bindSymbol(cast(void**)&IsWindowMinimized, "IsWindowMinimized");
   lib.bindSymbol(cast(void**)&IsWindowResized, "IsWindowResized");
   lib.bindSymbol(cast(void**)&IsWindowHidden, "IsWindowHidden");
   lib.bindSymbol(cast(void**)&ToggleFullscreen, "ToggleFullscreen");
   lib.bindSymbol(cast(void**)&UnhideWindow, "UnhideWindow");
   lib.bindSymbol(cast(void**)&HideWindow, "HideWindow");
   lib.bindSymbol(cast(void**)&SetWindowIcon, "SetWindowIcon");
   lib.bindSymbol(cast(void**)&SetWindowTitle, "SetWindowTitle");
   lib.bindSymbol(cast(void**)&SetWindowPosition, "SetWindowPosition");
   lib.bindSymbol(cast(void**)&SetWindowMonitor, "SetWindowMonitor");
   lib.bindSymbol(cast(void**)&SetWindowMinSize, "SetWindowMinSize");
   lib.bindSymbol(cast(void**)&SetWindowSize, "SetWindowSize");
   lib.bindSymbol(cast(void**)&GetWindowHandle, "GetWindowHandle");
   lib.bindSymbol(cast(void**)&GetScreenWidth, "GetScreenWidth");
   lib.bindSymbol(cast(void**)&GetScreenHeight, "GetScreenHeight");
   lib.bindSymbol(cast(void**)&GetMonitorCount, "GetMonitorCount");
   lib.bindSymbol(cast(void**)&GetMonitorWidth, "GetMonitorWidth");
   lib.bindSymbol(cast(void**)&GetMonitorHeight, "GetMonitorHeight");
   lib.bindSymbol(cast(void**)&GetMonitorPhysicalWidth, "GetMonitorPhysicalWidth");
   lib.bindSymbol(cast(void**)&GetMonitorPhysicalHeight, "GetMonitorPhysicalHeight");

   lib.bindSymbol(cast(void**)&GetMonitorName, "GetMonitorName");
   lib.bindSymbol(cast(void**)&GetClipboardText, "GetClipboardText");
   lib.bindSymbol(cast(void**)&SetClipboardText, "SetClipboardText");
   lib.bindSymbol(cast(void**)&ClearBackground, "ClearBackground");
   lib.bindSymbol(cast(void**)&BeginDrawing, "BeginDrawing");
   lib.bindSymbol(cast(void**)&EndDrawing, "EndDrawing");
   lib.bindSymbol(cast(void**)&BeginMode2D, "BeginMode2D");
   lib.bindSymbol(cast(void**)&EndMode2D, "EndMode2D");
   lib.bindSymbol(cast(void**)&BeginMode3D, "BeginMode3D");
   lib.bindSymbol(cast(void**)&EndMode3D, "EndMode3D");
   lib.bindSymbol(cast(void**)&BeginTextureMode, "BeginTextureMode");
   lib.bindSymbol(cast(void**)&EndTextureMode, "EndTextureMode");
   lib.bindSymbol(cast(void**)&BeginScissorMode, "BeginScissorMode");
   lib.bindSymbol(cast(void**)&EndScissorMode, "EndScissorMode");

   lib.bindSymbol(cast(void**)&GetMouseRay, "GetMouseRay");
   lib.bindSymbol(cast(void**)&GetCameraMatrix, "GetCameraMatrix");

   lib.bindSymbol(cast(void**)&GetWorldToScreen, "GetWorldToScreen");
   lib.bindSymbol(cast(void**)&SetTargetFPS, "SetTargetFPS");
   lib.bindSymbol(cast(void**)&GetFPS, "GetFPS");
   lib.bindSymbol(cast(void**)&GetFrameTime, "GetFrameTime");

   lib.bindSymbol(cast(void**)&GetTime, "GetTime");
   lib.bindSymbol(cast(void**)&ColorToInt, "ColorToInt");
   lib.bindSymbol(cast(void**)&ColorNormalize, "ColorNormalize");
   lib.bindSymbol(cast(void**)&ColorToHSV, "ColorToHSV");
   lib.bindSymbol(cast(void**)&ColorFromHSV, "ColorFromHSV");
   lib.bindSymbol(cast(void**)&GetColor, "GetColor");

   lib.bindSymbol(cast(void**)&Fade, "Fade");
   lib.bindSymbol(cast(void**)&SetConfigFlags, "SetConfigFlags");
   lib.bindSymbol(cast(void**)&TakeScreenshot, "TakeScreenshot");

   lib.bindSymbol(cast(void**)&FileExists, "FileExists");
   lib.bindSymbol(cast(void**)&IsFileExtension, "IsFileExtension");
   lib.bindSymbol(cast(void**)&DirectoryExists, "DirectoryExists");
   lib.bindSymbol(cast(void**)&GetExtension, "GetExtension");
   lib.bindSymbol(cast(void**)&GetFileName, "GetFileName");
   lib.bindSymbol(cast(void**)&GetFileNameWithoutExt, "GetFileNameWithoutExt");
   lib.bindSymbol(cast(void**)&GetDirectoryPath, "GetDirectoryPath");
   lib.bindSymbol(cast(void**)&GetPrevDirectoryPath, "GetPrevDirectoryPath");
   lib.bindSymbol(cast(void**)&GetWorkingDirectory, "GetWorkingDirectory");
   lib.bindSymbol(cast(void**)&GetDirectoryFiles, "GetDirectoryFiles");
   lib.bindSymbol(cast(void**)&ClearDirectoryFiles, "ClearDirectoryFiles");
   lib.bindSymbol(cast(void**)&ChangeDirectory, "ChangeDirectory");
   lib.bindSymbol(cast(void**)&IsFileDropped, "IsFileDropped");
   lib.bindSymbol(cast(void**)&GetDroppedFiles, "GetDroppedFiles");
   lib.bindSymbol(cast(void**)&ClearDroppedFiles, "ClearDroppedFiles");
   lib.bindSymbol(cast(void**)&GetFileModTime, "GetFileModTime");

   lib.bindSymbol(cast(void**)&IsKeyPressed, "IsKeyPressed");
   lib.bindSymbol(cast(void**)&IsKeyDown, "IsKeyDown");
   lib.bindSymbol(cast(void**)&IsKeyReleased, "IsKeyReleased");
   lib.bindSymbol(cast(void**)&IsKeyUp, "IsKeyUp");
   lib.bindSymbol(cast(void**)&GetKeyPressed, "GetKeyPressed");
   lib.bindSymbol(cast(void**)&SetExitKey, "SetExitKey");
   lib.bindSymbol(cast(void**)&IsGamepadAvailable, "IsGamepadAvailable");

   lib.bindSymbol(cast(void**)&IsGamepadName, "IsGamepadName");
   lib.bindSymbol(cast(void**)&IsGamepadButtonPressed, "IsGamepadButtonPressed");
   lib.bindSymbol(cast(void**)&IsGamepadButtonDown, "IsGamepadButtonDown");
   lib.bindSymbol(cast(void**)&IsGamepadButtonReleased, "IsGamepadButtonReleased");
   lib.bindSymbol(cast(void**)&IsGamepadButtonUp, "IsGamepadButtonUp");
   lib.bindSymbol(cast(void**)&GetGamepadButtonPressed, "GetGamepadButtonPressed");
   lib.bindSymbol(cast(void**)&GetGamepadAxisCount, "GetGamepadAxisCount");
   lib.bindSymbol(cast(void**)&GetGamepadAxisMovement, "GetGamepadAxisMovement");
   lib.bindSymbol(cast(void**)&IsMouseButtonPressed, "IsMouseButtonPressed");
   lib.bindSymbol(cast(void**)&IsMouseButtonDown, "IsMouseButtonDown");
   lib.bindSymbol(cast(void**)&IsMouseButtonReleased, "IsMouseButtonReleased");
   lib.bindSymbol(cast(void**)&IsMouseButtonUp, "IsMouseButtonUp");
   lib.bindSymbol(cast(void**)&GetMouseX, "GetMouseX");
   lib.bindSymbol(cast(void**)&GetMouseY, "GetMouseY");
   lib.bindSymbol(cast(void**)&GetMousePosition, "GetMousePosition");
   lib.bindSymbol(cast(void**)&SetMousePosition, "SetMousePosition");
   lib.bindSymbol(cast(void**)&SetMouseOffset, "SetMouseOffset");
   lib.bindSymbol(cast(void**)&SetMouseScale, "SetMouseScale");
   lib.bindSymbol(cast(void**)&GetMouseWheelMove, "GetMouseWheelMove");
   lib.bindSymbol(cast(void**)&GetTouchX, "GetTouchX");
   lib.bindSymbol(cast(void**)&GetTouchY, "GetTouchY");
   lib.bindSymbol(cast(void**)&GetTouchPosition, "GetTouchPosition");
   lib.bindSymbol(cast(void**)&SetGesturesEnabled, "SetGesturesEnabled");
   lib.bindSymbol(cast(void**)&IsGestureDetected, "IsGestureDetected");
   lib.bindSymbol(cast(void**)&GetGestureDetected, "GetGestureDetected");
   lib.bindSymbol(cast(void**)&GetTouchPointsCount, "GetTouchPointsCount");
   lib.bindSymbol(cast(void**)&GetGestureHoldDuration, "GetGestureHoldDuration");
   lib.bindSymbol(cast(void**)&GetGestureDragVector, "GetGestureDragVector");
   lib.bindSymbol(cast(void**)&GetGestureDragAngle, "GetGestureDragAngle");
   lib.bindSymbol(cast(void**)&GetGesturePinchVector, "GetGesturePinchVector");
   lib.bindSymbol(cast(void**)&GetGesturePinchAngle, "GetGesturePinchAngle");
   lib.bindSymbol(cast(void**)&SetCameraMode, "SetCameraMode");
   lib.bindSymbol(cast(void**)&UpdateCamera, "UpdateCamera");
   lib.bindSymbol(cast(void**)&SetCameraPanControl, "SetCameraPanControl");
   lib.bindSymbol(cast(void**)&SetCameraAltControl, "SetCameraAltControl");
   lib.bindSymbol(cast(void**)&SetCameraSmoothZoomControl, "SetCameraSmoothZoomControl");
   lib.bindSymbol(cast(void**)&SetCameraMoveControls, "SetCameraMoveControls");

   // shapes
   lib.bindSymbol(cast(void**)&DrawPixel, "DrawPixel");
   lib.bindSymbol(cast(void**)&DrawPixelV, "DrawPixelV");
   lib.bindSymbol(cast(void**)&DrawLine, "DrawLine");
   lib.bindSymbol(cast(void**)&DrawLineV, "DrawLineV");
   lib.bindSymbol(cast(void**)&DrawLineEx, "DrawLineEx");
   lib.bindSymbol(cast(void**)&DrawLineBezier, "DrawLineBezier");
   lib.bindSymbol(cast(void**)&DrawLineStrip, "DrawLineStrip");
   lib.bindSymbol(cast(void**)&DrawCircle, "DrawCircle");
   lib.bindSymbol(cast(void**)&DrawCircleSector, "DrawCircleSector");
   lib.bindSymbol(cast(void**)&DrawCircleSectorLines, "DrawCircleSectorLines");
   lib.bindSymbol(cast(void**)&DrawCircleGradient, "DrawCircleGradient");
   lib.bindSymbol(cast(void**)&DrawCircleV, "DrawCircleV");
   lib.bindSymbol(cast(void**)&DrawCircleLines, "DrawCircleLines");
   lib.bindSymbol(cast(void**)&DrawEllipse, "DrawEllipse");
   lib.bindSymbol(cast(void**)&DrawEllipseLines, "DrawEllipseLines");
   lib.bindSymbol(cast(void**)&DrawRing, "DrawRing");
   lib.bindSymbol(cast(void**)&DrawRingLines, "DrawRingLines");
   lib.bindSymbol(cast(void**)&DrawRectangle, "DrawRectangle");
   lib.bindSymbol(cast(void**)&DrawRectangleV, "DrawRectangleV");
   lib.bindSymbol(cast(void**)&DrawRectangleRec, "DrawRectangleRec");
   lib.bindSymbol(cast(void**)&DrawRectanglePro, "DrawRectanglePro");
   lib.bindSymbol(cast(void**)&DrawRectangleGradientV, "DrawRectangleGradientV");
   lib.bindSymbol(cast(void**)&DrawRectangleGradientH, "DrawRectangleGradientH");
   lib.bindSymbol(cast(void**)&DrawRectangleGradientEx, "DrawRectangleGradientEx");
   lib.bindSymbol(cast(void**)&DrawRectangleLines, "DrawRectangleLines");
   lib.bindSymbol(cast(void**)&DrawRectangleLinesEx, "DrawRectangleLinesEx");
   lib.bindSymbol(cast(void**)&DrawRectangleRounded, "DrawRectangleRounded");
   lib.bindSymbol(cast(void**)&DrawRectangleRoundedLines, "DrawRectangleRoundedLines");
   lib.bindSymbol(cast(void**)&DrawTriangle, "DrawTriangle");
   lib.bindSymbol(cast(void**)&DrawTriangleLines, "DrawTriangleLines");
   lib.bindSymbol(cast(void**)&DrawTriangleFan, "DrawTriangleFan");
   lib.bindSymbol(cast(void**)&DrawTriangleStrip, "DrawTriangleStrip");
   lib.bindSymbol(cast(void**)&DrawPoly, "DrawPoly");
   lib.bindSymbol(cast(void**)&DrawPolyLines, "DrawPolyLines");
   lib.bindSymbol(cast(void**)&CheckCollisionRecs, "CheckCollisionRecs");
   lib.bindSymbol(cast(void**)&CheckCollisionCircles, "CheckCollisionCircles");
   lib.bindSymbol(cast(void**)&CheckCollisionCircleRec, "CheckCollisionCircleRec");
   lib.bindSymbol(cast(void**)&GetCollisionRec, "GetCollisionRec");
   lib.bindSymbol(cast(void**)&CheckCollisionPointRec, "CheckCollisionPointRec");
   lib.bindSymbol(cast(void**)&CheckCollisionPointCircle, "CheckCollisionPointCircle");
   lib.bindSymbol(cast(void**)&CheckCollisionPointTriangle, "CheckCollisionPointTriangle");

   // gui
   version (RAYGUI) {
      lib.bindSymbol(cast(void**)&GuiEnable, "GuiEnable");
      lib.bindSymbol(cast(void**)&GuiDisable, "GuiDisable");
      lib.bindSymbol(cast(void**)&GuiLock, "GuiLock");
      lib.bindSymbol(cast(void**)&GuiUnlock, "GuiUnlock");
      lib.bindSymbol(cast(void**)&GuiFade, "GuiFade");
      lib.bindSymbol(cast(void**)&GuiSetState, "GuiSetState");
      lib.bindSymbol(cast(void**)&GuiGetState, "GuiGetState");
      lib.bindSymbol(cast(void**)&GuiSetFont, "GuiSetFont");
      lib.bindSymbol(cast(void**)&GuiGetFont, "GuiGetFont");
      lib.bindSymbol(cast(void**)&GuiSetStyle, "GuiSetStyle");
      lib.bindSymbol(cast(void**)&GuiGetStyle, "GuiGetStyle");
      lib.bindSymbol(cast(void**)&GuiWindowBox, "GuiWindowBox");
      lib.bindSymbol(cast(void**)&GuiGroupBox, "GuiGroupBox");
      lib.bindSymbol(cast(void**)&GuiLine, "GuiLine");
      lib.bindSymbol(cast(void**)&GuiPanel, "GuiPanel");
      lib.bindSymbol(cast(void**)&GuiScrollPanel, "GuiScrollPanel");
      lib.bindSymbol(cast(void**)&GuiLabel, "GuiLabel");
      lib.bindSymbol(cast(void**)&GuiButton, "GuiButton");
      lib.bindSymbol(cast(void**)&GuiLabelButton, "GuiLabelButton");
      lib.bindSymbol(cast(void**)&GuiImageButton, "GuiImageButton");
      lib.bindSymbol(cast(void**)&GuiImageButtonEx, "GuiImageButtonEx");
      lib.bindSymbol(cast(void**)&GuiToggle, "GuiToggle");
      lib.bindSymbol(cast(void**)&GuiToggleGroup, "GuiToggleGroup");
      lib.bindSymbol(cast(void**)&GuiCheckBox, "GuiCheckBox");
      lib.bindSymbol(cast(void**)&GuiComboBox, "GuiComboBox");
      lib.bindSymbol(cast(void**)&GuiDropdownBox, "GuiDropdownBox");
      lib.bindSymbol(cast(void**)&GuiSpinner, "GuiSpinner");
      lib.bindSymbol(cast(void**)&GuiValueBox, "GuiValueBox");
      lib.bindSymbol(cast(void**)&GuiTextBox, "GuiTextBox");
      lib.bindSymbol(cast(void**)&GuiTextBoxMulti, "GuiTextBoxMulti");
      lib.bindSymbol(cast(void**)&GuiSlider, "GuiSlider");
      lib.bindSymbol(cast(void**)&GuiSliderBar, "GuiSliderBar");
      lib.bindSymbol(cast(void**)&GuiProgressBar, "GuiProgressBar");
      lib.bindSymbol(cast(void**)&GuiStatusBar, "GuiStatusBar");
      lib.bindSymbol(cast(void**)&GuiDummyRec, "GuiDummyRec");
      lib.bindSymbol(cast(void**)&GuiScrollBar, "GuiScrollBar");
      lib.bindSymbol(cast(void**)&GuiGrid, "GuiGrid");
      lib.bindSymbol(cast(void**)&GuiListView, "GuiListView");
      lib.bindSymbol(cast(void**)&GuiListViewEx, "GuiListViewEx");
      lib.bindSymbol(cast(void**)&GuiMessageBox, "GuiMessageBox");
      lib.bindSymbol(cast(void**)&GuiTextInputBox, "GuiTextInputBox");
      lib.bindSymbol(cast(void**)&GuiColorPicker, "GuiColorPicker");
      lib.bindSymbol(cast(void**)&GuiLoadStyle, "GuiLoadStyle");
      lib.bindSymbol(cast(void**)&GuiLoadStyleDefault, "GuiLoadStyleDefault");
      lib.bindSymbol(cast(void**)&GuiIconText, "GuiIconText");
   }
   if (errorCount() != errCount) {
      loadedVersion = RaylibSupport.badLibrary;
   } else {
      loadedVersion = RaylibSupport.raylib250;
   }

   static if (raylibSupport == RaylibSupport.raylib260) {
      // altri bind
      lib.bindSymbol(cast(void**)&GetWindowPosition, "GetWindowPosition");
      lib.bindSymbol(cast(void**)&ColorFromNormalized, "ColorFromNormalized");
      lib.bindSymbol(cast(void**)&GetWorldToScreenEx, "GetWorldToScreenEx");
      lib.bindSymbol(cast(void**)&GetWorldToScreen2D, "GetWorldToScreen2D");
      lib.bindSymbol(cast(void**)&GetScreenToWorld2D, "GetScreenToWorld2D");
      lib.bindSymbol(cast(void**)&GetCameraMatrix2D, "GetCameraMatrix2D");

      if (errorCount() != errCount) {
         loadedVersion = RaylibSupport.badLibrary;
      } else {
         loadedVersion = RaylibSupport.raylib260;
      }
   }
   return loadedVersion;
}
