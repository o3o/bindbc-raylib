module bindbc.raylib.bind.shaders;
import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      // Shader loading/unloading functions
      /**
       *  Load chars array from text file
       */
      alias pLoadText = char* function(const(char)* fileName);
      /**
       * Load shader from files and bind default locations
       */
      alias pLoadShader = Shader function(const(char)* vsFileName, const(char)* fsFileName);
      /**
       * Load shader from code strings and bind default locations
       */
      alias pLoadShaderCode = Shader function(char* vsCode, char* fsCode);
      /**
       * Unload shader from GPU memory (VRAM)
       */
      alias pUnloadShader = void function(Shader shader);

      /**
       * Get default shader
       */
      alias pGetShaderDefault = Shader function();
      /**
       * Get default texture
       */
      alias pGetTextureDefault = Texture2D function();
      /**
       * Get texture to draw shapes
       */
      alias pGetShapesTexture = Texture2D function();
      /**
       * Get texture rectangle to draw shapes
       */
      alias pGetShapesTextureRec = Rectangle function();
      /**
       * Define default texture used to draw shapes
       */
      alias pSetShapesTexture = void function(Texture2D texture, Rectangle source);

      // Shader configuration functions
      /**
       * Get shader uniform location
       */
      alias pGetShaderLocation = int function(Shader shader, const(char)* uniformName);
      /**
       * Set shader uniform value
       */
      alias pSetShaderValue = void function(Shader shader, int uniformLoc, const void* value, int uniformType);
      /**
       * Set shader uniform value vector
       */
      alias pSetShaderValueV = void function(Shader shader, int uniformLoc, const void* value, int uniformType, int count);
      /**
       * Set shader uniform value (matrix 4x4)
       */
      alias pSetShaderValueMatrix = void function(Shader shader, int uniformLoc, Matrix mat);
      /**
       * Set shader uniform value for texture
       */
      alias pSetShaderValueTexture = void function(Shader shader, int uniformLoc, Texture2D texture);
      /**
       * Set a custom projection matrix (replaces internal projection matrix)
       */
      alias pSetMatrixProjection = void function(Matrix proj);
      /**
       * Set a custom modelview matrix (replaces internal modelview matrix)
       */
      alias pSetMatrixModelview = void function(Matrix view);
      /**
       * Get internal modelview matrix
       */
      alias pGetMatrixModelview = Matrix function();
      /**
       * Get internal projection matrix
       */
      alias pGetMatrixProjection = Matrix function();

      // Shading begin/end functions
      /**
       * Begin custom shader drawing
       */
      alias pBeginShaderMode = void function(Shader shader);
      /**
       * End custom shader drawing (use default shader)
       */
      alias pEndShaderMode = void function();
      /**
       * Begin blending mode (alpha, additive, multiplied)
       */
      alias pBeginBlendMode = void function(int mode);
      /**
       * End blending mode (reset to default: alpha blending)
       */
      alias pEndBlendMode = void function();

      // VR control functions
      /**
       * Init VR simulator for selected device parameters
       */
      alias pInitVrSimulator = void function();
      /**
       * Close VR simulator for current device
       */
      alias pCloseVrSimulator = void function();
      /**
       * Update VR tracking (position and orientation) and camera
       */
      alias pUpdateVrTracking = void function(Camera* camera);
      /**
       * Set stereo rendering configuration parameters
       */
      alias pSetVrConfiguration = void function(VrDeviceInfo info, Shader distortion);
      /**
       * Detect if VR simulator is ready
       */
      alias pIsVrSimulatorReady = bool function();
      /**
       * Enable/Disable VR experience
       */
      alias pToggleVrMode = void function();
      /**
       * Begin VR simulator stereo rendering
       */
      alias pBeginVrDrawing = void function();
      /**
       * End VR simulator stereo rendering
       */
      alias pEndVrDrawing = void function();
   }
   __gshared {
      pLoadText LoadText;
      pLoadShader LoadShader;
      pLoadShaderCode LoadShaderCode;
      pUnloadShader UnloadShader;
      pGetShaderDefault GetShaderDefault;
      pGetTextureDefault GetTextureDefault;
      pGetShapesTexture GetShapesTexture;
      pGetShapesTextureRec GetShapesTextureRec;
      pSetShapesTexture SetShapesTexture;
      pGetShaderLocation GetShaderLocation;
      pSetShaderValue SetShaderValue;
      pSetShaderValueV SetShaderValueV;
      pSetShaderValueMatrix SetShaderValueMatrix;
      pSetShaderValueTexture SetShaderValueTexture;
      pSetMatrixProjection SetMatrixProjection;
      pSetMatrixModelview SetMatrixModelview;
      pGetMatrixModelview GetMatrixModelview;
      pGetMatrixProjection GetMatrixProjection;
      pBeginShaderMode BeginShaderMode;
      pEndShaderMode EndShaderMode;
      pBeginBlendMode BeginBlendMode;
      pEndBlendMode EndBlendMode;
      pInitVrSimulator InitVrSimulator;
      pCloseVrSimulator CloseVrSimulator;
      pUpdateVrTracking UpdateVrTracking;
      pSetVrConfiguration SetVrConfiguration;
      pIsVrSimulatorReady IsVrSimulatorReady;
      pToggleVrMode ToggleVrMode;
      pBeginVrDrawing BeginVrDrawing;
      pEndVrDrawing EndVrDrawing;
   }
}
