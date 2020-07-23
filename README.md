# bindbc-raylib
This project provides both static (WIP) and dynamic bindings to the [raylib](https://www.raylib.com/) _a simple and easy-to-use library to enjoy videogames programming_ and [raygui](https://github.com/raysan5/raygui) _a simple and easy-to-use immediate-mode-gui library_.



## Compile raylib source code
You can only compile raylib or also include support for raygui.
In the following examples we use `~/cc/raylib` for raylib source code, `~/cc/raygui` for raygui source code and `~/d/bindbc-raylib` for bindbc-raylib source code.

### Compile only raylib

1. Clone `raylib`:
```
$ cd ~/cc
$ git clone https://github.com/raysan5/raylib.git
```

2. Create a new branch `bindbc`
This binding is based on commit `72443f8f25b1f8ded3b05da17857b7eeb1556b35` (May 2 11:56:24 2020 +0200)

```
$ git checkout -b bindbc 72443f8f
$ git describe --tags
3.0.0-70-g72443f8f
```
The tagged 3.0.0 release is older (April 1):
```
$ git log 3.0.0
commit 7ef114d1da2c34a70bba5442497103441647d8f3 (tag: 3.0.0)
Author: Ray <raysan5@gmail.com>
Date:   Wed Apr 1 11:07:01 2020 +0200
```
and is somewhat different from the version used here.__Do not use__

2. Compile shared library (see [raylib wiki](https://github.com/raysan5/raylib/wiki))
```
$ cd raylib/src
$ make RAYLIB_LIBTYPE=SHARED
$ sudo make install RAYLIB_LIBTYPE=SHARED
```

### Compile with [raygui](https://github.com/raysan5/raygui)
Follow the previous steps an then:

1. Clone `raygui`:
```
$ cd ~/cc
$ git clone https://github.com/raysan5/raygui.git
```

2. Copy `raygui/src/*.h` to `raylib/src`
```
$ cd raygui
$ cp src/*.h ../raylib/src
```

3. Modify `raylib/src/Makefile` in order to add icons support:
```
@@ -575,6 +575,7 @@ raygui.o : raygui.c raygui.h gui_textbox_extended.h ricons.h
        $(CC) -c $< $(CFLAGS) $(INCLUDE_PATHS) -D$(PLATFORM) -DRAYGUI_IMPLEMENTATION
 raygui.c:
        echo '#define RAYGUI_IMPLEMENTATION' > raygui.c
+       echo '#define RAYGUI_SUPPORT_ICONS' >> raygui.c
        echo '#include "$(RAYLIB_MODULE_RAYGUI_PATH)/raygui.h"' >> raygui.c
```
Or use `tools/Makefile_with_raygui_support`:
```
$ cd ~/cc/raylib
$ cp ~/d/bindbc-raylib/tools/Makefile_with_raygui_support src/Makefile
```

4. Compile with raygui support (`RAYLIB_MODULE_RAYGUI=TRUE`)
```
$ make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE
$ sudo make install PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE
```
`make install` installs libraries into `/usr/local/lib`. In order to install into different path use `DESTDIR`:

```
$ sudo make install RAYLIB_LIBTYPE=SHARED DESTDIR=/usr
```

## Usage
### Add `bindbc-raylib` to your project
Add the package as a dependency in your `dub.json` or `dub.sdl` package description:

__dub.json__
```
"dependencies": {
    "bindbc-raylib": "~>0.1.0"
}
```

__dub.sdl__
```
dependency "bindbc-raylib" version="~>0.1.0"
```

### Enable `raygui`
To enable raygui add `versions` to your dub file  (see `examples/gui`)

__dub.json__
```
"versions": [
    "RAYGUI"
],
```

__dub.sdl__
```
versions "RAYGUI"
```

### Enable support for raylib versions
Raylib versions can be configured by adding the appropriate version to a `versions` directive in your dub file.
bindbc-raylib defines a D version identifier for each raylib version.
The following table lists each identifier and the raylib versions they enable:

| raylib version     | raylib commit | Version ID |
| ---                | ---           | ---        |
| 2.5.0              |               | Default    |
| 2.6.0              | `117696a8`    | RAYLIB_260 |
| 3.0.0-70-g72443f8f | `72443f8f`    | RAYLIB_300 |

For examples, in order to use raylib version 2.6.0:

__dub.json__
```
"versions": [ "RAYLIB_260" ],
```

__dub.sdl__
```
versions "RAYLIB_260"
```

### Loading raylib
The `loadRaylib` function is used to load all supported raylib functions.
The return value of `loadRaylib`  can be used to determine which version of raylib actually loaded.
```d
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   // raylibSupport is an enum with current raylib version
   if (retVal != raylibSupport) {
      // error
   } else {
      // successful
   }
}
```

## Examples
You can find [original raylib examples](https://www.raylib.com/examples.html) ported to D inside [examples directory](https://github.com/o3o/bindbc-raylib/tree/master/examples).

A simple example:

```
import std.stdio;
import bindbc.raylib;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport) {
      writeln("ERROR: ", retVal);
   } else {
      writeln("VERSION: ", retVal);
      writeln("loaded : ", loadedRaylibVersion);

      enum SCREEN_WIDTH = 800;
      enum SCREEN_HEIGHT = 450;

      // Initialization
      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - basic window");

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      // Main game loop
      while (!WindowShouldClose()) {
         // Draw
         BeginDrawing();
         ClearBackground(GOLD);
         DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
         EndDrawing();
      }
      CloseWindow();
   }
}
```

## Dependencies
- [bindbc-loader](https://github.com/BindBC/bindbc-loader)
