# bindbc-raylib
This project provides both static (WIP) and dynamic bindings to the [raylib](https://raylib.org/).

## Compile raylib
1. Clone `raylib`:
```
$ git clone https://github.com/raysan5/raygui.git
```

1. Compile shared library (see [raylib wiki](https://github.com/raysan5/raylib/wiki))
```
$ make RAYLIB_LIBTYPE=SHARED
$ sudo make install
```

### Compile with [raygui](https://github.com/raysan5/raygui)

1. Clone `raygui`:
```
$ git clone https://github.com/raysan5/raygui.git
```

1. Copy `raygui/src/*.h` to `raylib/src`

```
$ cd raygui
$ cp src/*.h ../raylib/src
```

1. Modify `src/Makefile` (see [raylib issue 1103](https://github.com/raysan5/raylib/issues/1103))
```
@@ -571,11 +571,13 @@ raudio.o : raudio.c raylib.h

 # Compile raygui module
 # NOTE: raygui header should be distributed with raylib.h

-raygui.o : raygui.c raygui.h
-       @echo #define RAYGUI_IMPLEMENTATION > raygui.c
-       @echo #include "$(RAYLIB_MODULE_RAYGUI_PATH)/raygui.h" > raygui.c
+raygui.o : raygui.c raygui.h gui_textbox_extended.h ricons.h
        $(CC) -c $< $(CFLAGS) $(INCLUDE_PATHS) -D$(PLATFORM) -DRAYGUI_IMPLEMENTATION

+raygui.c:
+       echo '#define RAYGUI_IMPLEMENTATION' > raygui.c
+       echo '#include "$(RAYLIB_MODULE_RAYGUI_PATH)/raygui.h"' >> raygui.c
```

1. Compile with raygui support (`RAYLIB_MODULE_RAYGUI=TREU`)
```
$ make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE
```

In order to use raygui support, add
```
versions "RAYGUI"
```
to your dub file (see `)xamples/gui`)


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
To enable raygui  add the `versions` to your dub file

__dub.json__
```
"versions": [
    "RAYGUI"
],
```

__dub.sdl__
```
versions "RAYLIB261" "RAYGUI"
```

## Enable support for raylib versions
Raylib versions can be configured by adding the appropriate version to a `versions` directive in your dub file

| raylib Version | Version ID |
| ---            | ---        |
| 2.5.0          | Default    |
| 2.6.1          | RAYLIB261  |


__dub.json__
```
"versions": [ "RAYLIB261" ],
```

__dub.sdl__
```
versions "RAYLIB261"
```

## Examples
You can find original raylib examples ported to D inside examples directory.

## Dependencies
- [bindbc-loader](https://github.com/BindBC/bindbc-loader)




