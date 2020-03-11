# bindbc-raylib
This project provides both static (WIP) and dynamic bindings to the [raylib](https://raylib.com/).

Based on commit `117696a8936007592f7fe7c0b7b227a805e3b74a` of raylib.

## Compile raylib
1. Clone `raylib`:
```
$ git clone https://github.com/raysan5/raylib.git
```

2. (Optional), create a new branch `bindbc`
```
$ git checkout -b bindbc 117696a8936007592f7fe7c0b7b227a805e3b74a
```


3. Compile shared library (see [raylib wiki](https://github.com/raysan5/raylib/wiki))
```
$ make RAYLIB_LIBTYPE=SHARED
$ sudo make install RAYLIB_LIBTYPE=SHARED
```

### Compile with [raygui](https://github.com/raysan5/raygui)
1. Clone `raygui`:
```
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

4. Compile with raygui support (`RAYLIB_MODULE_RAYGUI=TRUE`)
```
$ make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE
$ sudo make install PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE
```

In order to use raygui in your projects, add:
```
versions "RAYGUI"
```

## Add `bindbc-raylib` to your project
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

## Enable `raygui`
To enable raygui add `versions` to your dub file  (see `examples/gui`)

__dub.json__
```
"versions": [
    "RAYGUI"
],
```

__dub.sdl__
```
versions "RAYLIB260" "RAYGUI"
```

## Enable support for raylib versions
Raylib versions can be configured by adding the appropriate version to a `versions` directive in your dub file

| raylib Version | Version ID |
| ---            | ---        |
| 2.5.0          | Default    |
| 2.6.0          | RAYLIB260  |


__dub.json__
```
"versions": [ "RAYLIB260" ],
```

__dub.sdl__
```
versions "RAYLIB260"
```

## Examples
You can find original raylib examples ported to D inside examples directory.

## Dependencies
- [bindbc-loader](https://github.com/BindBC/bindbc-loader)
