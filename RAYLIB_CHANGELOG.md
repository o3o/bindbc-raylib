-----------------------------------------------
Release:     raylib 3.0 (01 April 2020)
-----------------------------------------------

Detailed changes:
[core] ADDED: GetWorldToScreen2D()- Get screen space position for a 2d camera world space position, by @arvyy
[core] ADDED: GetScreenToWorld2D() - Get world space position for a 2d camera screen space position, by @arvyy
[core] ADDED: GetWorldToScreenEx() - Get size position for a 3d world space position
[core] ADDED: DirectoryExists() - Check if a directory path exists
[core] ADDED: GetPrevDirectoryPath() - Get previous directory path for a given path
[core] ADDED: CompressData() - Compress data (DEFLATE algorythm)
[core] ADDED: DecompressData() - Decompress data (DEFLATE algorythm)
[core] ADDED: GetWindowPosition() - Get window position XY on monitor
[core] ADDED: LoadFileData() - Load file data as byte array (read)
[core] ADDED: SaveFileData() - Save data to file from byte array (write)
[core] ADDED: LoadFileText() - Load text data from file (read), returns a '\0' terminated string
[core] ADDED: SaveFileText() - Save text data to file (write), string must be '\0' terminated
[rlgl] ADDED: GetMatrixProjection(), by @chriscamacho
[rlgl] ADDED: rlUpdateMeshAt() - Update vertex or index data on GPU, at index, by @brankoku
[raymath] ADDED: MatrixRotateXYZ(), by @chriscamacho
[raymath] RENAMED: Vector3Multiply() to Vector3Scale()
[shapes] ADDED: DrawTriangleStrip() - Draw a triangle strip defined by points
[shapes] ADDED: DrawEllipse() - Draw ellipse
[shapes] ADDED: DrawEllipseLines() - Draw ellipse outline
[shapes] ADDED: DrawPolyLines() - Draw a polygon outline of n sides
[textures] ADDED: LoadAnimatedGIF() - Load animated GIF file
[textures] ADDED: GetImageAlphaBorder() - Get image alpha border rectangle
[textures] ADDED: ImageFromImage() - Create an image from another image piece
[textures] ADDED: ImageClearBackground(), by @iamsouravgupta
[textures] ADDED: ImageDrawPixel(), by @iamsouravgupta
[textures] ADDED: ImageDrawCircle(), by @iamsouravgupta
[textures] ADDED: ImageDrawLineEx(), by @iamsouravgupta
[textures] ADDED: ImageDrawPixelV(), by @RobLoach
[textures] ADDED: ImageDrawCircleV(), by @RobLoach
[textures] ADDED: ImageDrawLineV(), by @RobLoach
[textures] ADDED: ImageDrawRectangleV(), by @RobLoach
[textures] ADDED: ImageDrawRectangleRec(), by @RobLoach
[text] ADDED: TextCopy() - Copy one string to another, returns bytes copied
[text] ADDED: GetCodepoints() - Get all codepoints in a string
[text] ADDED: CodepointToUtf8() - Encode codepoint into utf8 text
[text] ADDED: DrawTextCodepoint() - Draw one character (codepoint)
[text] RENAMED: LoadDefaultFont() -> LoadFontDefault()
[text] RENAMED: TextCountCodepoints() -> GetCodepointsCount()
[text] REDESIGNED: struct Font, character rectangles have been moved out from CharInfo to Font
[text] REDESIGNED: struct CharInfo, now includes directly an Image of the glyph
[text] REDESIGNED: GenImageFontAtlas(), additional recs parameter added
[text] REDESIGNED: ImageTextEx(), to avoid font retrieval from GPU
[models] ADDED: Support rlPushMatrix() and rlPopMatrix() on mesh drawing
[models] ADDED: DrawPoint3D() - Draw a point in 3D space, actually a small line, by @ProfJski
[raudio] REMOVED: LoadWaveEx()
[raudio] RENAMED: IsAudioBufferProcessed() to IsAudioStreamProcessed()
[raudio] REDESIGNED: Removed sampleLeft from Music struct

