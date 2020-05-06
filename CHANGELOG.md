# raylib changelog


## [Unreleased]

- Fix gui examples issue

### ADDED
- IsWindowFocused
- IsWindowFullscreen
- GetWindowScaleDPI
- ImageClearBackground
- ImageDrawPixel
- ImageDrawPixelV
- ImageDrawLine
- ImageDrawLineV
- ImageDrawCircle
- ImageDrawCircleV
- ImageDrawRectangleV
- ImageDrawRectangleRec
- GenTextureCubemap
- GenTextureIrradiance
- GenTexturePrefilter
- GenTextureBRDF
- IsAudioStreamProcessed
- SetAudioStreamBufferSizeDefault

### NOT YET IMPLEMENTED
- SetTraceLogLevel
- SetTraceLogExit
- SetTraceLogCallback
- TraceLog
- GetRandomValue
- LoadFileData
- SaveFileData
- LoadFileText
- SaveFileText
- CompressData
- DecompressData
- SaveStorageValue
- LoadStorageValue
- OpenURL
- GetGamepadName
- LoadFileText
- LoadImagePro
- Struct Music, AudioStream...

### REMOVED
- LoadWaveEx

### RENAMED
- IsAudioBufferProcessed to IsAudioStreamProcessed
- LoadText to LoadFileText


### REDESIGNED:
- struct Font, character rectangles have been moved out from CharInfo to Font
- struct CharInfo, now includes directly an Image of the glyph
- struct Font, now includes directly an Image of the glyph


## [0.2.0] - 2020-02-19
- Add semver
- Fix not valid raylib version
- Add texture, text, models, shaders and audio
- Change raylib version from 261 to 260
- Add ricons
- Merge pull request #1 from trikko/patch-1
- Add gui
- Add models
- Add text
- Add shapes and texture
- Add dub.selections
- Add examples

## [0.1.0] - 2020-02-05
- Initial commit
