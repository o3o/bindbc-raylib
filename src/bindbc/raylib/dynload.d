module bindbc.raylib.dynload;

import bindbc.raylib.config;
import bindbc.raylib.bind.core;
import bindbc.raylib.bind.shapes;
import bindbc.raylib.bind.texture;
import bindbc.raylib.bind.text;
import bindbc.raylib.bind.models;
import bindbc.raylib.bind.shaders;
import bindbc.raylib.bind.audio;
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
      const(char)[][3] libNames = ["libraylib.so", "/usr/local/lib/libraylib.so" //make install PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED
      , "/usr/lib/libraylib.so"];
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
   lib = load(libName);
   if (lib == invalidHandle) {
      return RaylibSupport.noLibrary;
   }

   auto errCount = errorCount();
   loadedVersion = RaylibSupport.badLibrary;

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

   // texture
   //
   lib.bindSymbol(cast(void**)&LoadImage, "LoadImage");
   lib.bindSymbol(cast(void**)&LoadImageEx, "LoadImageEx");
   lib.bindSymbol(cast(void**)&LoadImageRaw, "LoadImageRaw");
   lib.bindSymbol(cast(void**)&ExportImage, "ExportImage");
   lib.bindSymbol(cast(void**)&ExportImageAsCode, "ExportImageAsCode");
   lib.bindSymbol(cast(void**)&LoadTexture, "LoadTexture");
   lib.bindSymbol(cast(void**)&LoadTextureFromImage, "LoadTextureFromImage");
   lib.bindSymbol(cast(void**)&LoadTextureCubemap, "LoadTextureCubemap");
   lib.bindSymbol(cast(void**)&LoadRenderTexture, "LoadRenderTexture");
   lib.bindSymbol(cast(void**)&UnloadImage, "UnloadImage");
   lib.bindSymbol(cast(void**)&UnloadTexture, "UnloadTexture");
   lib.bindSymbol(cast(void**)&UnloadRenderTexture, "UnloadRenderTexture");
   lib.bindSymbol(cast(void**)&GetImageData, "GetImageData");
   lib.bindSymbol(cast(void**)&GetImageDataNormalized, "GetImageDataNormalized");
   lib.bindSymbol(cast(void**)&GetImageAlphaBorder, "GetImageAlphaBorder");
   lib.bindSymbol(cast(void**)&GetPixelDataSize, "GetPixelDataSize");
   lib.bindSymbol(cast(void**)&GetTextureData, "GetTextureData");
   lib.bindSymbol(cast(void**)&GetScreenData, "GetScreenData");
   lib.bindSymbol(cast(void**)&UpdateTexture, "UpdateTexture");
   lib.bindSymbol(cast(void**)&ImageCopy, "ImageCopy");
   lib.bindSymbol(cast(void**)&ImageFromImage, "ImageFromImage");
   lib.bindSymbol(cast(void**)&ImageToPOT, "ImageToPOT");
   lib.bindSymbol(cast(void**)&ImageFormat, "ImageFormat");
   lib.bindSymbol(cast(void**)&ImageAlphaMask, "ImageAlphaMask");
   lib.bindSymbol(cast(void**)&ImageAlphaClear, "ImageAlphaClear");
   lib.bindSymbol(cast(void**)&ImageAlphaCrop, "ImageAlphaCrop");
   lib.bindSymbol(cast(void**)&ImageAlphaPremultiply, "ImageAlphaPremultiply");
   lib.bindSymbol(cast(void**)&ImageCrop, "ImageCrop");
   lib.bindSymbol(cast(void**)&ImageResize, "ImageResize");
   lib.bindSymbol(cast(void**)&ImageResizeNN, "ImageResizeNN");
   lib.bindSymbol(cast(void**)&ImageResizeCanvas, "ImageResizeCanvas");
   lib.bindSymbol(cast(void**)&ImageMipmaps, "ImageMipmaps");
   lib.bindSymbol(cast(void**)&ImageDither, "ImageDither");
   lib.bindSymbol(cast(void**)&ImageExtractPalette, "ImageExtractPalette");
   lib.bindSymbol(cast(void**)&ImageText, "ImageText");
   lib.bindSymbol(cast(void**)&ImageTextEx, "ImageTextEx");
   lib.bindSymbol(cast(void**)&ImageDraw, "ImageDraw");
   lib.bindSymbol(cast(void**)&ImageDrawRectangle, "ImageDrawRectangle");
   lib.bindSymbol(cast(void**)&ImageDrawRectangleLines, "ImageDrawRectangleLines");
   lib.bindSymbol(cast(void**)&ImageDrawText, "ImageDrawText");
   lib.bindSymbol(cast(void**)&ImageDrawTextEx, "ImageDrawTextEx");
   lib.bindSymbol(cast(void**)&ImageFlipVertical, "ImageFlipVertical");
   lib.bindSymbol(cast(void**)&ImageFlipHorizontal, "ImageFlipHorizontal");
   lib.bindSymbol(cast(void**)&ImageRotateCW, "ImageRotateCW");
   lib.bindSymbol(cast(void**)&ImageRotateCCW, "ImageRotateCCW");
   lib.bindSymbol(cast(void**)&ImageColorTint, "ImageColorTint");
   lib.bindSymbol(cast(void**)&ImageColorInvert, "ImageColorInvert");
   lib.bindSymbol(cast(void**)&ImageColorGrayscale, "ImageColorGrayscale");
   lib.bindSymbol(cast(void**)&ImageColorContrast, "ImageColorContrast");
   lib.bindSymbol(cast(void**)&ImageColorBrightness, "ImageColorBrightness");

   lib.bindSymbol(cast(void**)&ImageColorReplace, "ImageColorReplace");
   lib.bindSymbol(cast(void**)&GenImageColor, "GenImageColor");
   lib.bindSymbol(cast(void**)&GenImageGradientV, "GenImageGradientV");
   lib.bindSymbol(cast(void**)&GenImageGradientH, "GenImageGradientH");
   lib.bindSymbol(cast(void**)&GenImageGradientRadial, "GenImageGradientRadial");
   lib.bindSymbol(cast(void**)&GenImageChecked, "GenImageChecked");
   lib.bindSymbol(cast(void**)&GenImageWhiteNoise, "GenImageWhiteNoise");
   lib.bindSymbol(cast(void**)&GenImagePerlinNoise, "GenImagePerlinNoise");
   lib.bindSymbol(cast(void**)&GenImageCellular, "GenImageCellular");
   lib.bindSymbol(cast(void**)&GenTextureMipmaps, "GenTextureMipmaps");
   lib.bindSymbol(cast(void**)&SetTextureFilter, "SetTextureFilter");
   lib.bindSymbol(cast(void**)&SetTextureWrap, "SetTextureWrap");
   lib.bindSymbol(cast(void**)&DrawTexture, "DrawTexture");
   lib.bindSymbol(cast(void**)&DrawTextureV, "DrawTextureV");
   lib.bindSymbol(cast(void**)&DrawTextureEx, "DrawTextureEx");
   lib.bindSymbol(cast(void**)&DrawTextureRec, "DrawTextureRec");
   lib.bindSymbol(cast(void**)&DrawTextureQuad, "DrawTextureQuad");
   lib.bindSymbol(cast(void**)&DrawTexturePro, "DrawTexturePro");
   lib.bindSymbol(cast(void**)&DrawTextureNPatch, "DrawTextureNPatch");

   // text
   lib.bindSymbol(cast(void**)&GetFontDefault, "GetFontDefault");
   lib.bindSymbol(cast(void**)&LoadFont, "LoadFont");
   lib.bindSymbol(cast(void**)&LoadFontEx, "LoadFontEx");
   lib.bindSymbol(cast(void**)&LoadFontFromImage, "LoadFontFromImage");
   lib.bindSymbol(cast(void**)&LoadFontData, "LoadFontData");
   lib.bindSymbol(cast(void**)&GenImageFontAtlas, "GenImageFontAtlas");
   lib.bindSymbol(cast(void**)&UnloadFont, "UnloadFont");
   lib.bindSymbol(cast(void**)&DrawFPS, "DrawFPS");
   lib.bindSymbol(cast(void**)&DrawText, "DrawText");
   lib.bindSymbol(cast(void**)&DrawTextEx, "DrawTextEx");
   lib.bindSymbol(cast(void**)&DrawTextRec, "DrawTextRec");
   lib.bindSymbol(cast(void**)&DrawTextRecEx, "DrawTextRecEx");
   lib.bindSymbol(cast(void**)&DrawTextCodepoint, "DrawTextCodepoint");
   lib.bindSymbol(cast(void**)&MeasureText, "MeasureText");
   lib.bindSymbol(cast(void**)&MeasureTextEx, "MeasureTextEx");
   lib.bindSymbol(cast(void**)&GetGlyphIndex, "GetGlyphIndex");
   lib.bindSymbol(cast(void**)&TextCopy, "TextCopy");
   lib.bindSymbol(cast(void**)&TextIsEqual, "TextIsEqual");
   lib.bindSymbol(cast(void**)&TextLength, "TextLength");
   lib.bindSymbol(cast(void**)&TextFormat, "TextFormat");
   lib.bindSymbol(cast(void**)&TextSubtext, "TextSubtext");
   lib.bindSymbol(cast(void**)&TextReplace, "TextReplace");
   lib.bindSymbol(cast(void**)&TextInsert, "TextInsert");
   lib.bindSymbol(cast(void**)&TextJoin, "TextJoin");
   lib.bindSymbol(cast(void**)&TextSplit, "TextSplit");
   lib.bindSymbol(cast(void**)&TextAppend, "TextAppend");
   lib.bindSymbol(cast(void**)&TextFindIndex, "TextFindIndex");
   lib.bindSymbol(cast(void**)&TextToUpper, "TextToUpper");
   lib.bindSymbol(cast(void**)&TextToLower, "TextToLower");
   lib.bindSymbol(cast(void**)&TextToPascal, "TextToPascal");
   lib.bindSymbol(cast(void**)&TextToInteger, "TextToInteger");
   lib.bindSymbol(cast(void**)&TextToUtf8, "TextToUtf8");
   lib.bindSymbol(cast(void**)&GetCodepoints, "GetCodepoints");
   lib.bindSymbol(cast(void**)&GetCodepointsCount, "GetCodepointsCount");
   lib.bindSymbol(cast(void**)&GetNextCodepoint, "GetNextCodepoint");
   lib.bindSymbol(cast(void**)&CodepointToUtf8, "CodepointToUtf8");
   // models

   lib.bindSymbol(cast(void**)&DrawLine3D, "DrawLine3D");
   lib.bindSymbol(cast(void**)&DrawPoint3D, "DrawPoint3D");
   lib.bindSymbol(cast(void**)&DrawCircle3D, "DrawCircle3D");
   lib.bindSymbol(cast(void**)&DrawCube, "DrawCube");
   lib.bindSymbol(cast(void**)&DrawCubeV, "DrawCubeV");
   lib.bindSymbol(cast(void**)&DrawCubeWires, "DrawCubeWires");
   lib.bindSymbol(cast(void**)&DrawCubeWiresV, "DrawCubeWiresV");
   lib.bindSymbol(cast(void**)&DrawCubeTexture, "DrawCubeTexture");
   lib.bindSymbol(cast(void**)&DrawSphere, "DrawSphere");
   lib.bindSymbol(cast(void**)&DrawSphereEx, "DrawSphereEx");
   lib.bindSymbol(cast(void**)&DrawSphereWires, "DrawSphereWires");
   lib.bindSymbol(cast(void**)&DrawCylinder, "DrawCylinder");
   lib.bindSymbol(cast(void**)&DrawCylinderWires, "DrawCylinderWires");
   lib.bindSymbol(cast(void**)&DrawPlane, "DrawPlane");
   lib.bindSymbol(cast(void**)&DrawRay, "DrawRay");
   lib.bindSymbol(cast(void**)&DrawGrid, "DrawGrid");
   lib.bindSymbol(cast(void**)&DrawGizmo, "DrawGizmo");
   lib.bindSymbol(cast(void**)&LoadModel, "LoadModel");
   lib.bindSymbol(cast(void**)&LoadModelFromMesh, "LoadModelFromMesh");
   lib.bindSymbol(cast(void**)&UnloadModel, "UnloadModel");
   lib.bindSymbol(cast(void**)&LoadMeshes, "LoadMeshes");
   lib.bindSymbol(cast(void**)&ExportMesh, "ExportMesh");
   lib.bindSymbol(cast(void**)&UnloadMesh, "UnloadMesh");
   lib.bindSymbol(cast(void**)&LoadMaterials, "LoadMaterials");
   lib.bindSymbol(cast(void**)&LoadMaterialDefault, "LoadMaterialDefault");
   lib.bindSymbol(cast(void**)&UnloadMaterial, "UnloadMaterial");
   lib.bindSymbol(cast(void**)&SetMaterialTexture, "SetMaterialTexture");
   lib.bindSymbol(cast(void**)&SetModelMeshMaterial, "SetModelMeshMaterial");
   lib.bindSymbol(cast(void**)&LoadModelAnimations, "LoadModelAnimations");
   lib.bindSymbol(cast(void**)&UpdateModelAnimation, "UpdateModelAnimation");
   lib.bindSymbol(cast(void**)&UnloadModelAnimation, "UnloadModelAnimation");
   lib.bindSymbol(cast(void**)&IsModelAnimationValid, "IsModelAnimationValid");
   lib.bindSymbol(cast(void**)&GenMeshPoly, "GenMeshPoly");
   lib.bindSymbol(cast(void**)&GenMeshPlane, "GenMeshPlane");
   lib.bindSymbol(cast(void**)&GenMeshCube, "GenMeshCube");
   lib.bindSymbol(cast(void**)&GenMeshSphere, "GenMeshSphere");
   lib.bindSymbol(cast(void**)&GenMeshHemiSphere, "GenMeshHemiSphere");
   lib.bindSymbol(cast(void**)&GenMeshCylinder, "GenMeshCylinder");
   lib.bindSymbol(cast(void**)&GenMeshTorus, "GenMeshTorus");
   lib.bindSymbol(cast(void**)&GenMeshKnot, "GenMeshKnot");
   lib.bindSymbol(cast(void**)&GenMeshHeightmap, "GenMeshHeightmap");
   lib.bindSymbol(cast(void**)&GenMeshCubicmap, "GenMeshCubicmap");
   lib.bindSymbol(cast(void**)&MeshBoundingBox, "MeshBoundingBox");
   lib.bindSymbol(cast(void**)&MeshTangents, "MeshTangents");
   lib.bindSymbol(cast(void**)&MeshBinormals, "MeshBinormals");
   lib.bindSymbol(cast(void**)&DrawModel, "DrawModel");
   lib.bindSymbol(cast(void**)&DrawModelEx, "DrawModelEx");
   lib.bindSymbol(cast(void**)&DrawModelWires, "DrawModelWires");
   lib.bindSymbol(cast(void**)&DrawModelWiresEx, "DrawModelWiresEx");
   lib.bindSymbol(cast(void**)&DrawBoundingBox, "DrawBoundingBox");
   lib.bindSymbol(cast(void**)&DrawBillboard, "DrawBillboard");
   lib.bindSymbol(cast(void**)&DrawBillboardRec, "DrawBillboardRec");
   lib.bindSymbol(cast(void**)&CheckCollisionSpheres, "CheckCollisionSpheres");
   lib.bindSymbol(cast(void**)&CheckCollisionBoxes, "CheckCollisionBoxes");
   lib.bindSymbol(cast(void**)&CheckCollisionBoxSphere, "CheckCollisionBoxSphere");
   lib.bindSymbol(cast(void**)&CheckCollisionRaySphere, "CheckCollisionRaySphere");
   lib.bindSymbol(cast(void**)&CheckCollisionRaySphereEx, "CheckCollisionRaySphereEx");
   lib.bindSymbol(cast(void**)&CheckCollisionRayBox, "CheckCollisionRayBox");
   lib.bindSymbol(cast(void**)&GetCollisionRayModel, "GetCollisionRayModel");
   lib.bindSymbol(cast(void**)&GetCollisionRayTriangle, "GetCollisionRayTriangle");
   lib.bindSymbol(cast(void**)&GetCollisionRayGround, "GetCollisionRayGround");
   // shaders
   lib.bindSymbol(cast(void**)&LoadShader, "LoadShader");
   lib.bindSymbol(cast(void**)&LoadShaderCode, "LoadShaderCode");
   lib.bindSymbol(cast(void**)&UnloadShader, "UnloadShader");
   lib.bindSymbol(cast(void**)&GetShaderDefault, "GetShaderDefault");
   lib.bindSymbol(cast(void**)&GetTextureDefault, "GetTextureDefault");
   lib.bindSymbol(cast(void**)&GetShapesTexture, "GetShapesTexture");
   lib.bindSymbol(cast(void**)&GetShapesTextureRec, "GetShapesTextureRec");
   lib.bindSymbol(cast(void**)&SetShapesTexture, "SetShapesTexture");
   lib.bindSymbol(cast(void**)&GetShaderLocation, "GetShaderLocation");
   lib.bindSymbol(cast(void**)&SetShaderValue, "SetShaderValue");
   lib.bindSymbol(cast(void**)&SetShaderValueV, "SetShaderValueV");
   lib.bindSymbol(cast(void**)&SetShaderValueMatrix, "SetShaderValueMatrix");
   lib.bindSymbol(cast(void**)&SetShaderValueTexture, "SetShaderValueTexture");
   lib.bindSymbol(cast(void**)&SetMatrixProjection, "SetMatrixProjection");
   lib.bindSymbol(cast(void**)&SetMatrixModelview, "SetMatrixModelview");
   lib.bindSymbol(cast(void**)&GetMatrixModelview, "GetMatrixModelview");
   lib.bindSymbol(cast(void**)&GetMatrixProjection, "GetMatrixProjection");
   lib.bindSymbol(cast(void**)&BeginShaderMode, "BeginShaderMode");
   lib.bindSymbol(cast(void**)&EndShaderMode, "EndShaderMode");
   lib.bindSymbol(cast(void**)&BeginBlendMode, "BeginBlendMode");
   lib.bindSymbol(cast(void**)&EndBlendMode, "EndBlendMode");
   lib.bindSymbol(cast(void**)&InitVrSimulator, "InitVrSimulator");
   lib.bindSymbol(cast(void**)&CloseVrSimulator, "CloseVrSimulator");
   lib.bindSymbol(cast(void**)&UpdateVrTracking, "UpdateVrTracking");
   lib.bindSymbol(cast(void**)&SetVrConfiguration, "SetVrConfiguration");
   lib.bindSymbol(cast(void**)&IsVrSimulatorReady, "IsVrSimulatorReady");
   lib.bindSymbol(cast(void**)&ToggleVrMode, "ToggleVrMode");
   lib.bindSymbol(cast(void**)&BeginVrDrawing, "BeginVrDrawing");
   lib.bindSymbol(cast(void**)&EndVrDrawing, "EndVrDrawing");

   // audio
   lib.bindSymbol(cast(void**)&InitAudioDevice, "InitAudioDevice");
   lib.bindSymbol(cast(void**)&CloseAudioDevice, "CloseAudioDevice");
   lib.bindSymbol(cast(void**)&IsAudioDeviceReady, "IsAudioDeviceReady");
   lib.bindSymbol(cast(void**)&SetMasterVolume, "SetMasterVolume");
   lib.bindSymbol(cast(void**)&LoadWave, "LoadWave");
   lib.bindSymbol(cast(void**)&LoadSound, "LoadSound");
   lib.bindSymbol(cast(void**)&LoadSoundFromWave, "LoadSoundFromWave");
   lib.bindSymbol(cast(void**)&UpdateSound, "UpdateSound");
   lib.bindSymbol(cast(void**)&UnloadWave, "UnloadWave");

   lib.bindSymbol(cast(void**)&UnloadSound, "UnloadSound");
   lib.bindSymbol(cast(void**)&ExportWave, "ExportWave");
   lib.bindSymbol(cast(void**)&ExportWaveAsCode, "ExportWaveAsCode");
   lib.bindSymbol(cast(void**)&PlaySound, "PlaySound");
   lib.bindSymbol(cast(void**)&StopSound, "StopSound");
   lib.bindSymbol(cast(void**)&PauseSound, "PauseSound");
   lib.bindSymbol(cast(void**)&ResumeSound, "ResumeSound");
   lib.bindSymbol(cast(void**)&PlaySoundMulti, "PlaySoundMulti");
   lib.bindSymbol(cast(void**)&StopSoundMulti, "StopSoundMulti");
   lib.bindSymbol(cast(void**)&GetSoundsPlaying, "GetSoundsPlaying");
   lib.bindSymbol(cast(void**)&IsSoundPlaying, "IsSoundPlaying");
   lib.bindSymbol(cast(void**)&SetSoundVolume, "SetSoundVolume");
   lib.bindSymbol(cast(void**)&SetSoundPitch, "SetSoundPitch");
   lib.bindSymbol(cast(void**)&WaveFormat, "WaveFormat");
   lib.bindSymbol(cast(void**)&WaveCopy, "WaveCopy");
   lib.bindSymbol(cast(void**)&WaveCrop, "WaveCrop");
   lib.bindSymbol(cast(void**)&GetWaveData, "GetWaveData");
   lib.bindSymbol(cast(void**)&LoadMusicStream, "LoadMusicStream");
   lib.bindSymbol(cast(void**)&UnloadMusicStream, "UnloadMusicStream");
   lib.bindSymbol(cast(void**)&PlayMusicStream, "PlayMusicStream");
   lib.bindSymbol(cast(void**)&UpdateMusicStream, "UpdateMusicStream");
   lib.bindSymbol(cast(void**)&StopMusicStream, "StopMusicStream");
   lib.bindSymbol(cast(void**)&PauseMusicStream, "PauseMusicStream");
   lib.bindSymbol(cast(void**)&ResumeMusicStream, "ResumeMusicStream");
   lib.bindSymbol(cast(void**)&IsMusicPlaying, "IsMusicPlaying");
   lib.bindSymbol(cast(void**)&SetMusicVolume, "SetMusicVolume");
   lib.bindSymbol(cast(void**)&SetMusicPitch, "SetMusicPitch");
   lib.bindSymbol(cast(void**)&SetMusicLoopCount, "SetMusicLoopCount");
   lib.bindSymbol(cast(void**)&GetMusicTimeLength, "GetMusicTimeLength");
   lib.bindSymbol(cast(void**)&GetMusicTimePlayed, "GetMusicTimePlayed");
   lib.bindSymbol(cast(void**)&InitAudioStream, "InitAudioStream");
   lib.bindSymbol(cast(void**)&UpdateAudioStream, "UpdateAudioStream");
   lib.bindSymbol(cast(void**)&CloseAudioStream, "CloseAudioStream");
   lib.bindSymbol(cast(void**)&PlayAudioStream, "PlayAudioStream");
   lib.bindSymbol(cast(void**)&PauseAudioStream, "PauseAudioStream");
   lib.bindSymbol(cast(void**)&ResumeAudioStream, "ResumeAudioStream");
   lib.bindSymbol(cast(void**)&IsAudioStreamPlaying, "IsAudioStreamPlaying");
   lib.bindSymbol(cast(void**)&StopAudioStream, "StopAudioStream");
   lib.bindSymbol(cast(void**)&SetAudioStreamVolume, "SetAudioStreamVolume");
   lib.bindSymbol(cast(void**)&SetAudioStreamPitch, "SetAudioStreamPitch");

   // gui
   version (RAYGUI) {
      pragma(msg, "RAYGUI");

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
      // Gui icons functionality
      lib.bindSymbol(cast(void**)&GuiDrawIcon, "GuiDrawIcon");
      lib.bindSymbol(cast(void**)&GuiGetIcons, "GuiGetIcons");
      lib.bindSymbol(cast(void**)&GuiGetIconData, "GuiGetIconData");
      lib.bindSymbol(cast(void**)&GuiSetIconData, "GuiSetIconData");
      lib.bindSymbol(cast(void**)&GuiSetIconPixel, "GuiSetIconPixel");
      lib.bindSymbol(cast(void**)&GuiClearIconPixel, "GuiClearIconPixel");
      lib.bindSymbol(cast(void**)&GuiCheckIconPixel, "GuiCheckIconPixel");
      lib.bindSymbol(cast(void**)&GuiColorBarAlpha, "GuiColorBarAlpha");
   }

   if (errorCount() != errCount) {
      return RaylibSupport.badLibrary;
   } else {
      loadedVersion = RaylibSupport.raylib250;
   }

   static if (raylibSupport >= RaylibSupport.raylib260) {
      lib.bindSymbol(cast(void**)&IsAudioStreamProcessed, "IsAudioStreamProcessed");
      lib.bindSymbol(cast(void**)&GetWindowPosition, "GetWindowPosition");
      lib.bindSymbol(cast(void**)&ColorFromNormalized, "ColorFromNormalized");
      lib.bindSymbol(cast(void**)&GetWorldToScreenEx, "GetWorldToScreenEx");
      lib.bindSymbol(cast(void**)&GetWorldToScreen2D, "GetWorldToScreen2D");
      lib.bindSymbol(cast(void**)&GetScreenToWorld2D, "GetScreenToWorld2D");
      lib.bindSymbol(cast(void**)&GetCameraMatrix2D, "GetCameraMatrix2D");

      if (errorCount() != errCount) {
         return RaylibSupport.badLibrary;
      } else {
         loadedVersion = RaylibSupport.raylib260;
      }
   }
   static if (raylibSupport == RaylibSupport.raylib300) {
      // only in 3.0.0
      lib.bindSymbol(cast(void**)&LoadImagePro, "LoadImagePro");
   }
   static if (raylibSupport >= RaylibSupport.raylib300) {
      lib.bindSymbol(cast(void**)&IsWindowFullscreen, "IsWindowFullscreen");
      lib.bindSymbol(cast(void**)&ImageClearBackground, "ImageClearBackground");
      lib.bindSymbol(cast(void**)&ImageDrawPixel, "ImageDrawPixel");
      lib.bindSymbol(cast(void**)&ImageClearBackground, "ImageClearBackground");
      lib.bindSymbol(cast(void**)&ImageDrawPixel, "ImageDrawPixel");
      lib.bindSymbol(cast(void**)&ImageDrawPixelV, "ImageDrawPixelV");
      lib.bindSymbol(cast(void**)&ImageDrawLine, "ImageDrawLine");
      lib.bindSymbol(cast(void**)&ImageDrawLineV, "ImageDrawLineV");
      lib.bindSymbol(cast(void**)&ImageDrawCircle, "ImageDrawCircle");
      lib.bindSymbol(cast(void**)&ImageDrawCircleV, "ImageDrawCircleV");
      lib.bindSymbol(cast(void**)&ImageDrawRectangleV, "ImageDrawRectangleV");
      lib.bindSymbol(cast(void**)&ImageDrawRectangleRec, "ImageDrawRectangleRec");

      lib.bindSymbol(cast(void**)&GenTextureCubemap, "GenTextureCubemap");
      lib.bindSymbol(cast(void**)&GenTextureIrradiance, "GenTextureIrradiance");
      lib.bindSymbol(cast(void**)&GenTexturePrefilter, "GenTexturePrefilter");
      lib.bindSymbol(cast(void**)&GenTextureBRDF, "GenTextureBRDF");
      lib.bindSymbol(cast(void**)&SetAudioStreamBufferSizeDefault, "SetAudioStreamBufferSizeDefault");
      lib.bindSymbol(cast(void**)&LoadFileText, "LoadFileText");

      if (errorCount() != errCount) {
         return RaylibSupport.badLibrary;
      } else {
         loadedVersion = RaylibSupport.raylib300;
      }
   }
   static if (raylibSupport >= RaylibSupport.raylib300_70) {
      lib.bindSymbol(cast(void**)&IsWindowFocused, "IsWindowFocused");
      lib.bindSymbol(cast(void**)&GetWindowScaleDPI, "GetWindowScaleDPI");
      if (errorCount() != errCount) {
         return RaylibSupport.badLibrary;
      } else {
         loadedVersion = RaylibSupport.raylib300_70;
      }
   }

   return loadedVersion;
}
