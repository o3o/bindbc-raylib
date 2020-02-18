module bindbc.raylib.config;

enum RaylibSupport {
   noLibrary,
   badLibrary,
   raylib25,
   raylib261
}

version (RAYLIB_261)
   enum raylibSupport = RaylibSupport.raylib261;
else
   enum raylibSupport = RaylibSupport.raylib25;
