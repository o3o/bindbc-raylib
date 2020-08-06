module bindbc.raylib.config;

enum RaylibSupport {
   noLibrary,
   badLibrary,
   raylib250,
   raylib260,
   raylib300,
   raylib301 // 3.0.0-70-g72443f8f
}

version (RAYLIB_301) {
   enum raylibSupport = RaylibSupport.raylib301;
   pragma(msg, "raylib version 301 (3.0.0-70)");
} else version (RAYLIB_300) {
   enum raylibSupport = RaylibSupport.raylib300;
   pragma(msg, "raylib version 300");
} else version (RAYLIB_260) {
   enum raylibSupport = RaylibSupport.raylib260;
   pragma(msg, "raylib version 260");
} else {
   enum raylibSupport = RaylibSupport.raylib250;
   pragma(msg, "raylib version 250");
}
