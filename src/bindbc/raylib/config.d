module bindbc.raylib.config;

enum RaylibSupport {
   noLibrary,
   badLibrary,
   raylib250,
   raylib260,
   raylib300,
   raylib300_70 // 3.0.0-70-g72443f8f
}

version(BindBC_Static) version = BindRaylib_Static;
version(BindRaylib_Static) enum staticBinding = true;
else enum staticBinding = false;

version (RAYLIB_300_70) {
   enum raylibSupport = RaylibSupport.raylib300_70;
   pragma(msg, "raylib version 300_70 (3.0.0-70)");
} else version (RAYLIB_301) {
   enum raylibSupport = RaylibSupport.raylib300_70;
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
