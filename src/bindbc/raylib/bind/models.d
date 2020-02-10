/**
 *  Basic geometric 3D shapes drawing functions
 */
module bindbc.raylib.bind.models;

import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      /**
       * Draw a line in 3D world space
       */
      alias pDrawLine3D = void function(Vector3 startPos, Vector3 endPos, Color color);
      /**
       * Draw a point in 3D space, actually a small line
       */
      alias pDrawPoint3D = void function(Vector3 position, Color color);
      /**
       * Draw a circle in 3D world space
       */
      alias pDrawCircle3D = void function(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
      /**
       * Draw cube
       */
      alias pDrawCube = void function(Vector3 position, float width, float height, float length, Color color);
      /**
       * Draw cube (Vector version)
       */
      alias pDrawCubeV = void function(Vector3 position, Vector3 size, Color color);
      /**
       * Draw cube wires
       */
      alias pDrawCubeWires = void function(Vector3 position, float width, float height, float length, Color color);
      /**
       * Draw cube wires (Vector version)
       */
      alias pDrawCubeWiresV = void function(Vector3 position, Vector3 size, Color color);
      /**
       * Draw cube textured
       */
      alias pDrawCubeTexture = void function(Texture2D texture, Vector3 position, float width, float height, float length, Color color);
      /**
       * Draw sphere
       */
      alias pDrawSphere = void function(Vector3 centerPos, float radius, Color color);
      /**
       * Draw sphere with extended parameters
       */
      alias pDrawSphereEx = void function(Vector3 centerPos, float radius, int rings, int slices, Color color);
      /**
       * Draw sphere wires
       */
      alias pDrawSphereWires = void function(Vector3 centerPos, float radius, int rings, int slices, Color color);
      /**
       * Draw a cylinder/cone
       */
      alias pDrawCylinder = void function(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
      /**
       * Draw a cylinder/cone wires
       */
      alias pDrawCylinderWires = void function(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
      /**
       * Draw a plane XZ
       */
      alias pDrawPlane = void function(Vector3 centerPos, Vector2 size, Color color);
      /**
       * Draw a ray line
       */
      alias pDrawRay = void function(Ray ray, Color color);
      /**
       * Draw a grid (centered at (0, 0, 0))
       */
      alias pDrawGrid = void function(int slices, float spacing);
      /**
       * Draw simple gizmo
       */
      alias pDrawGizmo = void function(Vector3 position);

      // Model loading/unloading functions
      /**
       * Load model from files (meshes and materials)
       */
      alias pLoadModel = Model function(const(char)*  fileName);
      /**
       * Load model from generated mesh (default material)
       */
      alias pLoadModelFromMesh = Model function(Mesh mesh);
      /**
       * Unload model from memory (RAM and/or VRAM)
       */
      alias pUnloadModel = void function(Model model);

      // Mesh loading/unloading functions
      /**
       * Load meshes from model file
       */
      alias pLoadMeshes = Mesh* function(const(char)*  fileName, int* meshCount);
      /**
       * Export mesh data to file
       */
      alias pExportMesh = void function(Mesh mesh, const(char)*  fileName);
      /**
       * Unload mesh from memory (RAM and/or VRAM)
       */
      alias pUnloadMesh = void function(Mesh mesh);

      // Material loading/unloading functions
      /**
       * Load materials from model file
       */
      alias pLoadMaterials = Material* function(const(char)*  fileName, int* materialCount);
      /**
       * Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
       */
      alias pLoadMaterialDefault = Material function();
      /**
       * Unload material from GPU memory (VRAM)
       */
      alias pUnloadMaterial = void function(Material material);
      /**
       * Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
       */
      alias pSetMaterialTexture = void function(Material* material, int mapType, Texture2D texture);
      /**
       * Set material for a mesh
       */
      alias pSetModelMeshMaterial = void function(Model* model, int meshId, int materialId);

      // Model animations loading/unloading functions
      /**
       * Load model animations from file
       */
      alias pLoadModelAnimations = ModelAnimation* function(const(char)* fileName, int* animsCount);
      /**
       * Update model animation pose
       */
      alias pUpdateModelAnimation = void function(Model model, ModelAnimation anim, int frame);
      /**
       * Unload animation data
       */
      alias pUnloadModelAnimation = void function(ModelAnimation anim);
      /**
       * Check model animation skeleton match
       */
      alias pIsModelAnimationValid = bool function(Model model, ModelAnimation anim);

      // Mesh generation functions
      /**
       * Generate polygonal mesh
       */
      alias pGenMeshPoly = Mesh function(int sides, float radius);
      /**
       * Generate plane mesh (with subdivisions)
       */
      alias pGenMeshPlane = Mesh function(float width, float length, int resX, int resZ);
      /**
       * Generate cuboid mesh
       */
      alias pGenMeshCube = Mesh function(float width, float height, float length);
      /**
       * Generate sphere mesh (standard sphere)
       */
      alias pGenMeshSphere = Mesh function(float radius, int rings, int slices);
      /**
       * Generate half-sphere mesh (no bottom cap)
       */
      alias pGenMeshHemiSphere = Mesh function(float radius, int rings, int slices);
      /**
       * Generate cylinder mesh
       */
      alias pGenMeshCylinder = Mesh function(float radius, float height, int slices);
      /**
       * Generate torus mesh
       */
      alias pGenMeshTorus = Mesh function(float radius, float size, int radSeg, int sides);
      /**
       * Generate trefoil knot mesh
       */
      alias pGenMeshKnot = Mesh function(float radius, float size, int radSeg, int sides);
      /**
       * Generate heightmap mesh from image data
       */
      alias pGenMeshHeightmap = Mesh function(Image heightmap, Vector3 size);
      /**
       * Generate cubes-based map mesh from image data
       */
      alias pGenMeshCubicmap = Mesh function(Image cubicmap, Vector3 cubeSize);

      // Mesh manipulation functions
      /**
       * Compute mesh bounding box limits
       */
      alias pMeshBoundingBox = BoundingBox function(Mesh mesh);
      /**
       * Compute mesh tangents
       */
      alias pMeshTangents = void function(Mesh* mesh);
      /**
       * Compute mesh binormals
       */
      alias pMeshBinormals = void function(Mesh* mesh);

      // Model drawing functions
      /**
       * Draw a model (with texture if set)
       */
      alias pDrawModel = void function(Model model, Vector3 position, float scale, Color tint);
      /**
       * Draw a model with extended parameters
       */
      alias pDrawModelEx = void function(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
      /**
       * Draw a model wires (with texture if set)
       */
      alias pDrawModelWires = void function(Model model, Vector3 position, float scale, Color tint);
      /**
       * Draw a model wires (with texture if set) with extended parameters
       */
      alias pDrawModelWiresEx = void function(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle,
            Vector3 scale, Color tint);
      /**
       * Draw bounding box (wires)
       */
      alias pDrawBoundingBox = void function(BoundingBox box, Color color);
      /**
       * Draw a billboard texture
       */
      alias pDrawBillboard = void function(Camera camera, Texture2D texture, Vector3 center, float size, Color tint);
      /**
       * Draw a billboard texture defined by sourceRec
       */
      alias pDrawBillboardRec = void function(Camera camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint);

      // Collision detection functions
      /**
       * Detect collision between two spheres
       */
      alias pCheckCollisionSpheres = bool function(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);
      /**
       * Detect collision between two bounding boxes
       */
      alias pCheckCollisionBoxes = bool function(BoundingBox box1, BoundingBox box2);
      /**
       * Detect collision between box and sphere
       */
      alias pCheckCollisionBoxSphere = bool function(BoundingBox box, Vector3 center, float radius);
      /**
       * Detect collision between ray and sphere
       */
      alias pCheckCollisionRaySphere = bool function(Ray ray, Vector3 center, float radius);
      /**
       * Detect collision between ray and sphere, returns collision point
       */
      alias pCheckCollisionRaySphereEx = bool function(Ray ray, Vector3 center, float radius, Vector3 * collisionPoint);
      /**
       * Detect collision between ray and box
       */
      alias pCheckCollisionRayBox = bool function(Ray ray, BoundingBox box);
      /**
       * Get collision info between ray and model
       */
      alias pGetCollisionRayModel = RayHitInfo function(Ray ray, Model model);
      /**
       * Get collision info between ray and triangle
       */
      alias pGetCollisionRayTriangle = RayHitInfo function(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
      /**
       * Get collision info between ray and ground plane (Y-normal plane)
       */
      alias pGetCollisionRayGround = RayHitInfo function(Ray ray, float groundHeight);
   }
   __gshared {
      pDrawLine3D DrawLine3D;
      pDrawPoint3D DrawPoint3D;
      pDrawCircle3D DrawCircle3D;
      pDrawCube DrawCube;
      pDrawCubeV DrawCubeV;
      pDrawCubeWires DrawCubeWires;
      pDrawCubeWiresV DrawCubeWiresV;
      pDrawCubeTexture DrawCubeTexture;
      pDrawSphere DrawSphere;
      pDrawSphereEx DrawSphereEx;
      pDrawSphereWires DrawSphereWires;
      pDrawCylinder DrawCylinder;
      pDrawCylinderWires DrawCylinderWires;
      pDrawPlane DrawPlane;
      pDrawRay DrawRay;
      pDrawGrid DrawGrid;
      pDrawGizmo DrawGizmo;
      pLoadModel LoadModel;
      pLoadModelFromMesh LoadModelFromMesh;
      pUnloadModel UnloadModel;
      pLoadMeshes LoadMeshes;
      pExportMesh ExportMesh;
      pUnloadMesh UnloadMesh;
      pLoadMaterials LoadMaterials;
      pLoadMaterialDefault LoadMaterialDefault;
      pUnloadMaterial UnloadMaterial;
      pSetMaterialTexture SetMaterialTexture;
      pSetModelMeshMaterial SetModelMeshMaterial;
      pLoadModelAnimations LoadModelAnimations;
      pUpdateModelAnimation UpdateModelAnimation;
      pUnloadModelAnimation UnloadModelAnimation;
      pIsModelAnimationValid IsModelAnimationValid;
      pGenMeshPoly GenMeshPoly;
      pGenMeshPlane GenMeshPlane;
      pGenMeshCube GenMeshCube;
      pGenMeshSphere GenMeshSphere;
      pGenMeshHemiSphere GenMeshHemiSphere;
      pGenMeshCylinder GenMeshCylinder;
      pGenMeshTorus GenMeshTorus;
      pGenMeshKnot GenMeshKnot;
      pGenMeshHeightmap GenMeshHeightmap;
      pGenMeshCubicmap GenMeshCubicmap;
      pMeshBoundingBox MeshBoundingBox;
      pMeshTangents MeshTangents;
      pMeshBinormals MeshBinormals;
      pDrawModel DrawModel;
      pDrawModelEx DrawModelEx;
      pDrawModelWires DrawModelWires;
      pDrawModelWiresEx DrawModelWiresEx;
      pDrawBoundingBox DrawBoundingBox;
      pDrawBillboard DrawBillboard;
      pDrawBillboardRec DrawBillboardRec;
      pCheckCollisionSpheres CheckCollisionSpheres;
      pCheckCollisionBoxes CheckCollisionBoxes;
      pCheckCollisionBoxSphere CheckCollisionBoxSphere;
      pCheckCollisionRaySphere CheckCollisionRaySphere;
      pCheckCollisionRaySphereEx CheckCollisionRaySphereEx;
      pCheckCollisionRayBox CheckCollisionRayBox;
      pGetCollisionRayModel GetCollisionRayModel;
      pGetCollisionRayTriangle GetCollisionRayTriangle;
      pGetCollisionRayGround GetCollisionRayGround;
   }
}
