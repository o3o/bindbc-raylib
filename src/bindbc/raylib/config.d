module bindbc.raylib.config;

enum RaylibSupport {
   noLibrary,
   badLibrary,
   raylib250,
   raylib260,
   raylib300
}

version (RAYLIB_300) enum raylibSupport = RaylibSupport.raylib300;
else version (RAYLIB_260) enum raylibSupport = RaylibSupport.raylib260;
else enum raylibSupport = RaylibSupport.raylib250;
