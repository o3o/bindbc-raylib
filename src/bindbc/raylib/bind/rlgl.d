/**
 *  Basic geometric 3D shapes drawing functions
 */
module bindbc.raylib.bind.rlgl;

import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      //------------------------------------------------------------------------------------
      // Functions Declaration - Matrix operations
      //------------------------------------------------------------------------------------
      alias prlMatrixMode = void function(int mode);                    // Choose the current matrix to be transformed
      alias prlPushMatrix = void function();                        // Push the current matrix to stack
      alias prlPopMatrix = void function();                         // Pop lattest inserted matrix from stack
      alias prlLoadIdentity = void function();                      // Reset current matrix to identity matrix
      alias prlTranslatef = void function(float x, float y, float z);   // Multiply the current matrix by a translation matrix
      alias prlRotatef = void function(float angleDeg, float x, float y, float z);  // Multiply the current matrix by a rotation matrix
      alias prlScalef = void function(float x, float y, float z);       // Multiply the current matrix by a scaling matrix
      alias prlMultMatrixf = void function(float *matf);                // Multiply the current matrix by another matrix
      alias prlFrustum = void function(double left, double right, double bottom, double top, double znear, double zfar);
      alias prlOrtho = void function(double left, double right, double bottom, double top, double znear, double zfar);
      alias prlViewport = void function(int x, int y, int width, int height); // Set the viewport area

      //------------------------------------------------------------------------------------
      // Functions Declaration - Vertex level operations
      //------------------------------------------------------------------------------------
      alias prlBegin = void function(int mode);                         // Initialize drawing mode (how to organize vertex)
      alias prlEnd = void function();                               // Finish vertex providing
      alias prlVertex2i = void function(int x, int y);                  // Define one vertex (position) - 2 int
      alias prlVertex2f = void function(float x, float y);              // Define one vertex (position) - 2 float
      alias prlVertex3f = void function(float x, float y, float z);     // Define one vertex (position) - 3 float
      alias prlTexCoord2f = void function(float x, float y);            // Define one vertex (texture coordinate) - 2 float
      alias prlNormal3f = void function(float x, float y, float z);     // Define one vertex (normal) - 3 float
      alias prlColor4ub = void function(char r, char g, char b, char a);  // Define one vertex (color) - 4 byte
      alias prlColor3f = void function(float x, float y, float z);          // Define one vertex (color) - 3 float
      alias prlColor4f = void function(float x, float y, float z, float w); // Define one vertex (color) - 4 float

      //------------------------------------------------------------------------------------
      // Functions Declaration - OpenGL equivalent functions (common to 1.1, 3.3+, ES2)
      // NOTE: This functions are used to completely abstract raylib code from OpenGL layer
      //------------------------------------------------------------------------------------
      alias prlEnableTexture = void function(uint id);                  // Enable texture usage
      alias prlDisableTexture = void function();                            // Disable texture usage
      alias prlTextureParameters = void function(uint id, int param, int value); // Set texture parameters (filter, wrap)
      alias prlEnableShader = void function(uint id);                   // Enable shader program usage
      alias prlDisableShader = void function();                             // Disable shader program usage
      alias prlEnableFramebuffer = void function(uint id);              // Enable render texture (fbo)
      alias prlDisableFramebuffer = void function();                        // Disable render texture (fbo), return to default framebuffer
      alias prlEnableDepthTest = void function();                           // Enable depth test
      alias prlDisableDepthTest = void function();                          // Disable depth test
      alias prlEnableBackfaceCulling = void function();                     // Enable backface culling
      alias prlDisableBackfaceCulling = void function();                    // Disable backface culling
      alias prlEnableScissorTest = void function();                         // Enable scissor test
      alias prlDisableScissorTest = void function();                        // Disable scissor test
      alias prlScissor = void function(int x, int y, int width, int height);    // Scissor test
      alias prlEnableWireMode = void function();                            // Enable wire mode
      alias prlDisableWireMode = void function();                           // Disable wire mode

      alias prlClearColor = void function(char r, char g, char b, char a);  // Clear color buffer with color
      alias prlClearScreenBuffers = void function();                        // Clear used screen buffers (color and depth)
      alias prlUpdateBuffer = void function(int bufferId, void *data, int dataSize); // Update GPU buffer with new data
      alias prlLoadAttribBuffer = uint function(uint vaoId, int shaderLoc, void *buffer, int size, bool dynamic);   // Load a new attributes buffer

      //------------------------------------------------------------------------------------
      // Functions Declaration - rlgl functionality
      //------------------------------------------------------------------------------------
      alias prlglInit = void function(int width, int height);           // Initialize rlgl (buffers, shaders, textures, states)
      alias prlglClose = void function();                           // De-inititialize rlgl (buffers, shaders, textures)
      alias prlglDraw = void function();                            // Update and draw default internal buffers
      alias prlCheckErrors = void function();                       // Check and log OpenGL error codes

      alias prlGetVersion = int function();                         // Returns current OpenGL version
      alias prlCheckBufferLimit = bool function(int vCount);            // Check internal buffer overflow for a given number of vertex
      alias prlSetDebugMarker = void function(const char *text);        // Set debug marker for analysis
      alias prlSetBlendMode = void function(int glSrcFactor, int glDstFactor, int glEquation);    // // Set blending mode factor and equation (using OpenGL factors)
      alias prlLoadExtensions = void function(void *loader);            // Load OpenGL extensions

      // Textures data management
      alias prlLoadTexture = uint function(void *data, int width, int height, int format, int mipmapCount); // Load texture in GPU
      alias prlLoadTextureDepth = uint function(int width, int height, bool useRenderBuffer);               // Load depth texture/renderbuffer (to be attached to fbo)
      alias prlLoadTextureCubemap = uint function(void *data, int size, int format);                        // Load texture cubemap
      alias prlUpdateTexture = void function(uint id, int offsetX, int offsetY, int width, int height, int format, const void *data);  // Update GPU texture with new data
      alias prlGetGlTextureFormats = void function(int format, uint *glInternalFormat, uint *glFormat, uint *glType);  // Get OpenGL internal formats
      alias prlUnloadTexture = void function(uint id);                              // Unload texture from GPU memory

      alias prlGenerateMipmaps = void function(Texture2D *texture);                         // Generate mipmap data for selected texture
      alias prlReadTexturePixels = void * function(Texture2D texture);                       // Read texture pixel data
      alias prlReadScreenPixels = char * function(int width, int height);           // Read screen pixel data (color buffer)

      // Framebuffer management (fbo)
      alias prlLoadFramebuffer = uint function(int width, int height);              // Load an empty framebuffer
      alias prlFramebufferAttach = void function(uint fboId, uint texId, int attachType, int texType);  // Attach texture/renderbuffer to a framebuffer
      alias prlFramebufferComplete = bool function(uint id);                        // Verify framebuffer is complete
      alias prlUnloadFramebuffer = void function(uint id);                          // Delete framebuffer from GPU

      // Vertex data management
      alias prlLoadMesh = void function(Mesh *mesh, bool dynamic);                          // Upload vertex data into GPU and provided VAO/VBO ids
      alias prlUpdateMesh = void function(Mesh mesh, int buffer, int count);                // Update vertex or index data on GPU (upload new data to one buffer)
      alias prlUpdateMeshAt = void function(Mesh mesh, int buffer, int count, int index);   // Update vertex or index data on GPU, at index
      alias prlDrawMesh = void function(Mesh mesh, Material material, Matrix transform);    // Draw a 3d mesh with material and transform
      alias prlDrawMeshInstanced = void function(Mesh mesh, Material material, Matrix *transforms, int count);    // Draw a 3d mesh with material and transform
      alias prlUnloadMesh = void function(Mesh mesh);                                       // Unload mesh data from CPU and GPU

   }
   __gshared {
      prlMatrixMode rlMatrixMode;
      prlPushMatrix rlPushMatrix;
      prlPopMatrix rlPopMatrix;
      prlLoadIdentity rlLoadIdentity;
      prlTranslatef rlTranslatef;
      prlRotatef rlRotatef;
      prlScalef rlScalef;
      prlMultMatrixf rlMultMatrixf;
      prlFrustum rlFrustum;
      prlOrtho rlOrtho;
      prlViewport rlViewport;
      prlBegin rlBegin;
      prlEnd rlEnd;
      prlVertex2i rlVertex2i;
      prlVertex2f rlVertex2f;
      prlVertex3f rlVertex3f;
      prlTexCoord2f rlTexCoord2f;
      prlNormal3f rlNormal3f;
      prlColor4ub rlColor4ub;
      prlColor3f rlColor3f;
      prlColor4f rlColor4f;
      prlEnableTexture rlEnableTexture;
      prlDisableTexture rlDisableTexture;
      prlTextureParameters rlTextureParameters;
      prlEnableShader rlEnableShader;
      prlDisableShader rlDisableShader;
      prlEnableFramebuffer rlEnableFramebuffer;
      prlDisableFramebuffer rlDisableFramebuffer;
      prlEnableDepthTest rlEnableDepthTest;
      prlDisableDepthTest rlDisableDepthTest;
      prlEnableBackfaceCulling rlEnableBackfaceCulling;
      prlDisableBackfaceCulling rlDisableBackfaceCulling;
      prlEnableScissorTest rlEnableScissorTest;
      prlDisableScissorTest rlDisableScissorTest;
      prlScissor rlScissor;
      prlEnableWireMode rlEnableWireMode;
      prlDisableWireMode rlDisableWireMode;
      prlClearColor rlClearColor;
      prlClearScreenBuffers rlClearScreenBuffers;
      prlUpdateBuffer rlUpdateBuffer;
      prlLoadAttribBuffer rlLoadAttribBuffer;
      prlglInit rlglInit;
      prlglClose rlglClose;
      prlglDraw rlglDraw;
      prlCheckErrors rlCheckErrors;
      prlGetVersion rlGetVersion;
      prlCheckBufferLimit rlCheckBufferLimit;
      prlSetDebugMarker rlSetDebugMarker;
      prlSetBlendMode rlSetBlendMode;
      prlLoadExtensions rlLoadExtensions;
      prlLoadTexture rlLoadTexture;
      prlLoadTextureDepth rlLoadTextureDepth;
      prlLoadTextureCubemap rlLoadTextureCubemap;
      prlUpdateTexture rlUpdateTexture;
      prlGetGlTextureFormats rlGetGlTextureFormats;
      prlUnloadTexture rlUnloadTexture;
      prlGenerateMipmaps rlGenerateMipmaps;
      prlReadTexturePixels rlReadTexturePixels;
      prlReadScreenPixels rlReadScreenPixels;
      prlLoadFramebuffer rlLoadFramebuffer;
      prlFramebufferAttach rlFramebufferAttach;
      prlFramebufferComplete rlFramebufferComplete;
      prlUnloadFramebuffer rlUnloadFramebuffer;
      prlLoadMesh rlLoadMesh;
      prlUpdateMesh rlUpdateMesh;
      prlUpdateMeshAt rlUpdateMeshAt;
      prlDrawMesh rlDrawMesh;
      prlDrawMeshInstanced rlDrawMeshInstanced;
      prlUnloadMesh rlUnloadMesh;

   }
}
