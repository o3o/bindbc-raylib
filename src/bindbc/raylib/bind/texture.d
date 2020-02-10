module bindbc.raylib.bind.texture;

import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      /**
       * Load image from file into CPU memory (RAM)
       */
      alias pLoadImage = Image function(const(char)* fileName);
      /**
       * Load image from Color array data (RGBA - 32bit)
       */
      alias pLoadImageEx = Image function(Color* pixels, int width, int height);
      /**
       * Load image from raw data with parameters
       */
      alias pLoadImagePro = Image function(void* data, int width, int height, int format);
      /**
       * Load image from RAW file data
       */
      alias pLoadImageRaw = Image function(const(char)* fileName, int width, int height, int format, int headerSize);
      /**
       * Export image data to file
       */
      alias pExportImage = void function(Image image, const(char)* fileName);
      /**
       * Export image as code file defining an array of bytes
       */
      alias pExportImageAsCode = void function(Image image, const(char)* fileName);
      /**
       * Load texture from file into GPU memory (VRAM)
       */
      alias pLoadTexture = Texture2D function(const(char)* fileName);
      /**
       * Load texture from image data
       */
      alias pLoadTextureFromImage = Texture2D function(Image image);
      /**
       * Load cubemap from image, multiple image cubemap layouts supported
       */
      alias pLoadTextureCubemap = TextureCubemap function(Image image, int layoutType);
      /**
       * Load texture for rendering (framebuffer)
       */
      alias pLoadRenderTexture = RenderTexture2D function(int width, int height);
      /**
       * Unload image from CPU memory (RAM)
       */
      alias pUnloadImage = void function(Image image);
      /**
       * Unload texture from GPU memory (VRAM)
       */
      alias pUnloadTexture = void function(Texture2D texture);
      /**
       * Unload render texture from GPU memory (VRAM)
       */
      alias pUnloadRenderTexture = void function(RenderTexture2D target);

      /**
       * Get pixel data from image as a Color struct array
       */
      alias pGetImageData = Color* function(Image image);
      /**
       * Get pixel data from image as Vector4 array (float normalized)
       */
      alias pGetImageDataNormalized = Vector4* function(Image image);
      /**
       * Get image alpha border rectangle
       */
      alias pGetImageAlphaBorder = Rectangle function(Image image, float threshold);
      /**
       * Get pixel data size in bytes (image or texture)
       */
      alias pGetPixelDataSize = int function(int width, int height, int format);
      /**
       * Get pixel data from GPU texture and return an Image
       */
      alias pGetTextureData = Image function(Texture2D texture);
      /**
       * Get pixel data from screen buffer and return an Image (screenshot)
       */
      alias pGetScreenData = Image function();
      /**
       * Update GPU texture with new data
       */
      alias pUpdateTexture = void function(Texture2D texture, const void* pixels);
      // Image manipulation functions

      /**
       * Create an image duplicate (useful for transformations)
       */
      alias pImageCopy = Image function(Image image);
      /**
       * Create an image from another image piece
       */
      alias pImageFromImage = Image function(Image image, Rectangle rec);
      /**
       * Convert image to POT (power-of-two)
       */
      alias pImageToPOT = void function(Image* image, Color fillColor);
      /**
       * Convert image data to desired format
       */
      alias pImageFormat = void function(Image* image, int newFormat);
      /**
       * Apply alpha mask to image
       */
      alias pImageAlphaMask = void function(Image* image, Image alphaMask);
      /**
       * Clear alpha channel to desired color
       */
      alias pImageAlphaClear = void function(Image* image, Color color, float threshold);
      /**
       * Crop image depending on alpha value
       */
      alias pImageAlphaCrop = void function(Image* image, float threshold);
      /**
       * Premultiply alpha channel
       */
      alias pImageAlphaPremultiply = void function(Image* image);
      /**
       * Crop an image to a defined rectangle
       */
      alias pImageCrop = void function(Image* image, Rectangle crop);
      /**
       * Resize image (Bicubic scaling algorithm)
       */
      alias pImageResize = void function(Image* image, int newWidth, int newHeight);
      /**
       * Resize image (Nearest-Neighbor scaling algorithm)
       */
      alias pImageResizeNN = void function(Image* image, int newWidth, int newHeight);
      /**
       * Resize canvas and fill with color
       */
      alias pImageResizeCanvas = void function(Image* image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);
      /**
       * Generate all mipmap levels for a provided image
       */
      alias pImageMipmaps = void function(Image* image);
      /**
       * Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
       */
      alias pImageDither = void function(Image* image, int rBpp, int gBpp, int bBpp, int aBpp);
      /**
       * Extract color palette from image to maximum size (memory should be freed)
       */
      alias pImageExtractPalette = Color* function(Image image, int maxPaletteSize, int* extractCount);
      /**
       * Create an image from text (default font)
       */
      alias pImageText = Image function(const(char)* text, int fontSize, Color color);
      /**
       * Create an image from text (custom sprite font)
       */
      alias pImageTextEx = Image function(Font font, const(char)* text, float fontSize, float spacing, Color tint);
      /**
       * Draw a source image within a destination image (tint applied to source)
       */
      alias pImageDraw = void function(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
      /**
       * Draw rectangle within an image
       */
      alias pImageDrawRectangle = void function(Image* dst, Rectangle rec, Color color);
      /**
       * Draw rectangle lines within an image
       */
      alias pImageDrawRectangleLines = void function(Image* dst, Rectangle rec, int thick, Color color);
      /**
       * Draw text (default font) within an image (destination)
       */
      alias pImageDrawText = void function(Image* dst, Vector2 position, const(char)* text, int fontSize, Color color);
      /**
       * Draw text (custom sprite font) within an image (destination)
       */
      alias pImageDrawTextEx = void function(Image* dst, Vector2 position, Font font, const(char)* text, float fontSize,
            float spacing, Color color);
      /**
       * Flip image vertically
       */
      alias pImageFlipVertical = void function(Image* image);
      /**
       * Flip image horizontally
       */
      alias pImageFlipHorizontal = void function(Image* image);
      /**
       * Rotate image clockwise 90deg
       */
      alias pImageRotateCW = void function(Image* image);
      /**
       * Rotate image counter-clockwise 90deg
       */
      alias pImageRotateCCW = void function(Image* image);
      /**
       * Modify image color: tint
       */
      alias pImageColorTint = void function(Image* image, Color color);
      /**
       * Modify image color: invert
       */
      alias pImageColorInvert = void function(Image* image);
      /**
       * Modify image color: grayscale
       */
      alias pImageColorGrayscale = void function(Image* image);
      /**
       * Modify image color: contrast (-100 to 100)
       */
      alias pImageColorContrast = void function(Image* image, float contrast);
      /**
       * Modify image color: brightness (-255 to 255)
       */
      alias pImageColorBrightness = void function(Image* image, int brightness);
      /**
       * Modify image color: replace color
       */
      alias pImageColorReplace = void function(Image* image, Color color, Color replace);

      // Image generation functions
      /**
       * Generate image: plain color
       */
      alias pGenImageColor = Image function(int width, int height, Color color);
      /**
       * Generate image: vertical gradient
       */
      alias pGenImageGradientV = Image function(int width, int height, Color top, Color bottom);
      /**
       * Generate image: horizontal gradient
       */
      alias pGenImageGradientH = Image function(int width, int height, Color left, Color right);
      /**
       * Generate image: radial gradient
       */
      alias pGenImageGradientRadial = Image function(int width, int height, float density, Color inner, Color outer);
      /**
       * Generate image: checked
       */
      alias pGenImageChecked = Image function(int width, int height, int checksX, int checksY, Color col1, Color col2);
      /**
       * Generate image: white noise
       */
      alias pGenImageWhiteNoise = Image function(int width, int height, float factor);
      /**
       * Generate image: perlin noise
       */
      alias pGenImagePerlinNoise = Image function(int width, int height, int offsetX, int offsetY, float scale);
      /**
       * Generate image: cellular algorithm. Bigger tileSize means bigger cells
       */
      alias pGenImageCellular = Image function(int width, int height, int tileSize);

      // Texture2D configuration functions
      /**
       * Generate GPU mipmaps for a texture
       */
      alias pGenTextureMipmaps = void function(Texture2D* texture);
      /**
       * Set texture scaling filter mode
       */
      alias pSetTextureFilter = void function(Texture2D texture, int filterMode);
      /**
       * Set texture wrapping mode
       */
      alias pSetTextureWrap = void function(Texture2D texture, int wrapMode);


      // Texture2D drawing functions
      /**
       * Draw a Texture2D
       */
      alias pDrawTexture = void function(Texture2D texture, int posX, int posY, Color tint);
      /**
       * Draw a Texture2D with position defined as Vector2
       */
      alias pDrawTextureV = void function(Texture2D texture, Vector2 position, Color tint);
      /**
       * Draw a Texture2D with extended parameters
       */
      alias pDrawTextureEx = void function(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
      /**
       * Draw a part of a texture defined by a rectangle
       */
      alias pDrawTextureRec = void function(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);
      /**
       * Draw texture quad with tiling and offset parameters
       */
      alias pDrawTextureQuad = void function(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);
      /**
       * Draw a part of a texture defined by a rectangle with 'pro' parameters
       */
      alias pDrawTexturePro = void function(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin,
            float rotation, Color tint);
      /**
       * Draws a texture (or part of it) that stretches or shrinks nicely
       */
      alias pDrawTextureNPatch = void function(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin,
            float rotation, Color tint);
   }
   __gshared {
      pLoadImage LoadImage;
      pLoadImageEx LoadImageEx;
      pLoadImagePro LoadImagePro;
      pLoadImageRaw LoadImageRaw;
      pExportImage ExportImage;
      pExportImageAsCode ExportImageAsCode;
      pLoadTexture LoadTexture;
      pLoadTextureFromImage LoadTextureFromImage;
      pLoadTextureCubemap LoadTextureCubemap;
      pLoadRenderTexture LoadRenderTexture;
      pUnloadImage UnloadImage;
      pUnloadTexture UnloadTexture;
      pUnloadRenderTexture UnloadRenderTexture;
      pGetImageData GetImageData;
      pGetImageDataNormalized GetImageDataNormalized;
      pGetImageAlphaBorder GetImageAlphaBorder;
      pGetPixelDataSize GetPixelDataSize;
      pGetTextureData GetTextureData;
      pGetScreenData GetScreenData;
      pUpdateTexture UpdateTexture;
      pImageCopy ImageCopy;
      pImageFromImage ImageFromImage;
      pImageToPOT ImageToPOT;
      pImageFormat ImageFormat;
      pImageAlphaMask ImageAlphaMask;
      pImageAlphaClear ImageAlphaClear;
      pImageAlphaCrop ImageAlphaCrop;
      pImageAlphaPremultiply ImageAlphaPremultiply;
      pImageCrop ImageCrop;
      pImageResize ImageResize;
      pImageResizeNN ImageResizeNN;
      pImageResizeCanvas ImageResizeCanvas;
      pImageMipmaps ImageMipmaps;
      pImageDither ImageDither;
      pImageExtractPalette ImageExtractPalette;
      pImageText ImageText;
      pImageTextEx ImageTextEx;
      pImageDraw ImageDraw;
      pImageDrawRectangle ImageDrawRectangle;
      pImageDrawRectangleLines ImageDrawRectangleLines;
      pImageDrawText ImageDrawText;
      pImageDrawTextEx ImageDrawTextEx;
      pImageFlipVertical ImageFlipVertical;
      pImageFlipHorizontal ImageFlipHorizontal;
      pImageRotateCW ImageRotateCW;
      pImageRotateCCW ImageRotateCCW;
      pImageColorTint ImageColorTint;
      pImageColorInvert ImageColorInvert;
      pImageColorGrayscale ImageColorGrayscale;
      pImageColorContrast ImageColorContrast;
      pImageColorBrightness ImageColorBrightness;
      pImageColorReplace ImageColorReplace;
      pGenImageColor GenImageColor;
      pGenImageGradientV GenImageGradientV;
      pGenImageGradientH GenImageGradientH;
      pGenImageGradientRadial GenImageGradientRadial;
      pGenImageChecked GenImageChecked;
      pGenImageWhiteNoise GenImageWhiteNoise;
      pGenImagePerlinNoise GenImagePerlinNoise;
      pGenImageCellular GenImageCellular;

      pGenTextureMipmaps GenTextureMipmaps;
      pSetTextureFilter SetTextureFilter;
      pSetTextureWrap SetTextureWrap;


      pDrawTexture DrawTexture;
      pDrawTextureV DrawTextureV;
      pDrawTextureEx DrawTextureEx;
      pDrawTextureRec DrawTextureRec;
      pDrawTextureQuad DrawTextureQuad;
      pDrawTexturePro DrawTexturePro;
      pDrawTextureNPatch DrawTextureNPatch;
   }
}
