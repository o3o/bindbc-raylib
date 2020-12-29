# bindbc-raylib
This project provides both static (WIP) and dynamic bindings to the [raylib](https://www.raylib.com/) _a simple and easy-to-use library to enjoy videogames programming_ and [raygui](https://github.com/raysan5/raygui) _a simple and easy-to-use immediate-mode-gui library_.
See  [Wiki for more information](https://github.com/o3o/bindbc-raylib/wiki). 


## Compile raylib source code
You can [just compile raylib](https://github.com/o3o/bindbc-raylib/wiki/compile-raylib) or also include [support for raygui](https://github.com/o3o/bindbc-raylib/wiki/compile-raygui).

## Usage
### Add `bindbc-raylib` to your project
Add the package as a dependency in your `dub.json` or `dub.sdl` package description:

__dub.json__
```json
"dependencies": {
    "bindbc-raylib": "~>0.1.0"
}
```

__dub.sdl__
```
dependency "bindbc-raylib" version="~>0.1.0"
```


### Set raylib versions

In order to use [raylib version](https://github.com/o3o/bindbc-raylib/wiki/use-different-version) 3.0.0:

__dub.json__
```json
"versions": [ "RAYLIB_300" ],
```

__dub.sdl__
```
versions "RAYLIB_300"
```

### Loading raylib
The `loadRaylib` function is used to load all supported raylib functions.
The return value of `loadRaylib` can be used to determine which version of raylib actually loaded.
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

```d
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
