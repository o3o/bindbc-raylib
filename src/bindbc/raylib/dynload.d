module bindbc.raylib.dynload;

version(BindRaylib_Static) {}
else version = BindRaylib_Dynamic;

version(BindRaylib_Dynamic):

import bindbc.loader;

private {
    SharedLib lib;
    RaylibSupport loadedVersion;
}

enum RaylibSupport {
    noLibrary,
    badLibrary,
    raylib
}

void unloadRaylib()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

RaylibSupport loadedRaylibVersion() { return loadedVersion; }

bool isRaylibLoaded() { return lib != invalidHandle; }

RaylibSupport loadRaylib()
{
    version(Windows) {
        const(char)[][1] libNames = ["raylib.dll"];
    }
    else version(Posix) {
        const(char)[][1] libNames = [
            "raylib.so"
        ];
    }
    else static assert(0, "bindbc-raylib is not yet supported on this platform");

    RaylibSupport ret;
    foreach(name; libNames) {
        ret = loadRaylib(name.ptr);
        if(ret != RaylibSupport.noLibrary) break;
    }
    return ret;
}

RaylibSupport loadRaylib(const(char)* libName)
{
    // If the library isn't yet loaded, load it now.
    if(lib == invalidHandle) {
        lib = load(libName);
        if(lib == invalidHandle) {
            return RaylibSupport.noLibrary;
        }
    }

    auto errCount = errorCount();

    lib.bindSymbol(cast(void**)&KW_CreateButton, "KW_CreateButton");

    if(errorCount() != errCount) loadedVersion = RaylibSupport.badLibrary;
    else loadedVersion = RaylibSupport.kiwi;

    return loadedVersion;
}
