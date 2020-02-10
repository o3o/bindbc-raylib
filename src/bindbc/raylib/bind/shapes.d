module bindbc.raylib.bind.shapes;

import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      /**
       * Draw a pixel
       */
      alias pDrawPixel = void function(int posX, int posY, Color color);
      /**
       * Draw a pixel (Vector version)
       */
      alias pDrawPixelV = void function(Vector2 position, Color color);
      /**
       * Draw a line
       */
      alias pDrawLine = void function(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
      /**
       * Draw a line (Vector version)
       */
      alias pDrawLineV = void function(Vector2 startPos, Vector2 endPos, Color color);
      /**
       * Draw a line defining thickness
       */
      alias pDrawLineEx = void function(Vector2 startPos, Vector2 endPos, float thick, Color color);
      /**
       * Draw a line using cubic-bezier curves in-out
       */
      alias pDrawLineBezier = void function(Vector2 startPos, Vector2 endPos, float thick, Color color);
      /**
       * Draw lines sequence
       */
      alias pDrawLineStrip = void function(Vector2* points, int numPoints, Color color);
      /**
       * Draw a color-filled circle
       */
      alias pDrawCircle = void function(int centerX, int centerY, float radius, Color color);
      /**
       * Draw a piece of a circle
       */
      alias pDrawCircleSector = void function(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
      /**
       * Draw circle sector outline
       */
      alias pDrawCircleSectorLines = void function(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
      /**
       * Draw a gradient-filled circle
       */
      alias pDrawCircleGradient = void function(int centerX, int centerY, float radius, Color color1, Color color2);
      /**
       * Draw a color-filled circle (Vector version)
       */
      alias pDrawCircleV = void function(Vector2 center, float radius, Color color);
      /**
       * Draw circle outline
       */
      alias pDrawCircleLines = void function(int centerX, int centerY, float radius, Color color);
      /**
       * Draw ellipse
       */
      alias pDrawEllipse = void function(int centerX, int centerY, float radiusH, float radiusV, Color color);
      /**
       * Draw ellipse outline
       */
      alias pDrawEllipseLines = void function(int centerX, int centerY, float radiusH, float radiusV, Color color);
      /**
       * Draw ring
       */
      alias pDrawRing = void function(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle,
            int segments, Color color);
      /**
       * Draw ring outline
       */
      alias pDrawRingLines = void function(Vector2 center, float innerRadius, float outerRadius, int startAngle,
            int endAngle, int segments, Color color);
      /**
       * Draw a color-filled rectangle
       */
      alias pDrawRectangle = void function(int posX, int posY, int width, int height, Color color);
      /**
       * Draw a color-filled rectangle (Vector version)
       */
      alias pDrawRectangleV = void function(Vector2 position, Vector2 size, Color color);
      /**
       * Draw a color-filled rectangle
       */
      alias pDrawRectangleRec = void function(Rectangle rec, Color color);
      /**
       * Draw a color-filled rectangle with pro parameters
       */
      alias pDrawRectanglePro = void function(Rectangle rec, Vector2 origin, float rotation, Color color);
      /**
       * Draw a vertical-gradient-filled rectangle
       */
      alias pDrawRectangleGradientV = void function(int posX, int posY, int width, int height, Color color1, Color color2);
      /**
       * Draw a horizontal-gradient-filled rectangle
       */
      alias pDrawRectangleGradientH = void function(int posX, int posY, int width, int height, Color color1, Color color2);
      /**
       * Draw a gradient-filled rectangle with custom vertex colors
       */
      alias pDrawRectangleGradientEx = void function(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
      /**
       * Draw rectangle outline
       */
      alias pDrawRectangleLines = void function(int posX, int posY, int width, int height, Color color);
      /**
       * Draw rectangle outline with extended parameters
       */
      alias pDrawRectangleLinesEx = void function(Rectangle rec, int lineThick, Color color);
      /**
       * Draw rectangle with rounded edges
       */
      alias pDrawRectangleRounded = void function(Rectangle rec, float roundness, int segments, Color color);
      /**
       * Draw rectangle with rounded edges outline
       */
      alias pDrawRectangleRoundedLines = void function(Rectangle rec, float roundness, int segments, int lineThick, Color color);
      /**
       * Draw a color-filled triangle (vertex in counter-clockwise order!)
       */
      alias pDrawTriangle = void function(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
      /**
       * Draw triangle outline (vertex in counter-clockwise order!)
       */
      alias pDrawTriangleLines = void function(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
      /**
       * Draw a triangle fan defined by points (first vertex is the center)
       */
      alias pDrawTriangleFan = void function(Vector2* points, int numPoints, Color color);
      /**
       * Draw a triangle strip defined by points
       */
      alias pDrawTriangleStrip = void function(Vector2* points, int pointsCount, Color color);
      /**
       * Draw a regular polygon (Vector version)
       */
      alias pDrawPoly = void function(Vector2 center, int sides, float radius, float rotation, Color color);
      /**
       * Draw a polygon outline of n sides
       */
      alias pDrawPolyLines = void function(Vector2 center, int sides, float radius, float rotation, Color color);

      /**
       * Check collision between two rectangles
       */
      alias pCheckCollisionRecs = bool function(Rectangle rec1, Rectangle rec2);
      /**
       * Check collision between two circles
       */
      alias pCheckCollisionCircles = bool function(Vector2 center1, float radius1, Vector2 center2, float radius2);
      /**
       * Check collision between circle and rectangle
       */
      alias pCheckCollisionCircleRec = bool function(Vector2 center, float radius, Rectangle rec);
      /**
       * Get collision rectangle for two rectangles collision
       */
      alias pGetCollisionRec = Rectangle function(Rectangle rec1, Rectangle rec2);
      /**
       * Check if point is inside rectangle
       */
      alias pCheckCollisionPointRec = bool function(Vector2 point, Rectangle rec);
      /**
       * Check if point is inside circle
       */
      alias pCheckCollisionPointCircle = bool function(Vector2 point, Vector2 center, float radius);
      /**
       * Check if point is inside a triangle
       */
      alias pCheckCollisionPointTriangle = bool function(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);
   }

   __gshared {
      pDrawPixel DrawPixel;
      pDrawPixelV DrawPixelV;
      pDrawLine DrawLine;
      pDrawLineV DrawLineV;
      pDrawLineEx DrawLineEx;
      pDrawLineBezier DrawLineBezier;
      pDrawLineStrip DrawLineStrip;
      pDrawCircle DrawCircle;
      pDrawCircleSector DrawCircleSector;
      pDrawCircleSectorLines DrawCircleSectorLines;
      pDrawCircleGradient DrawCircleGradient;
      pDrawCircleV DrawCircleV;
      pDrawCircleLines DrawCircleLines;
      pDrawEllipse DrawEllipse;
      pDrawEllipseLines DrawEllipseLines;
      pDrawRing DrawRing;
      pDrawRingLines DrawRingLines;
      pDrawRectangle DrawRectangle;
      pDrawRectangleV DrawRectangleV;
      pDrawRectangleRec DrawRectangleRec;
      pDrawRectanglePro DrawRectanglePro;
      pDrawRectangleGradientV DrawRectangleGradientV;
      pDrawRectangleGradientH DrawRectangleGradientH;
      pDrawRectangleGradientEx DrawRectangleGradientEx;
      pDrawRectangleLines DrawRectangleLines;
      pDrawRectangleLinesEx DrawRectangleLinesEx;
      pDrawRectangleRounded DrawRectangleRounded;
      pDrawRectangleRoundedLines DrawRectangleRoundedLines;
      pDrawTriangle DrawTriangle;
      pDrawTriangleLines DrawTriangleLines;
      pDrawTriangleFan DrawTriangleFan;
      pDrawTriangleStrip DrawTriangleStrip;
      pDrawPoly DrawPoly;
      pDrawPolyLines DrawPolyLines;
      pCheckCollisionRecs CheckCollisionRecs;
      pCheckCollisionCircles CheckCollisionCircles;
      pCheckCollisionCircleRec CheckCollisionCircleRec;
      pGetCollisionRec GetCollisionRec;
      pCheckCollisionPointRec CheckCollisionPointRec;
      pCheckCollisionPointCircle CheckCollisionPointCircle;
      pCheckCollisionPointTriangle CheckCollisionPointTriangle;
   }
}
