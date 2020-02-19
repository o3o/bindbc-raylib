module bindbc.raylib.config;

enum RaylibSupport {
   noLibrary,
   badLibrary,
   raylib250,
   raylib260
}

version (RAYLIB_260)
   enum raylibSupport = RaylibSupport.raylib260;
else
   enum raylibSupport = RaylibSupport.raylib250;
