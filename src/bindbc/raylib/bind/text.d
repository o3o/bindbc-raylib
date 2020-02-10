module bindbc.raylib.bind.text;

import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      // Font loading/unloading functions
      /**
       * Get the default Font
       */
      alias pGetFontDefault = Font function();
      /**
       * Load font from file into GPU memory (VRAM)
       */
      alias pLoadFont = Font function(const(char)* fileName);
      /**
       * Load font from file with extended parameters
       */
      alias pLoadFontEx = Font function(const(char)* fileName, int fontSize, int* fontChars, int charsCount);
      /**
       * Load font from Image (XNA style)
       */
      alias pLoadFontFromImage = Font function(Image image, Color key, int firstChar);
      /**
       * Load font data for further use
       */
      alias pLoadFontData = CharInfo* function(const(char)* fileName, int fontSize, int* fontChars, int charsCount, int type);
      /**
       * Generate image font atlas using chars info
       */
      alias pGenImageFontAtlas = Image function(const(CharInfo)* chars, Rectangle** recs, int charsCount, int fontSize,
            int padding, int packMethod);
      /**
       * Unload Font from GPU memory (VRAM)
       */
      alias pUnloadFont = void function(Font font);

      // Text drawing functions
      /**
       * Shows current FPS
       */
      alias pDrawFPS = void function(int posX, int posY);
      /**
       * Draw text (using default font)
       */
      alias pDrawText = void function(const(char)* text, int posX, int posY, int fontSize, Color color);
      /**
       * Draw text using font and additional parameters
       */
      alias pDrawTextEx = void function(Font font, const(char)* text, Vector2 position, float fontSize, float spacing, Color tint);
      /**
       * Draw text using font inside rectangle limits
       */
      alias pDrawTextRec = void function(Font font, const(char)* text, Rectangle rec, float fontSize, float spacing,
            bool wordWrap, Color tint);
      /**
       * Draw text using font inside rectangle limits with support for text selection
       */
      alias pDrawTextRecEx = void function(Font font, const(char)* text, Rectangle rec, float fontSize, float spacing,
            bool wordWrap, Color tint, int selectStart, int selectLength, Color selectTint, Color selectBackTint);
      /**
       * Draw one character (codepoint)
       */
      alias pDrawTextCodepoint = void function(Font font, int codepoint, Vector2 position, float scale, Color tint);

      // Text misc. functions
      /**
       * Measure string width for default font
       */
      alias pMeasureText = int function(const(char)* text, int fontSize);
      /**
       * Measure string size for Font
       */
      alias pMeasureTextEx = Vector2 function(Font font, const(char)* text, float fontSize, float spacing);
      /**
       * Get index position for a unicode character on font
       */
      alias pGetGlyphIndex = int function(Font font, int codepoint);

      // Text strings management functions (no utf8 strings, only byte chars)
      // NOTE: Some strings allocate memory internally for returned strings, just be careful!
      /**
       * Copy one string to another, returns bytes copied
       */
      alias pTextCopy = int function(char* dst, const(char)* src);
      /**
       * Check if two text string are equal
       */
      alias pTextIsEqual = bool function(const(char)* text1, const(char)* text2);
      /**
       * Get text length, checks for '\0' ending
       */
      alias pTextLength = ushort function(const(char)* text);
      /**
       * Text formatting with variables (sprintf style)
       */
      alias pTextFormat = const(char)* function(const(char)* text, ...);
      /**
       * Get a piece of a text string
       */
      alias pTextSubtext = const(char)* function(const(char)* text, int position, int length);
      /**
       * Replace text string (memory must be freed!)
       */
      alias pTextReplace = char* function(char* text, const(char)* replace, const(char)* by);
      /**
       * Insert text in a position (memory must be freed!)
       */
      alias pTextInsert = char* function(const(char)* text, const(char)* insert, int position);
      /**
       * Join text strings with delimiter
       */
      alias pTextJoin = const(char)* function(const(char*)* textList, int count, const(char)* delimiter);
      /**
       * Split text into multiple strings
       */
      alias pTextSplit = const(char*)* function(const(char)* text, char delimiter, int* count);
      /**
       * Append text at specific position and move cursor!
       */
      alias pTextAppend = void function(char* text, const(char)* append, int* position);
      /**
       * Find first text occurrence within a string
       */
      alias pTextFindIndex = int function(const(char)* text, const(char)* find);
      /**
       * Get upper case version of provided string
       */
      alias pTextToUpper = const(char)* function(const(char)* text);
      /**
       * Get lower case version of provided string
       */
      alias pTextToLower = const(char)* function(const(char)* text);
      /**
       * Get Pascal case notation version of provided string
       */
      alias pTextToPascal = const(char)* function(const(char)* text);
      /**
       * Get integer value from text (negative values not supported)
       */
      alias pTextToInteger = int function(const(char)* text);
      /**
       * Encode text codepoint into utf8 text (memory must be freed!)
       */
      alias pTextToUtf8 = char* function(int* codepoints, int length);

      // UTF8 text strings management functions
      /**
       * Get all codepoints in a string, codepoints count returned by parameters
       */
      alias pGetCodepoints = int* function(const(char)* text, int* count);
      /**
       * Get total number of characters (codepoints) in a UTF8 encoded string
       */
      alias pGetCodepointsCount = int function(const(char)* text);
      /**
       * Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
       */
      alias pGetNextCodepoint = int function(const(char)* text, int* bytesProcessed);
      /**
       * Encode codepoint into utf8 text (char array length returned as parameter)
       */
      alias pCodepointToUtf8 = const(char)* function(int codepoint, int* byteLength);
   }

   __gshared {
      pGetFontDefault GetFontDefault;
      pLoadFont LoadFont;
      pLoadFontEx LoadFontEx;
      pLoadFontFromImage LoadFontFromImage;
      pLoadFontData LoadFontData;
      pGenImageFontAtlas GenImageFontAtlas;
      pUnloadFont UnloadFont;
      pDrawFPS DrawFPS;
      pDrawText DrawText;
      pDrawTextEx DrawTextEx;
      pDrawTextRec DrawTextRec;
      pDrawTextRecEx DrawTextRecEx;
      pDrawTextCodepoint DrawTextCodepoint;
      pMeasureText MeasureText;
      pMeasureTextEx MeasureTextEx;
      pGetGlyphIndex GetGlyphIndex;
      pTextCopy TextCopy;
      pTextIsEqual TextIsEqual;
      pTextLength TextLength;
      pTextFormat TextFormat;
      pTextSubtext TextSubtext;
      pTextReplace TextReplace;
      pTextInsert TextInsert;
      pTextJoin TextJoin;
      pTextSplit TextSplit;
      pTextAppend TextAppend;
      pTextFindIndex TextFindIndex;
      pTextToUpper TextToUpper;
      pTextToLower TextToLower;
      pTextToPascal TextToPascal;
      pTextToInteger TextToInteger;
      pTextToUtf8 TextToUtf8;
      pGetCodepoints GetCodepoints;
      pGetCodepointsCount GetCodepointsCount;
      pGetNextCodepoint GetNextCodepoint;
      pCodepointToUtf8 CodepointToUtf8;
   }
}
