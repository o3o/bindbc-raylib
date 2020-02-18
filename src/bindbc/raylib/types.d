module bindbc.raylib.types;

import core.stdc.config;
import core.stdc.stdarg;
import core.stdc.stdlib;

//extern (C) @nogc nothrow:

enum NULL = 0;
enum PI = 3.14159265358979323846f;

enum DEG2RAD = PI / 180.0f;
enum RAD2DEG = 180.0f / PI;

enum MAX_TOUCH_POINTS = 10; // Maximum number of touch points supported

// Shader and material limits
enum MAX_SHADER_LOCATIONS = 32; // Maximum number of predefined locations stored in shader struct
enum MAX_MATERIAL_MAPS = 12; // Maximum number of texture maps stored in shader struct

// Allow custom memory allocators

alias RL_MALLOC = malloc;

alias RL_CALLOC = calloc;

alias RL_FREE = free;
struct Color {
   ubyte r;
   ubyte g;
   ubyte b;
   ubyte a;
}

struct Point {
   int x;
   int y;
}

struct Size {
   uint width;
   uint height;
}

struct Vector2 {
   float x;
   float y;
}

struct Vector3 {
   float x;
   float y;
   float z;
}

struct Vector4 {
   float x;
   float y;
   float z;
   float w;
}

// Quaternion type, same as Vector4
alias Quaternion = Vector4;

// Matrix type (OpenGL style 4x4 - right handed, column major)
struct Matrix {
   float m0;
   float m4;
   float m8;
   float m12;
   float m1;
   float m5;
   float m9;
   float m13;
   float m2;
   float m6;
   float m10;
   float m14;
   float m3;
   float m7;
   float m11;
   float m15;
}

struct Rectangle {
   float x;
   float y;
   float width;
   float height;
}

// Image type, bpp always RGBA (32bit)
// NOTE: Data stored in CPU memory (RAM)
struct Image {
   void* data; // Image raw data
   int width; // Image base width
   int height; // Image base height
   int mipmaps; // Mipmap levels, 1 by default
   int format; // Data format (PixelFormat type)
}

// Texture2D type
// NOTE: Data stored in GPU memory
struct Texture2D {
   uint id; // OpenGL texture id
   int width; // Texture base width
   int height; // Texture base height
   int mipmaps; // Mipmap levels, 1 by default
   int format; // Data format (PixelFormat type)
}

// Texture type, same as Texture2D
alias Texture = Texture2D;

// TextureCubemap type, actually, same as Texture2D
alias TextureCubemap = Texture2D;

// RenderTexture2D type, for texture rendering
struct RenderTexture2D {
   uint id; // OpenGL Framebuffer Object (FBO) id
   Texture2D texture; // Color buffer attachment texture
   Texture2D depth; // Depth buffer attachment texture
   bool depthTexture; // Track if depth attachment is a texture or renderbuffer
}

// RenderTexture type, same as RenderTexture2D
alias RenderTexture = RenderTexture2D;

// N-Patch layout info
struct NPatchInfo {
   Rectangle sourceRec; // Region in the texture
   int left; // left border offset
   int top; // top border offset
   int right; // right border offset
   int bottom; // bottom border offset
   int type; // layout of the n-patch: 3x3, 1x3 or 3x1
}

// Font character info
struct CharInfo {
   int value; // Character value (Unicode)
   Rectangle rec; // Character rectangle in sprite font
   int offsetX; // Character offset X when drawing
   int offsetY; // Character offset Y when drawing
   int advanceX; // Character advance position X
   ubyte* data; // Character pixel data (grayscale)
}

// Font type, includes texture and charSet array data
struct Font {
   Texture2D texture; // Font texture
   int baseSize; // Base size (default chars height)
   int charsCount; // Number of characters
   CharInfo* chars; // Characters info data
}

alias SpriteFont = Font; // SpriteFont type fallback, defaults to Font

// Camera type, defines a camera position/orientation in 3d space
struct Camera3D {
   Vector3 position; // Camera position
   Vector3 target; // Camera target it looks-at
   Vector3 up; // Camera up vector (rotation over its axis)
   float fovy; // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
   int type; // Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
}

alias Camera = Camera3D; // Camera type fallback, defaults to Camera3D

// Camera2D type, defines a 2d camera
struct Camera2D {
   Vector2 offset; // Camera offset (displacement from target)
   Vector2 target; // Camera target (rotation and zoom origin)
   float rotation; // Camera rotation in degrees
   float zoom; // Camera zoom (scaling), should be 1.0f by default
}

// Vertex data definning a mesh
// NOTE: Data stored in CPU memory (and GPU)
struct Mesh {
   int vertexCount; // Number of vertices stored in arrays
   int triangleCount; // Number of triangles stored (indexed or not)

   // Default vertex data
   float* vertices; // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
   float* texcoords; // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
   float* texcoords2; // Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
   float* normals; // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
   float* tangents; // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
   ubyte* colors; // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
   ushort* indices; // Vertex indices (in case vertex data comes indexed)

   // Animation vertex data
   float* animVertices; // Animated vertex positions (after bones transformations)
   float* animNormals; // Animated normals (after bones transformations)
   int* boneIds; // Vertex bone ids, up to 4 bones influence by vertex (skinning)
   float* boneWeights; // Vertex bone weight, up to 4 bones influence by vertex (skinning)

   // OpenGL identifiers
   uint vaoId; // OpenGL Vertex Array Object id
   uint[7] vboId; // OpenGL Vertex Buffer Objects id (default vertex data)
}

// Shader type (generic)
struct Shader {
   uint id; // Shader program id
   int[MAX_SHADER_LOCATIONS] locs; // Shader locations array
}

// Material texture map
struct MaterialMap {
   Texture2D texture; // Material map texture
   Color color; // Material map color
   float value; // Material map value
}

// Material type (generic)
struct Material {
   Shader shader; // Material shader
   MaterialMap[MAX_MATERIAL_MAPS] maps; // Material maps
   float* params; // Material generic parameters (if required)
}

// Transformation properties
struct Transform {
   Vector3 translation; // Translation
   Quaternion rotation; // Rotation
   Vector3 scale; // Scale
}

// Bone information
struct BoneInfo {
   char[32] name; // Bone name
   int parent; // Bone parent
}

// Model type
struct Model {
   Matrix transform; // Local transform matrix

   int meshCount; // Number of meshes
   Mesh* meshes; // Meshes array

   int materialCount; // Number of materials
   Material* materials; // Materials array
   int* meshMaterial; // Mesh material number

   // Animation data
   int boneCount; // Number of bones
   BoneInfo* bones; // Bones information (skeleton)
   Transform* bindPose; // Bones base transformation (pose)
}

// Model animation
struct ModelAnimation {
   int boneCount; // Number of bones
   BoneInfo* bones; // Bones information (skeleton)

   int frameCount; // Number of animation frames
   Transform** framePoses; // Poses array by frame
}

// Ray type (useful for raycast)
struct Ray {
   Vector3 position; // Ray position (origin)
   Vector3 direction; // Ray direction
}

// Raycast hit information
struct RayHitInfo {
   bool hit; // Did the ray hit something?
   float distance; // Distance to nearest hit
   Vector3 position; // Position of nearest hit
   Vector3 normal; // Surface normal of hit
}

// Bounding box type
struct BoundingBox {
   Vector3 min; // Minimum vertex box-corner
   Vector3 max; // Maximum vertex box-corner
}

// Wave type, defines audio wave data
struct Wave {
   uint sampleCount; // Number of samples
   uint sampleRate; // Frequency (samples per second)
   uint sampleSize; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
   uint channels; // Number of channels (1-mono, 2-stereo)
   void* data; // Buffer data pointer
}

// Sound source type
struct Sound {
   void* audioBuffer; // Pointer to internal data used by the audio system

   uint source; // Audio source id
   uint buffer; // Audio buffer id
   int format; // Audio format specifier
}

// Music type (file streaming from memory)
// NOTE: Anything longer than ~10 seconds should be streamed
struct MusicData;
alias Music = MusicData*;

// Audio stream type
// NOTE: Useful to create custom audio streams not bound to a specific file
struct AudioStream {
   uint sampleRate; // Frequency (samples per second)
   uint sampleSize; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
   uint channels; // Number of channels (1-mono, 2-stereo)

   void* audioBuffer; // Pointer to internal data used by the audio system.

   int format; // Audio format specifier
   uint source; // Audio source id
   uint[2] buffers; // Audio buffers (double buffering)
}

// Head-Mounted-Display device parameters
struct VrDeviceInfo {
   int hResolution; // HMD horizontal resolution in pixels
   int vResolution; // HMD vertical resolution in pixels
   float hScreenSize; // HMD horizontal size in meters
   float vScreenSize; // HMD vertical size in meters
   float vScreenCenter; // HMD screen center in meters
   float eyeToScreenDistance; // HMD distance between eye and display in meters
   float lensSeparationDistance; // HMD lens separation distance in meters
   float interpupillaryDistance; // HMD IPD (distance between pupils) in meters
   float[4] lensDistortionValues; // HMD lens distortion constant parameters
   float[4] chromaAbCorrection; // HMD chromatic aberration correction parameters
}

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System config flags
// NOTE: Used for bit masks
enum ConfigFlag {
   FLAG_SHOW_LOGO = 1, // Set to show raylib logo at startup
   FLAG_FULLSCREEN_MODE = 2, // Set to run program in fullscreen
   FLAG_WINDOW_RESIZABLE = 4, // Set to allow resizable window
   FLAG_WINDOW_UNDECORATED = 8, // Set to disable window decoration (frame and buttons)
   FLAG_WINDOW_TRANSPARENT = 16, // Set to allow transparent window
   FLAG_WINDOW_HIDDEN = 128, // Set to create the window initially hidden
   FLAG_MSAA_4X_HINT = 32, // Set to try enabling MSAA 4X
   FLAG_VSYNC_HINT = 64 // Set to try enabling V-Sync on GPU
}

// Trace log type
enum TraceLogType {
   LOG_ALL = 0, // Display all logs
   LOG_TRACE = 1,
   LOG_DEBUG = 2,
   LOG_INFO = 3,
   LOG_WARNING = 4,
   LOG_ERROR = 5,
   LOG_FATAL = 6,
   LOG_NONE = 7 // Disable logging
}

// Keyboard keys
enum KeyboardKey {
   // Alphanumeric keys
   KEY_APOSTROPHE = 39,
   KEY_COMMA = 44,
   KEY_MINUS = 45,
   KEY_PERIOD = 46,
   KEY_SLASH = 47,
   KEY_ZERO = 48,
   KEY_ONE = 49,
   KEY_TWO = 50,
   KEY_THREE = 51,
   KEY_FOUR = 52,
   KEY_FIVE = 53,
   KEY_SIX = 54,
   KEY_SEVEN = 55,
   KEY_EIGHT = 56,
   KEY_NINE = 57,
   KEY_SEMICOLON = 59,
   KEY_EQUAL = 61,
   KEY_A = 65,
   KEY_B = 66,
   KEY_C = 67,
   KEY_D = 68,
   KEY_E = 69,
   KEY_F = 70,
   KEY_G = 71,
   KEY_H = 72,
   KEY_I = 73,
   KEY_J = 74,
   KEY_K = 75,
   KEY_L = 76,
   KEY_M = 77,
   KEY_N = 78,
   KEY_O = 79,
   KEY_P = 80,
   KEY_Q = 81,
   KEY_R = 82,
   KEY_S = 83,
   KEY_T = 84,
   KEY_U = 85,
   KEY_V = 86,
   KEY_W = 87,
   KEY_X = 88,
   KEY_Y = 89,
   KEY_Z = 90,

   // Function keys
   KEY_SPACE = 32,
   KEY_ESCAPE = 256,
   KEY_ENTER = 257,
   KEY_TAB = 258,
   KEY_BACKSPACE = 259,
   KEY_INSERT = 260,
   KEY_DELETE = 261,
   KEY_RIGHT = 262,
   KEY_LEFT = 263,
   KEY_DOWN = 264,
   KEY_UP = 265,
   KEY_PAGE_UP = 266,
   KEY_PAGE_DOWN = 267,
   KEY_HOME = 268,
   KEY_END = 269,
   KEY_CAPS_LOCK = 280,
   KEY_SCROLL_LOCK = 281,
   KEY_NUM_LOCK = 282,
   KEY_PRINT_SCREEN = 283,
   KEY_PAUSE = 284,
   KEY_F1 = 290,
   KEY_F2 = 291,
   KEY_F3 = 292,
   KEY_F4 = 293,
   KEY_F5 = 294,
   KEY_F6 = 295,
   KEY_F7 = 296,
   KEY_F8 = 297,
   KEY_F9 = 298,
   KEY_F10 = 299,
   KEY_F11 = 300,
   KEY_F12 = 301,
   KEY_LEFT_SHIFT = 340,
   KEY_LEFT_CONTROL = 341,
   KEY_LEFT_ALT = 342,
   KEY_LEFT_SUPER = 343,
   KEY_RIGHT_SHIFT = 344,
   KEY_RIGHT_CONTROL = 345,
   KEY_RIGHT_ALT = 346,
   KEY_RIGHT_SUPER = 347,
   KEY_KB_MENU = 348,
   KEY_LEFT_BRACKET = 91,
   KEY_BACKSLASH = 92,
   KEY_RIGHT_BRACKET = 93,
   KEY_GRAVE = 96,

   // Keypad keys
   KEY_KP_0 = 320,
   KEY_KP_1 = 321,
   KEY_KP_2 = 322,
   KEY_KP_3 = 323,
   KEY_KP_4 = 324,
   KEY_KP_5 = 325,
   KEY_KP_6 = 326,
   KEY_KP_7 = 327,
   KEY_KP_8 = 328,
   KEY_KP_9 = 329,
   KEY_KP_DECIMAL = 330,
   KEY_KP_DIVIDE = 331,
   KEY_KP_MULTIPLY = 332,
   KEY_KP_SUBTRACT = 333,
   KEY_KP_ADD = 334,
   KEY_KP_ENTER = 335,
   KEY_KP_EQUAL = 336
}

// Android buttons
enum AndroidButton {
   KEY_BACK = 4,
   KEY_MENU = 82,
   KEY_VOLUME_UP = 24,
   KEY_VOLUME_DOWN = 25
}

// Mouse buttons
enum MouseButton {
   MOUSE_LEFT_BUTTON = 0,
   MOUSE_RIGHT_BUTTON = 1,
   MOUSE_MIDDLE_BUTTON = 2
}

// Gamepad number
enum GamepadNumber {
   GAMEPAD_PLAYER1 = 0,
   GAMEPAD_PLAYER2 = 1,
   GAMEPAD_PLAYER3 = 2,
   GAMEPAD_PLAYER4 = 3
}

// Gamepad Buttons
enum GamepadButton {
   // This is here just for error checking
   GAMEPAD_BUTTON_UNKNOWN = 0,

   // This is normally [A,B,X,Y]/[Circle,Triangle,Square,Cross]
   // No support for 6 button controllers though..
   GAMEPAD_BUTTON_LEFT_FACE_UP = 1,
   GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,
   GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,
   GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,

   // This is normally a DPAD
   GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,
   GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,
   GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,
   GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,

   // Triggers
   GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,
   GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,
   GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,
   GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12,

   // These are buttons in the center of the gamepad
   GAMEPAD_BUTTON_MIDDLE_LEFT = 13, //PS3 Select
   GAMEPAD_BUTTON_MIDDLE = 14, //PS Button/XBOX Button
   GAMEPAD_BUTTON_MIDDLE_RIGHT = 15, //PS3 Start

   // These are the joystick press in buttons
   GAMEPAD_BUTTON_LEFT_THUMB = 16,
   GAMEPAD_BUTTON_RIGHT_THUMB = 17
}

enum GamepadAxis {
   // This is here just for error checking
   GAMEPAD_AXIS_UNKNOWN = 0,

   // Left stick
   GAMEPAD_AXIS_LEFT_X = 1,
   GAMEPAD_AXIS_LEFT_Y = 2,

   // Right stick
   GAMEPAD_AXIS_RIGHT_X = 3,
   GAMEPAD_AXIS_RIGHT_Y = 4,

   // Pressure levels for the back triggers
   GAMEPAD_AXIS_LEFT_TRIGGER = 5, // [1..-1] (pressure-level)
   GAMEPAD_AXIS_RIGHT_TRIGGER = 6 // [1..-1] (pressure-level)
}

// Shader location point type
enum ShaderLocationIndex {
   LOC_VERTEX_POSITION = 0,
   LOC_VERTEX_TEXCOORD01 = 1,
   LOC_VERTEX_TEXCOORD02 = 2,
   LOC_VERTEX_NORMAL = 3,
   LOC_VERTEX_TANGENT = 4,
   LOC_VERTEX_COLOR = 5,
   LOC_MATRIX_MVP = 6,
   LOC_MATRIX_MODEL = 7,
   LOC_MATRIX_VIEW = 8,
   LOC_MATRIX_PROJECTION = 9,
   LOC_VECTOR_VIEW = 10,
   LOC_COLOR_DIFFUSE = 11,
   LOC_COLOR_SPECULAR = 12,
   LOC_COLOR_AMBIENT = 13,
   LOC_MAP_ALBEDO = 14, // LOC_MAP_DIFFUSE
   LOC_MAP_METALNESS = 15, // LOC_MAP_SPECULAR
   LOC_MAP_NORMAL = 16,
   LOC_MAP_ROUGHNESS = 17,
   LOC_MAP_OCCLUSION = 18,
   LOC_MAP_EMISSION = 19,
   LOC_MAP_HEIGHT = 20,
   LOC_MAP_CUBEMAP = 21,
   LOC_MAP_IRRADIANCE = 22,
   LOC_MAP_PREFILTER = 23,
   LOC_MAP_BRDF = 24
}

enum LOC_MAP_DIFFUSE = ShaderLocationIndex.LOC_MAP_ALBEDO;
enum LOC_MAP_SPECULAR = ShaderLocationIndex.LOC_MAP_METALNESS;

// Shader uniform data types
enum ShaderUniformDataType {
   UNIFORM_FLOAT = 0,
   UNIFORM_VEC2 = 1,
   UNIFORM_VEC3 = 2,
   UNIFORM_VEC4 = 3,
   UNIFORM_INT = 4,
   UNIFORM_IVEC2 = 5,
   UNIFORM_IVEC3 = 6,
   UNIFORM_IVEC4 = 7,
   UNIFORM_SAMPLER2D = 8
}

// Material map type
enum MaterialMapType {
   MAP_ALBEDO = 0, // MAP_DIFFUSE
   MAP_METALNESS = 1, // MAP_SPECULAR
   MAP_NORMAL = 2,
   MAP_ROUGHNESS = 3,
   MAP_OCCLUSION = 4,
   MAP_EMISSION = 5,
   MAP_HEIGHT = 6,
   MAP_CUBEMAP = 7, // NOTE: Uses GL_TEXTURE_CUBE_MAP
   MAP_IRRADIANCE = 8, // NOTE: Uses GL_TEXTURE_CUBE_MAP
   MAP_PREFILTER = 9, // NOTE: Uses GL_TEXTURE_CUBE_MAP
   MAP_BRDF = 10
}

enum MAP_DIFFUSE = MaterialMapType.MAP_ALBEDO;
enum MAP_SPECULAR = MaterialMapType.MAP_METALNESS;

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
enum PixelFormat {
   UNCOMPRESSED_GRAYSCALE = 1, // 8 bit per pixel (no alpha)
   UNCOMPRESSED_GRAY_ALPHA = 2, // 8*2 bpp (2 channels)
   UNCOMPRESSED_R5G6B5 = 3, // 16 bpp
   UNCOMPRESSED_R8G8B8 = 4, // 24 bpp
   UNCOMPRESSED_R5G5B5A1 = 5, // 16 bpp (1 bit alpha)
   UNCOMPRESSED_R4G4B4A4 = 6, // 16 bpp (4 bit alpha)
   UNCOMPRESSED_R8G8B8A8 = 7, // 32 bpp
   UNCOMPRESSED_R32 = 8, // 32 bpp (1 channel - float)
   UNCOMPRESSED_R32G32B32 = 9, // 32*3 bpp (3 channels - float)
   UNCOMPRESSED_R32G32B32A32 = 10, // 32*4 bpp (4 channels - float)
   COMPRESSED_DXT1_RGB = 11, // 4 bpp (no alpha)
   COMPRESSED_DXT1_RGBA = 12, // 4 bpp (1 bit alpha)
   COMPRESSED_DXT3_RGBA = 13, // 8 bpp
   COMPRESSED_DXT5_RGBA = 14, // 8 bpp
   COMPRESSED_ETC1_RGB = 15, // 4 bpp
   COMPRESSED_ETC2_RGB = 16, // 4 bpp
   COMPRESSED_ETC2_EAC_RGBA = 17, // 8 bpp
   COMPRESSED_PVRT_RGB = 18, // 4 bpp
   COMPRESSED_PVRT_RGBA = 19, // 4 bpp
   COMPRESSED_ASTC_4x4_RGBA = 20, // 8 bpp
   COMPRESSED_ASTC_8x8_RGBA = 21 // 2 bpp
}

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
enum TextureFilterMode {
   FILTER_POINT = 0, // No filter, just pixel aproximation
   FILTER_BILINEAR = 1, // Linear filtering
   FILTER_TRILINEAR = 2, // Trilinear filtering (linear with mipmaps)
   FILTER_ANISOTROPIC_4X = 3, // Anisotropic filtering 4x
   FILTER_ANISOTROPIC_8X = 4, // Anisotropic filtering 8x
   FILTER_ANISOTROPIC_16X = 5 // Anisotropic filtering 16x
}

// Cubemap layout type
enum CubemapLayoutType {
   CUBEMAP_AUTO_DETECT = 0, // Automatically detect layout type
   CUBEMAP_LINE_VERTICAL = 1, // Layout is defined by a vertical line with faces
   CUBEMAP_LINE_HORIZONTAL = 2, // Layout is defined by an horizontal line with faces
   CUBEMAP_CROSS_THREE_BY_FOUR = 3, // Layout is defined by a 3x4 cross with cubemap faces
   CUBEMAP_CROSS_FOUR_BY_THREE = 4, // Layout is defined by a 4x3 cross with cubemap faces
   CUBEMAP_PANORAMA = 5 // Layout is defined by a panorama image (equirectangular map)
}

// Texture parameters: wrap mode
enum TextureWrapMode {
   WRAP_REPEAT = 0, // Repeats texture in tiled mode
   WRAP_CLAMP = 1, // Clamps texture to edge pixel in tiled mode
   WRAP_MIRROR_REPEAT = 2, // Mirrors and repeats the texture in tiled mode
   WRAP_MIRROR_CLAMP = 3 // Mirrors and clamps to border the texture in tiled mode
}

// Font type, defines generation method
enum FontType {
   FONT_DEFAULT = 0, // Default font generation, anti-aliased
   FONT_BITMAP = 1, // Bitmap font generation, no anti-aliasing
   FONT_SDF = 2 // SDF font generation, requires external shader
}

// Color blending modes (pre-defined)
enum BlendMode {
   BLEND_ALPHA = 0, // Blend textures considering alpha (default)
   BLEND_ADDITIVE = 1, // Blend textures adding colors
   BLEND_MULTIPLIED = 2 // Blend textures multiplying colors
}

// Gestures type
// NOTE: It could be used as flags to enable only some gestures
enum GestureType {
   GESTURE_NONE = 0,
   GESTURE_TAP = 1,
   GESTURE_DOUBLETAP = 2,
   GESTURE_HOLD = 4,
   GESTURE_DRAG = 8,
   GESTURE_SWIPE_RIGHT = 16,
   GESTURE_SWIPE_LEFT = 32,
   GESTURE_SWIPE_UP = 64,
   GESTURE_SWIPE_DOWN = 128,
   GESTURE_PINCH_IN = 256,
   GESTURE_PINCH_OUT = 512
}

// Camera system modes
enum CameraMode {
   CAMERA_CUSTOM = 0,
   CAMERA_FREE = 1,
   CAMERA_ORBITAL = 2,
   CAMERA_FIRST_PERSON = 3,
   CAMERA_THIRD_PERSON = 4
}

// Camera projection modes
enum CameraType {
   CAMERA_PERSPECTIVE = 0,
   CAMERA_ORTHOGRAPHIC = 1
}

// Type of n-patch
enum NPatchType {
   NPT_9PATCH = 0, // Npatch defined by 3x3 tiles
   NPT_3PATCH_VERTICAL = 1, // Npatch defined by 1x3 tiles
   NPT_3PATCH_HORIZONTAL = 2 // Npatch defined by 3x1 tiles
}

// raygui
//
/// Place enums into the global space.  Example: Allows usage of both KeyboardKey.KEY_RIGHT and KEY_RIGHT.
private string _enum(E...)() {
   import std.format : formattedWrite;
   import std.traits : EnumMembers;
   import std.array : appender;

   auto writer = appender!string;
   static foreach (T; E) {
      static foreach (member; EnumMembers!T) {
         writer.formattedWrite("alias %s = " ~ T.stringof ~ ".%s;\n", member, member);
      }
   }
   return writer.data;
}

mixin(_enum!(GuiControlState, GuiTextAlignment, GuiControl, GuiControlProperty, GuiDefaultProperty, GuiToggleProperty, GuiSliderProperty, GuiCheckBoxProperty,
      GuiComboBoxProperty, GuiDropdownBoxProperty, GuiTextBoxProperty, GuiSpinnerProperty, GuiScrollBarProperty,
      GuiScrollBarSide, GuiListViewProperty, GuiColorPickerProperty));

/**
 *Number of standard controls
 */
enum NUM_CONTROLS = 16;
/**
 *Number of standard properties
 */
enum NUM_PROPS_DEFAULT = 16;
/**
 *Number of extended properties
 */
enum NUM_PROPS_EXTENDED = 8;
/**
 *Text edit controls cursor blink timming
 */
enum TEXTEDIT_CURSOR_BLINK_FRAMES = 20;

// Style property
struct GuiStyleProp {
   ushort controlId;
   ushort propertyId;
   int propertyValue;
}

/// Gui control state
enum GuiControlState {
   GUI_STATE_NORMAL = 0,
   GUI_STATE_FOCUSED = 1,
   GUI_STATE_PRESSED = 2,
   GUI_STATE_DISABLED = 3
}

/// Gui control text alignment
enum GuiTextAlignment {
   GUI_TEXT_ALIGN_LEFT = 0,
   GUI_TEXT_ALIGN_CENTER = 1,
   GUI_TEXT_ALIGN_RIGHT = 2
}

/// Gui controls
enum GuiControl {
   DEFAULT = 0,
   LABEL = 1, // LABELBUTTON
   BUTTON = 2, // IMAGEBUTTON
   TOGGLE = 3, // TOGGLEGROUP
   SLIDER = 4, // SLIDERBAR
   PROGRESSBAR = 5,
   CHECKBOX = 6,
   COMBOBOX = 7,
   DROPDOWNBOX = 8,
   TEXTBOX = 9, // TEXTBOXMULTI
   VALUEBOX = 10,
   SPINNER = 11,
   LISTVIEW = 12,
   COLORPICKER = 13,
   SCROLLBAR = 14,
   RESERVED = 15
}

/// Gui base properties for every control
enum GuiControlProperty {
   BORDER_COLOR_NORMAL = 0,
   BASE_COLOR_NORMAL = 1,
   TEXT_COLOR_NORMAL = 2,
   BORDER_COLOR_FOCUSED = 3,
   BASE_COLOR_FOCUSED = 4,
   TEXT_COLOR_FOCUSED = 5,
   BORDER_COLOR_PRESSED = 6,
   BASE_COLOR_PRESSED = 7,
   TEXT_COLOR_PRESSED = 8,
   BORDER_COLOR_DISABLED = 9,
   BASE_COLOR_DISABLED = 10,
   TEXT_COLOR_DISABLED = 11,
   BORDER_WIDTH = 12,
   INNER_PADDING = 13,
   TEXT_ALIGNMENT = 14,
   RESERVED02 = 15
}

// Gui extended properties depend on control
// NOTE: We reserve a fixed size of additional properties per control
/// DEFAULT properties
enum GuiDefaultProperty {
   TEXT_SIZE = 16,
   TEXT_SPACING = 17,
   LINE_COLOR = 18,
   BACKGROUND_COLOR = 19
}

/// Toggle / ToggleGroup
enum GuiToggleProperty {
   GROUP_PADDING = 16
}

/// Slider / SliderBar
enum GuiSliderProperty {
   SLIDER_WIDTH = 16,
   TEXT_PADDING = 17
}

/// CheckBox
enum GuiCheckBoxProperty {
   CHECK_TEXT_PADDING = 16
}

/// ComboBox
enum GuiComboBoxProperty {
   SELECTOR_WIDTH = 16,
   SELECTOR_PADDING = 17
}

/// DropdownBox
enum GuiDropdownBoxProperty {
   ARROW_RIGHT_PADDING = 16
}

/// TextBox / TextBoxMulti / ValueBox / Spinner
enum GuiTextBoxProperty {
   MULTILINE_PADDING = 16,
   COLOR_SELECTED_FG = 17,
   COLOR_SELECTED_BG = 18
}

enum GuiSpinnerProperty {
   SELECT_BUTTON_WIDTH = 16,
   SELECT_BUTTON_PADDING = 17,
   SELECT_BUTTON_BORDER_WIDTH = 18
}

/// ScrollBar
enum GuiScrollBarProperty {
   ARROWS_SIZE = 16,
   SLIDER_PADDING = 17,
   SLIDER_SIZE = 18,
   SCROLL_SPEED = 19,
   SHOW_SPINNER_BUTTONS = 20
}

/// ScrollBar side
enum GuiScrollBarSide {
   SCROLLBAR_LEFT_SIDE = 0,
   SCROLLBAR_RIGHT_SIDE = 1
}

/// ListView
enum GuiListViewProperty {
   ELEMENTS_HEIGHT = 16,
   ELEMENTS_PADDING = 17,
   SCROLLBAR_WIDTH = 18,
   SCROLLBAR_SIDE = 19 // This property defines vertical scrollbar side (SCROLLBAR_LEFT_SIDE or SCROLLBAR_RIGHT_SIDE)
}

/// ColorPicker
enum GuiColorPickerProperty {
   COLOR_SELECTOR_SIZE = 16,
   BAR_WIDTH = 17, // Lateral bar width
   BAR_PADDING = 18, // Lateral bar separation from panel
   BAR_SELECTOR_HEIGHT = 19, // Lateral bar selector height
   BAR_SELECTOR_PADDING = 20 // Lateral bar selector outer padding
}
